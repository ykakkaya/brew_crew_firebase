import 'package:brew_crew/providers/login_register_switch_provider.dart';
import 'package:brew_crew/screens/authenticate/register_page.dart';
import 'package:brew_crew/screens/authenticate/sign_in_page.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticatePage extends ConsumerStatefulWidget {
  const AuthenticatePage({super.key});

  @override
  ConsumerState<AuthenticatePage> createState() => _AuthenticatePageState();
}

class _AuthenticatePageState extends ConsumerState<AuthenticatePage> {
  @override
  Widget build(BuildContext context) {
    if (ref.watch(loginRegisterSwitchProvider)) {
      return SignInPage();
    } else {
      return RegisterPage();
    }
    //return SignInPage();
  }
}