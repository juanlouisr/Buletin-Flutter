import 'package:buletin/api/auth_api.dart';
import 'package:buletin/utils/constants.dart';
import 'package:buletin/widgets/other/appbar.dart';
import 'package:buletin/widgets/other/rounded_password_field.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatelessWidget {
  final String email;

  const ChangePasswordScreen({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String oldPass = "";
    String newPass = "";

    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: SingleChildScrollView(
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundedPasswordField(
                      key: key,
                      hintText: "old password",
                      onChanged: (str) {
                        oldPass = str;
                      },
                    ),
                    const SizedBox(height: 20),
                    RoundedPasswordField(
                      key: key,
                      hintText: "new password",
                      onChanged: (str) {
                        newPass = str;
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        var response = await AuthApi.changePassword(
                          email: email,
                          oldPass: oldPass,
                          newPass: newPass,
                        );
                        if (response == true) {
                          Navigator.pop(context);
                          openDialog(context, "Password Changed Successfully!");
                        } else {
                          openDialog(context, "Invalid Credentials!");
                        }
                      },
                      child: const Text("Change My Password!"),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future openDialog(BuildContext context, String message) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(message),
            actions: [
              TextButton(
                  onPressed: Navigator.of(context).pop, child: const Text("OK"))
            ],
          ));
}
