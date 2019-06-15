import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:schedule_it/api/FacebookGraph.dart';
import 'package:schedule_it/dto/facebook_pages_response.dart';
import 'package:schedule_it/interfaces/login_interface.dart';
import 'package:schedule_it/screens/home/home_screen.dart';
import 'package:schedule_it/utils/CommonUtils.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatelessWidget implements LoginInterface{

  final double _appNameSize = 56.0;

  Widget _loginButtonContent(){
    return Container(
      decoration: BoxDecoration(
          color: Colors.deepPurpleAccent,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(
                color: Color(0x29000000),
                offset: new Offset(0.0, 3.0),
                blurRadius: 20.0
            )
          ]
      ),
      margin: EdgeInsets.only(left: 50.0, right: 50.0),
      height: 60.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CommonUtils.getImageAsset('images/insta_white.png', 32.0, 32.0),
          SizedBox(width: 12.0,),
          Text("Login with Instagram", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }

  Widget _topContent(){
    return  Column(
      children: <Widget>[
        Container(
            alignment: FractionalOffset.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Schedule",
                  style:
                  TextStyle(
                    fontSize: _appNameSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(".",
                  style:
                  TextStyle(
                    fontSize: _appNameSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
                Text("it",
                  style:
                  TextStyle(
                    fontSize: _appNameSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                )
              ],
            )
        ),
        Container(
          margin: EdgeInsets.only(top: 40),
          child:
          Text("Easily schedule photos to be uploaded to\ninstagram  with a few clicks",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.grey,
                fontSize: 16.0
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      child: _topContent()
                  )
                  ,
                  Container(
                    margin: EdgeInsets.only(top: 40, bottom: 40),
                    child: CommonUtils.getImageAsset('images/login_banner.png', 320.0, 240.0),
                  ),
                  Container(
                      child: InkWell(
                          onTap: () {
                            _onLoginClicked(context);
                          },
                          child: Material(
                              color: Colors.white,
                              child: _loginButtonContent()
                          )
                      )
                  )
                ],
              ),
            )
        )
    );
  }

  void _onLoginClicked(BuildContext context){

    LoginHelper.getInstance(this).initiateFacebookLogin();

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => HomeScreen(title: 'BottomAppBar with FAB'),
        )
    );
  }

  @override
  void onLoginFailed(FacebookLoginStatus status, String errorMessage) {
    print("Login failed");
  }

  @override
  void onLoginSuccessful(FacebookAccessToken facebookAccessToken) {

    print(facebookAccessToken.token);
    List<FbPageData> instaBusinessPages = new List();

    _getFbPages(facebookAccessToken.token).then((fbPagesResponse){
      print(fbPagesResponse.toJson());
      if(fbPagesResponse != null){
        instaBusinessPages.addAll(_getInstaBusinessPages(fbPagesResponse));
      }



    });

  }

  /// Method to get all facebook pages of the user
  Future<FacebookPagesResponse> _getFbPages(String accessToken) async{
    String fbPagesQueryUrl = 'https://graph.facebook.com/v3.3/me/accounts'
        '?fields=name,instagram_business_account,picture';
    final response = await http.get('$fbPagesQueryUrl&access_token=$accessToken');
    final jsonData = json.decode(response.body);
    return FacebookPagesResponse.fromJson(jsonData);
  }


  /// Method to get all pages connected to Instagram Business Account
  List<FbPageData> _getInstaBusinessPages(FacebookPagesResponse fbPagesResponse){
    List<FbPageData> instaBusinessPages = new List();
    try {
      fbPagesResponse.data.forEach((fbPageData) {
        print(fbPageData.toJson());
        if (null != fbPageData.instagramBusinessAccount) {
          instaBusinessPages.add(fbPageData);
        }
      });
    } on Exception catch(error, stacktrace) {
      print(stacktrace);
    }

    return instaBusinessPages;
  }

}