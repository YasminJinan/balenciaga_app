import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';



class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // register buat nyimpen ke firestore
  Future<User?> signUpWithEmail(String email, String password, String fullName) async {
    try {
      final UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;

      if (user != null) {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          "fullName": fullName,
          "email": email,
          "createdAt": DateTime.now(),
        });
      }

      return user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  // login
  Future<User?> signInWithEmail(String email, String password) async {
    try {
      final UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }


  // google sign in
Future<User?> signInWithGoogle() async {
  try {
    final googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return null;

    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    UserCredential result = await _auth.signInWithCredential(credential);
    User? user = result.user;

    if (user != null) {
      final userDoc = FirebaseFirestore.instance.collection('users').doc(user.uid);
      final snapshot = await userDoc.get();

      if (!snapshot.exists) {
        await userDoc.set({
          "fullName": user.displayName ?? "",
          "email": user.email,
          "createdAt": DateTime.now(),
        });
      }
    }

    return user;
  } catch (e) {
    print("Google Sign-In error: $e");  // 🔥 Tambahin ini biar keliatan error detail
    throw Exception(e.toString());
  }
}
}