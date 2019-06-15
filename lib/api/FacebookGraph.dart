import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:schedule_it/interfaces/login_interface.dart';

class LoginHelper{

  LoginInterface loginInterface;

  _LoginHelper() {

  }

  static LoginHelper getInstance(LoginInterface loginHandler) {
    LoginHelper loginHelper = new LoginHelper();
    loginHelper.loginInterface = loginHandler;
    return loginHelper;
  }


  void initiateFacebookLogin() async {
    var facebookLogin = FacebookLogin();
    var facebookLoginResult =
    await facebookLogin.logInWithReadPermissions(['email']);
    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.error:
        print("Error");
        loginInterface.onLoginFailed(FacebookLoginStatus.error, facebookLoginResult.errorMessage);
        break;
      case FacebookLoginStatus.cancelledByUser:
        print("CancelledByUser");
        loginInterface.onLoginFailed(FacebookLoginStatus.error, facebookLoginResult.errorMessage);
        break;
      case FacebookLoginStatus.loggedIn:
        print("LoggedIn");
        loginInterface.onLoginSuccessful(facebookLoginResult.accessToken);
        break;
    }
  }
}