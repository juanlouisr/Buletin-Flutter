import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:buletin/screens/home_screen.dart';
import 'package:buletin/screens/interest_choose_screen.dart';
import 'package:buletin/widgets/other/sidebar.dart';
import 'package:buletin/api/auth_api.dart';
import 'package:provider/provider.dart';
import 'package:buletin/widgets/other/appbar.dart';
import 'package:form_validator/form_validator.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  Duration get loginTime => const Duration(milliseconds: 2250);
  bool isSignUp = false;
  late SignupData signupData;
  final authApi = AuthApi();
  final validateName = ValidationBuilder().minLength(1).build();
  final validatePhone = ValidationBuilder().minLength(1).phone().build();

  Future<String?> _signupUser(SignupData data) {
    setState(() => isSignUp = false);
    return Future.delayed(loginTime).then((_) {
      setState(() => isSignUp = true);
      setState(() => signupData = data);
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideNavigationBar(),
      appBar: const CustomAppBar(),
      body: FlutterLogin(
        onLogin: Provider.of<AuthApi>(context, listen: false).authUser,
        onSignup: _signupUser,
        onSubmitAnimationCompleted: () {
          if (!isSignUp) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => HomeScreen(),
            )); 
          } else {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => InterestChooseScreen(signupData: signupData),
            ));
          }
        },
        onRecoverPassword: authApi.recoverPassword,
        messages: LoginMessages(
          signUpSuccess: 'Please choose your interest'
        ),
        additionalSignupFields: [
          UserFormField(
            icon: const Icon(Icons.people),
            keyName: 'name', 
            fieldValidator: (val) {
              return validateName(val);
            },
            userType: LoginUserType.name),
          UserFormField(
            icon: const Icon(Icons.local_phone),
            keyName: 'phone', 
            fieldValidator: (val) {
              return validatePhone(val);
            },
            userType: LoginUserType.phone
          ),
        ]
      ),
    );
  }
}