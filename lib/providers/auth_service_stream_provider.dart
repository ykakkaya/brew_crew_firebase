import 'package:brew_crew/Models/user.dart';
import 'package:brew_crew/providers/auth_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class AuthServiceStreamNotifier extends StreamNotifier<User?> {
  
  @override
  Stream<User?> build() {
    return ref.read(authServiceProvider).user;
  }
}

final authStateStreamProvider = 
    StreamNotifierProvider<AuthServiceStreamNotifier, User?>(
        AuthServiceStreamNotifier.new,
);