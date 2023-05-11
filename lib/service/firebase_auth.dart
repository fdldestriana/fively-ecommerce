import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fively_ecommerce/model/failure.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  static Future<UserCredential> doGoogleLogin() async {
    GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
    UserCredential userCredential;

    try {
      await googleSignIn.disconnect();
    } catch (_) {}

    try {
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return userCredential;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<User?> doEmailSignUp(
      {required String name,
      required String email,
      required String password,
      required String photoProfile}) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    UserCredential? userCredential;
    try {
      userCredential = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseFirestore.collection('users').doc(userCredential.user!.uid).set(
        {
          'uid': userCredential.user!.uid,
          'firstName': name.split(' ')[0],
          'lastName': name.split(' ')[1],
          'email': email,
          'photoProfile': photoProfile,
          'role': 'buyer'
        },
      );
      // return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw Failure(message: e.message as String);
      }
      if (e.code == 'invalid-email') {
        throw Failure(message: e.message as String);
      }
      if (e.code == 'operation-not-allowed') {
        throw Failure(message: e.message as String);
      }
      if (e.code == 'weak-password') {
        throw Failure(message: e.message as String);
      }
    }
    return userCredential!.user;
  }
}
