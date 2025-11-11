import 'package:brew_crew/Models/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as FBAuth;


class AuthService{

  final FBAuth.FirebaseAuth _auth = FBAuth.FirebaseAuth.instance;
    //Firebase user to custom User model
  User?  _userFromFirebaseUser(FBAuth.User? user) {
    // Eğer Firebase User null değilse, sadece uid'sini alıp kendi User modelinizi döndürün.
    // Eğer null ise, null döndürün.
    return user != null ? User(uid: user.uid) : null;
  }

  //auth change user stream
  User? get currentUser => _userFromFirebaseUser(_auth.currentUser);
  
  Stream<User?> get user {
    return _auth.authStateChanges().map((e)=>_userFromFirebaseUser(e));
  }


  //Sign in anonymously

  Future<User?> signInAnon() async {
    try {
      FBAuth.UserCredential userCredential = await _auth.signInAnonymously();
      FBAuth.User? _user = userCredential.user;
      return _userFromFirebaseUser(_user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Sign in email & password

  Future<User?> signInWithEmailAndPassword({required String email,required String password,}
      ) async {
    try {
      FBAuth.UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      User? user = _userFromFirebaseUser( userCredential.user);
      return user;
    }catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Register with email & password

  Future<User?> createUser({required String email,required String password,}
      ) async {
    try {
      FBAuth.UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      User? user = _userFromFirebaseUser(userCredential.user);
      return user;
    }catch (e) {
      print(e.toString());
      return null;
    }
  }


  //Sign out

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}