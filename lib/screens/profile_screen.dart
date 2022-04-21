import 'package:buletin/utils/constants.dart';
import 'package:buletin/models/account.dart';
import 'package:buletin/screens/change_password_screen.dart';
import 'package:buletin/widgets/other/appbar.dart';
import 'package:flutter/material.dart';
import 'package:buletin/utils/extension_image.dart';

class ProfileScreen extends StatelessWidget {
  final Account account;

  const ProfileScreen({
    Key? key,
    required this.account,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: SizedBox(
          width: 500,
          height: 600,
          // padding: const EdgeInsets.all(30),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(cardBorderRadius),
            ),
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Change Profile Picture
                    },
                    child: Stack(
                      children: [
                        ClipOval(
                          child: Image.network(
                            "https://lh3.googleusercontent.com/ogw/ADea4I59lb97jZRtDffSpVpk2RXi52W5S0Y3cXq8VIrkCQ=s83-c-mo",
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                            errorBuilder: (context, exeption, stackTrace) {
                              return Image.asset(
                                'placeholder'.jpg,
                                fit: BoxFit.cover,
                                height: 100,
                                width: 100,
                              );
                            },
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            child: const Icon(
                              Icons.camera_alt_rounded,
                              color: Colors.grey,
                              size: 18,
                            ),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 4,
                                    offset: const Offset(0, 3),
                                    // changes position of shadow
                                  ),
                                ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Text(
                      account.accountFullname.toString(),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 20,
                          ),
                    ),
                  ),
                  const Divider(),
                  const SizedBox(height: 10),
                  ListTile(
                    leading: const Icon(Icons.mail_rounded),
                    title: Text(account.accountEmail.toString()),
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    leading: const Icon(Icons.phone_rounded),
                    title: Text(account.accountPhoneNumber.toString()),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      "Interest",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 15),
                    ),
                  ),
                  const Divider(),
                  Expanded(
                    child: Wrap(
                      spacing: 3.0, // gap between adjacent chips
                      runSpacing: 2.0, // gap between lines
                      children: account.interests
                          .map((e) => Chip(
                                padding: const EdgeInsets.all(2),
                                label: Text(
                                  e,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: Colors.white),
                                ),
                                backgroundColor: Theme.of(context).primaryColor,
                              ))
                          .toList(),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangePasswordScreen(
                            email: account.accountEmail,
                          ),
                        ),
                      );
                    },
                    child: const Text("Change Password"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
