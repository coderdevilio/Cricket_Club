import 'package:cricket/models/authModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  FirebaseAuth _auth = FirebaseAuth.instance;

  

  Stream<AuthModel> get user {
    return _auth.authStateChanges().map((User firebaseUser) =>
        (firebaseUser != null)
            ? AuthModel.fromFirebaseUser(user: firebaseUser)
            : null);
  }

  Future<String> signOut() async {
    String retVal = "error";

    try {
      await _auth.signOut();
      retVal = "success";
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> signUpUser(
      String email, String password, String fullName) async {
    String retVal = "error";
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // String _returnString = await OurDatabase().createUser(_user);
      // if (_returnString == "success") {
      //   retVal = "success";
      // }
      retVal = 'success';

      // OurDatabase().createUser(_user);

    } on PlatformException catch (e) {
      retVal = e.message;
    } catch (e) {
      print(e);
    }

    return retVal;
  }

  Future<String> loginUserWithEmail(String email, String password) async {
    String retVal = "error";

    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      //     _currentUser = await OurDatabase().getUserInfo(_authResult.user.uid);
      // if (_currentUser != null) {
      //   retVal = "success";
      // }

    } on PlatformException catch (e) {
      retVal = e.message;
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> loginUserWithGoogle() async {
    String retVal = "error";
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );

    try {
      GoogleSignInAccount _googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication _googleAuth = await _googleUser.authentication;
      // ignore: deprecated_member_use
      final AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: _googleAuth.idToken, accessToken: _googleAuth.accessToken);

      UserCredential _authResult = await _auth.signInWithCredential(credential);

      if (_authResult.additionalUserInfo.isNewUser) {
        // OurDatabase().createUser(_user);
      }

      //_currentUser = await OurDatabase().getUserInfo(_authResult.user.uid);
      // if (_currentUser != null) {
      //   retVal = "success";
      // }
    } on PlatformException catch (e) {
      retVal = e.message;
    } catch (e) {
      print(e);
    }

    return retVal;
  }
}
