import 'package:brew_crew/providers/auth_service_provider.dart';
import 'package:brew_crew/screens/authenticate/authenticate.dart';
import 'package:brew_crew/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Wrapper extends ConsumerWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStream=ref.watch(authServiceProvider).user;
    return Scaffold(
      body: StreamBuilder(stream: authStream, builder: (context, snapshot){
        if(snapshot.connectionState==ConnectionState.active){
          final user=snapshot.data;
          if(user==null){
            return const AuthenticatePage();
          }else{
            return const Home();
          }
        }else {
          return const Center(child: CircularProgressIndicator(),);
        }
      }),
    );
  }
}