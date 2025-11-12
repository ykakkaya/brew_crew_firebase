import 'package:brew_crew/providers/auth_service_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: const Text('Brew - Crew Home Sayfası',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.brown[400],
        actions: [
          IconButton(
            icon: const Icon(Icons.logout,color: Colors.white,),
            onPressed: () async {
              await ref.read(authServiceProvider).signOut();
            },
          ),
          IconButton(onPressed: (){}, icon: Icon( Icons.settings,color: Colors.white,) )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Ana Sayfa\nGiriş Yapan Kullanıcı\n ${ref.read(authServiceProvider).currentUser?.uid}'),
            
          ],
        ),
      ),
    );
  }
}