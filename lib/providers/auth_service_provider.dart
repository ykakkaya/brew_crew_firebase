import 'package:brew_crew/services/auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authServiceProvider=Provider<AuthService>( (ref){
  return AuthService();
} );