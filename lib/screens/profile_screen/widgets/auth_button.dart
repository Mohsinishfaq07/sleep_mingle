import 'package:bettersleep/screens/register_screen/register_screen.dart';
import 'package:bettersleep/screens/sign_in_screen/sign_in_screen.dart';
import 'package:bettersleep/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/global_variables.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final bool isLoginButton;
  const AuthButton(
      {super.key, required this.text, required this.isLoginButton});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isLoginButton
            ? Navigator.of(context).push(createRightToLeftRoute(
            const SignInScreen(), const RouteSettings()))
            : Navigator.of(context).push(createRightToLeftRoute(
            const RegisterScreen(), const RouteSettings()));
      },
      child: Container(
        decoration: BoxDecoration(
            color: isLoginButton ? Colors.transparent : Colors.white,
            border: Border.all(color: lightWhiteColor),
            borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 8),
        child: Text(
          text,
          style: TextStyle(
              color: isLoginButton ? Colors.white : Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
