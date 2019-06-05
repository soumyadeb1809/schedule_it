import 'package:flutter/material.dart';
import 'package:schedule_it/screens/home_screen.dart';
import 'package:schedule_it/utils/CommonUtils.dart';

class LoginScreen extends StatelessWidget {

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
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => HomeScreen(title: 'BottomAppBar with FAB'),
        )
    );
  }
}