import 'package:brew_crew/screens/authenticate/sign_in_page.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class AuthenticatePage extends StatefulWidget {
  const AuthenticatePage({super.key});

  @override
  State<AuthenticatePage> createState() => _AuthenticatePageState();
}

class _AuthenticatePageState extends State<AuthenticatePage> {
  @override
  Widget build(BuildContext context) {
    return SignInPage();
  }
}