import 'package:brew_crew/Models/user.dart';
import 'package:brew_crew/providers/auth_service_provider.dart';
import 'package:brew_crew/providers/login_register_switch_provider.dart';
import 'package:brew_crew/screens/authenticate/register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<SignInPage> createState() => _SignInPageConsumerState();
}

class _SignInPageConsumerState extends ConsumerState<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text(
          'Brew - Crew Login Sayfası',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown[400],
        actions: [
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(value: ref.watch(loginRegisterSwitchProvider), onChanged: (value){
              ref.read(loginRegisterSwitchProvider.notifier).toggle();
            },
            activeTrackColor: Colors.brown.shade200,
            inactiveTrackColor: Colors.brown.shade200,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                onSaved: (value) {
                  emailController.text = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return 'Lütfen email giriniz';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Email',
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                onSaved: (value) {
                  passwordController.text = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 6) {
                    return 'Lütfen şifre giriniz';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await ref
                            .read(authServiceProvider)
                            .signInWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                      }
                    },
                    child: Text(
                      'Giriş Yap',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                    ),
                    onPressed: () async {
                      await ref.read(authServiceProvider).signInAnon();
                    },
                    child: Text(
                      'Demo Giriş',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  /* ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child: Text(
                      "Kayıt Ol",
                      style: TextStyle(color: Colors.white),
                    ),
                  ), */
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
