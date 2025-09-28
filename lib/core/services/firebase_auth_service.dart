import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruit_dashboard/core/errors/exceptions.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('erro in FirebaaseauthService.createUserWithEmailAndPassword: ${e.toString()} Code ${e.code}');
      if (e.code == 'weak-password') {
        throw CustomException('كلمة المرور ضعيفة جدًا.');
      } else if (e.code == 'invalid-email') {
        throw CustomException('البريد الإلكتروني غير صالح.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException('البريد الإلكتروني مستخدم بالفعل.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
            'الاتصال بالشبكة فشل. يرجى التحقق من الاتصال بالشبكة.');
      } else {
        throw CustomException('حدث خطأ أثناء إنشاء الحساب');
      }
    } catch (e) {
      log('erro in FirebaaseauthService.createUserWithEmailAndPassword: ${e.toString()}');
      throw CustomException('حدث خطاء غير معروف أثناء إنشاء الحساب');
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('erro in FirebaaseauthService.logInWithEmailAndPassword: ${e.toString()} Code ${e.code}');
      if (e.code == 'user-not-found') {
        throw CustomException('البريد الالكتروني او كلمة المرور غير صحيحة.');
      } else if (e.code == 'wrong-password') {
        throw CustomException('البريد الالكتروني او كلمة المرور غير صحيحة.');
      } else if (e.code == 'invalid-email') {
        throw CustomException('البريد الإلكتروني غير صالح.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
            'الاتصال بالشبكة فشل. يرجى التحقق من الاتصال بالشبكة.');
      } else {
        log(e.toString());
        throw CustomException('حدث خطأ أثناء تسجيل الدخول');
      }
    } catch (e) {
      log('erro in FirebaaseauthService.logInWithEmailAndPassword: ${e.toString()}');
      throw CustomException('حدث خطاء غير معروف أثناء تسجيل الدخول');
    }
  }

  // Future<User> signInWithGoogle() async {
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  //   final GoogleSignInAuthentication? googleAuth =
  //       await googleUser?.authentication;

  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );

  //   return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  // }

  // Future<User> signInWithFacebook() async {
  //   // Trigger the sign-in flow
  //   final LoginResult loginResult = await FacebookAuth.instance.login();

  //   // Create a credential from the access token
  //   final OAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

  //   // Once signed in, return the UserCredential
  //   return (await FirebaseAuth.instance
  //           .signInWithCredential(facebookAuthCredential))
  //       .user!;
  // }

  Future deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

  bool isUserSignedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }
}
