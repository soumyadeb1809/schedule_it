import 'package:flutter/material.dart';
import 'package:schedule_it/utils/CommonUtils.dart';


class ProfileScreen extends StatefulWidget {

  ProfileScreen({Key key,}) : super(key: key);

  @override
  _ProfileScreenState createState() => new _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            _topAppBar(),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Hero(
                    tag: "user_info",
                    child: _userInfo(),
                  ),
                  _profileSummary(),
                  _logoutButton()
                ],
              ),
            )
          ],
        )
      ),
    );
  }

  Widget _logoutButton(){
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
      margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 10),
      height: 60.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Log Out",
            style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 16.0,),
          RotatedBox(
            quarterTurns: 2,
            child: Icon(Icons.keyboard_backspace, color: Colors.white,),
          )
        ],
      ),
    );
  }

  Widget _profileSummary() {
    return Container(
      height: 80,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 60),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(
                color: Color(0x19000000),
                offset: new Offset(0.0, 3.0),
                blurRadius: 20.0
            )
          ]
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text("Followers",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Text("999k",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 1,
            height: 50,
            child: Container(
              color: Colors.grey[300],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text("Following",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Text("578",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 1,
            height: 50,
            child: Container(
              color: Colors.grey[300],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text("Media Count",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Text("1024",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget _topAppBar(){
    return Container(
      height: 60,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 32, left: 20),
      child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.all(4),
            child: Icon(
              Icons.keyboard_backspace,
              size: 32,
              color: Colors.grey,
            ),
          )
      ),
    );
  }

  Widget _userInfo() {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          CommonUtils.getClippedImageAsset("images/mypik1.jpg",
              height: 130, width: 130, cornerRadius: 130),
          Container(
            margin: EdgeInsets.only(top: 24),
            child: Text("Soumya Deb",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            child: Text("@_soumyadeb_",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}