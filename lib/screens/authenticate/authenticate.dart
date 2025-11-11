import 'package:flutter/material.dart';

class AuthenticatePage extends StatefulWidget {
  const AuthenticatePage({super.key});

  @override
  State<AuthenticatePage> createState() => _AuthenticatePageState();
}

class _AuthenticatePageState extends State<AuthenticatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Authenticate Screen'),
      ),
    );
  }
}