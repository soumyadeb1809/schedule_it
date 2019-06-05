import 'package:flutter/material.dart';
import 'package:schedule_it/bottom_app_bar/fab_bottom_app_bar.dart';

import 'new_post_screen.dart';

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
          FABBottomAppBarItem(iconData: Icons.menu, text: 'Schedule'),
          FABBottomAppBarItem(iconData: Icons.layers, text: 'Uploaded'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFab(context),
    );
  }


  /// Method to build center docked FAB:
  Widget _buildFab(BuildContext context) {
    final icons = [ Icons.sms, Icons.mail, Icons.phone ];
    return FloatingActionButton(
        onPressed: () {
          debugPrint("FAB Clicked");
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => NewPostScreen(),
              )
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
        elevation: 1.0,
    );
  }

  _buildHomeScreenContent() {

  }
}