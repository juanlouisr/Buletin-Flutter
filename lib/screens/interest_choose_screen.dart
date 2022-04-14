import 'package:flutter/material.dart';
import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:radis_rounded_button/radis_rounded_button.dart';
import 'package:buletin/widgets/other/sidebar.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:buletin/api/auth_api.dart';
import 'package:provider/provider.dart';
import 'package:buletin/screens/home_screen.dart';
import 'package:buletin/api/interest_api.dart';
import 'package:buletin/widgets/other/appbar.dart';
import 'package:buletin/constants.dart';

class InterestChooseScreen extends StatefulWidget {
  final SignupData signupData;
  const InterestChooseScreen({required this.signupData});

  @override
  _InterestChooseScreen createState() => _InterestChooseScreen();
}

class _InterestChooseScreen extends State<InterestChooseScreen> {
  List<dynamic> interests = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const SideNavigationBar(),
        appBar: CustomAppBar(),
        backgroundColor: colorPrimary,
        body: Center(
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  width: 800,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Please choose your interest', 
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 20),
                      ),
                      FutureBuilder(
                        future: InterestAPI.get(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ChipsChoice<dynamic>.multiple(
                              value: interests,
                              onChanged: (val) => setState(() => interests = val),
                              choiceItems: snapshot.data as List<C2Choice<dynamic>>,
                              wrapped: true,
                              choiceStyle: C2ChoiceStyle(
                                labelStyle: TextStyle(color: Colors.black),
                                color: colorPrimary,
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20)
                              ),
                            );
                          }
                          return CircularProgressIndicator();
                        },
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 40),
                        width: 150,
                        child: RoundedButton(
                          widget: Text(
                            'SUBMIT',
                            style: TextStyle(color: Colors.white),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                          backgroundColor: colorPrimary,
                          radius: 20,
                          onPressed: () async {
                            var interestString = interests.join(',');
                            var success = await Provider.of<AuthApi>(context, listen: false).signupUser(widget.signupData, interestString);
                            if (success) {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                            }
                          },
                        )
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}