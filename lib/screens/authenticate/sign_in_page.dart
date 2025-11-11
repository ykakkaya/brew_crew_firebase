import 'package:brew_crew/Models/user.dart';
import 'package:brew_crew/providers/auth_service_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<SignInPage> createState() => _SignInPageConsumerState();
}

class _SignInPageConsumerState extends ConsumerState<SignInPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text('Brew - Crew',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.brown[400],
        ),
      body: Center(
        child: ElevatedButton(onPressed: ()async{
          User? user=await ref.read(authServiceProvider).signInAnon();
          print(user?.uid);
        }, child: Text( 'Sign in Anonymously'))
      ),
    );
}}