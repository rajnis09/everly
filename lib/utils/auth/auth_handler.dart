import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser _user;

  Future<FirebaseUser> getCurrentUser() async {
    try {
      _user = await _auth.currentUser();
    } catch (e) {
      _user = null;
      print('authHandler: error in currentUser $e');
    }
    return _user;
  }

  Future<void> userReload() async {
    try {
      _user = await _auth.currentUser();
      await _user.reload();
      _user = await _auth.currentUser();
    } catch (e) {
      print("authHandler: Error in userReload $e");
    }
  }

  Future<void> sendVerificationLink() async {
    try {
      _user = await _auth.currentUser();
      _user.sendEmailVerification();
    } catch (e) {
      print('authHandler: error in send verificaiton $e');
    }
  }

  Future<int> handleSignInEmail(String email, String password) async {
    int value = 0;
    try {
      AuthResult authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      final FirebaseUser user = authResult.user;
      assert(user != null);
      assert(await user.getIdToken() != null);

      _user = await _auth.currentUser();
      assert(user.uid == _user.uid);

      print('signInEmail succeeded: ${user.toString()}');
    } catch (e) {
      switch (e.code) {
        case 'ERROR_INVALID_EMAIL':
          value = 1;
          break;
        case 'ERROR_WRONG_PASSWORD':
          value = 1;
          break;
        case 'ERROR_USER_NOT_FOUND':
          value = 2;
          break;
        case 'ERROR_TOO_MANY_REQUESTS':
          value = 3;
          break;
        case 'ERROR_OPERATION_NOT_ALLOWED':
          value = 4;
          break;
        default:
          value = 4;
          break;
      }
      print("SignInError message is ${e.code}");
    }
    return value;
  }

  Future<int> handleSignUp(
      String email, String password, String name, String photoUrl) async {
    int value = 0;
    try {
      AuthResult authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _user = authResult.user;

      assert(_user != null);
      assert(await _user.getIdToken() != null);
      await updateUserData(name, photoUrl);
      print(name);
      await getCurrentUser();
      await userReload();
      await getCurrentUser();
      value = 0;
      print("User created Successfully");
    } catch (e) {
      switch (e.code) {
        case 'ERROR_INVALID_EMAIL':
          value = 1;
          break;
        case 'ERROR_WEAK_PASSWORD':
          value = 2;
          break;
        case 'ERROR_EMAIL_ALREADY_IN_USE':
          value = 3;
          break;
        default:
          value = 4;
          break;
      }
      print("SignUnError message is ${e.code}");
    }
    return value;
  }

  Future<void> updateUserData(String name, String photoUrl) async {
    UserUpdateInfo updateInfo = UserUpdateInfo();
    updateInfo.displayName = name;
    updateInfo.photoUrl = photoUrl ??
        "https://drive.google.com/uc?export=download&id=1hBu6cfZvlVFm3-AB8PBx2K4AZoiAXf4e";
    _user = await _auth.currentUser();
    await _user.updateProfile(updateInfo);
  }

  Future<int> sendPasswordResetLink(String email) async {
    int res = 0;
    await Future.delayed(Duration(milliseconds: 800));
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      switch (e.code) {
        case 'ERROR_INVALID_EMAIL':
          res = 1;
          break;
        case 'ERROR_USER_NOT_FOUND':
          res = 2;
          break;
        default:
          res = 3;
          break;
      }
    }
    return res;
  }

  // Future<int> signInWithPhone(String name, String phoneNumber) async {
  //   int res = 0;
  //   AuthResult authResult;
  //   AuthCredential authCredential;

  //   await _auth.verifyPhoneNumber(
  //       phoneNumber: phoneNumber,
  //       timeout: Duration(seconds: 10),
  //       verificationCompleted: (authCredential) async {
  //         try {
  //           authResult = await _auth.signInWithCredential(authCredential);
  //           _user = authResult.user;
  //           // print("Signed IN");
  //           if (authResult.additionalUserInfo.isNewUser) {
  //             await updateUserData(name, null);
  //             await getCurrentUser();
  //             await userReload();
  //             await getCurrentUser();
  //             res = 1;
  //           }
  //         } catch (e) {
  //           switch (e.code) {
  //             case 'ERROR_ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL':
  //               res = 2;
  //               break;
  //             case 'ERROR_INVALID_CREDENTIAL':
  //               res = 3;
  //               break;
  //             case 'ERROR_USER_DISABLED':
  //               res = 4;
  //               break;
  //             case 'ERROR_OPERATION_NOT_ALLOWED':
  //               res = 5;
  //               break;
  //             case 'ERROR_INVALID_ACTION_CODE':
  //               res = 6;
  //               break;
  //             default:
  //               res = 7;
  //               break;
  //           }
  //         }
  //       },
  //       verificationFailed: (authException) {
  //         res = 8;
  //         print(
  //             'AuthException in authHandler : ${authException.code} ${authException.message}');
  //       },
  //       codeSent: (String verificationId, [int forceResendingToken]) async {
  //         // String code = await otpRetrieveDialog(context);
  //         String code = '232345';
  //         print(code);
  //         authCredential = PhoneAuthProvider.getCredential(
  //             verificationId: verificationId, smsCode: code);
  //         // try {
  //         authResult = await _auth.signInWithCredential(authCredential);
  //         _user = authResult.user;
  //         print(_user.displayName);
  //         print(_user.isEmailVerified);
  //         print(_user.phoneNumber);
  //         if (authResult.additionalUserInfo.isNewUser) {
  //           await updateUserData(name, null);
  //           await getCurrentUser();
  //           await userReload();
  //           await getCurrentUser();
  //           res = 1;
  //         }
  // } catch (e) {
  //   switch (e.code) {
  //     case 'ERROR_ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL':
  //       res = 2;
  //       break;
  //     case 'ERROR_INVALID_CREDENTIAL':
  //       res = 3;
  //       break;
  //     case 'ERROR_USER_DISABLED':
  //       res = 4;
  //       break;
  //     case 'ERROR_OPERATION_NOT_ALLOWED':
  //       res = 5;
  //       break;
  //     case 'ERROR_INVALID_ACTION_CODE':
  //       res = 6;
  //       break;
  //     default:
  //       res = 7;
  //       break;
  //   }
  // }
  // },
  // codeAutoRetrievalTimeout: (String verificationId) {
  //   res = 9;
  // });
  //   return res;
  // }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}

final Auth authHandler = Auth();
