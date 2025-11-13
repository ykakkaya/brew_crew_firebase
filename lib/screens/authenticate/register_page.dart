import 'package:brew_crew/providers/auth_service_provider.dart';
import 'package:brew_crew/providers/login_register_switch_provider.dart';
import 'package:brew_crew/screens/authenticate/sign_in_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
      TextEditingController emailController = TextEditingController();
      TextEditingController passwordController = TextEditingController();
      GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text(
          'Brew - Crew Register Sayfası',
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
          ),
          
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
                  if (value == null || value.isEmpty) {
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
                  if (value == null || value.isEmpty) {
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                    ),
                    onPressed: () async{
                      if(_formKey.currentState!.validate()){
                      await ref
                           .read(authServiceProvider)
                           .createUser(
                             email: emailController.text,
                             password: passwordController.text,
                           );
                           }
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignInPage()));
                     
                    },
                    child: Text('Kayıt Ol',style: TextStyle(color: Colors.white),),
                  ),
                  SizedBox(width: 20),
                  
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}