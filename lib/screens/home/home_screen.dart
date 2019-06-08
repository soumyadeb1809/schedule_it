import 'package:flutter/material.dart';
import 'package:schedule_it/bottom_app_bar/fab_bottom_app_bar.dart';
import 'package:schedule_it/model/post.dart';
import 'package:schedule_it/profile/profile_screen.dart';
import 'package:schedule_it/screens/home/post_list.dart';
import 'package:schedule_it/utils/CommonUtils.dart';

import 'package:schedule_it/screens/new_post/new_post_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int _lastSelected = 0;

  void _selectedTab(int index) {
    setState(() {
      _lastSelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildHomeScreenContent(),
      bottomNavigationBar: FABBottomAppBar(
        centerItemText: '',
        color: Colors.grey,
        selectedColor: Colors.deepPurpleAccent,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _selectedTab,
        items: [
          FABBottomAppBarItem(iconData: Icons.timer, text: 'Schedule'),
          FABBottomAppBarItem(iconData: Icons.layers, text: 'Uploaded'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFab(context),
    );
  }

  /// Method to build center docked FAB:
  Widget _buildFab(BuildContext context) {
    final icons = [Icons.sms, Icons.mail, Icons.phone];
    return FloatingActionButton(
      onPressed: () {
        debugPrint("FAB Clicked");
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => NewPostScreen(),
            ));
      },
      tooltip: 'Increment',
      child: Icon(Icons.add),
      elevation: 1.0,
    );
  }

  List<Post> _populatePosts() {
    List<Post> posts = new List();
    Post post = new Post(url: "images/post_image.jpg");
    posts.add(post);
    post = new Post(url: "images/trek.jpg");
    posts.add(post);
    post = new Post(url: "images/banner.jpg");
    posts.add(post);
    post = new Post(url: "images/morning.jpg");
    posts.add(post);
    post = new Post(url: "images/mountains.jpg");
    posts.add(post);
    return posts;
  }

  Widget _buildHomeScreenContent() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          _topAppBar(),
          Expanded(
              child: Container(
                color: Colors.white,
                child: PostList(_populatePosts()),
              )
          )
        ],
      ),
    );
  }

  Widget _topAppBar() {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: 88,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(24, 48, 0, 0),
              child: Text(
                "Scheduled",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ProfileScreen(),
                  ));
            },
            child: _userInfo(),
          )
        ],
      ),
    );
  }

  Widget _userInfo(){
    return  Container(
      alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(0, 28, 24, 0),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Align(
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      child: Text(
                          "Soumya Deb",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 12
                          )
                      ),
                    ),
                    Container(
                      child: Text(
                          "@_soumyadeb",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              fontSize: 12
                          )
                      ),
                    ),
                  ],
                )
            ),
            Container(
              margin: EdgeInsets.only(left: 10, bottom: 14),
              child: CommonUtils.getClippedImageAsset("images/mypik1.jpg",
                  height: 36, width: 36, cornerRadius: 50),
            ),
          ],
        ),
      ),
    );
  }
}
