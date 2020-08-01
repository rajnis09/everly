import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser _user;
  FirebaseAuth get auth => _auth;

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

  Future<int> phoneUserLoginOrRegister(AuthCredential credential) async {
    int res = 0;
    AuthResult authResult;
    try {
      authResult = await _auth.signInWithCredential(credential);
      _user = authResult.user;
      print("Signed IN");
      if (authResult.additionalUserInfo.isNewUser) {
        // await updateUserData(name, null);
        // await getCurrentUser();
        // await userReload();
        // await getCurrentUser();
        print('New User');
        res = 1;
      }
      print('In authahndler ${_user.phoneNumber}');
    } catch (e) {
      switch (e.code) {
        case 'ERROR_ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL':
          res = 2;
          break;
        case 'ERROR_INVALID_CREDENTIAL':
          res = 3;
          break;
        case 'ERROR_USER_DISABLED':
          res = 4;
          break;
        case 'ERROR_OPERATION_NOT_ALLOWED':
          res = 5;
          break;
        case 'ERROR_INVALID_ACTION_CODE':
          res = 6;
          break;
        default:
          res = 7;
          break;
      }
    }
    return res;
  }

  Future<void> signOut() async {
    if (_auth != null) await _auth.signOut();
  }

  Future<void> updateUserData(String name, String photoUrl) async {
    UserUpdateInfo updateInfo = UserUpdateInfo();
    updateInfo.displayName = name;
    updateInfo.photoUrl = photoUrl ??
        "https://drive.google.com/uc?export=download&id=1hBu6cfZvlVFm3-AB8PBx2K4AZoiAXf4e";
    _user = await _auth.currentUser();
    await _user.updateProfile(updateInfo);
  }
}

final Auth authHandler = Auth();
