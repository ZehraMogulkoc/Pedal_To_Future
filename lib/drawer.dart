import 'package:flutter/material.dart';
import 'dart:ui';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 80),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(250),
        ),
        child: SizedBox(
          width: 250,
          child: Drawer(
            child: new ListView(
              children: <Widget>[
                new UserAccountsDrawerHeader(
                  //Color(0xff4367b1)
                  decoration: BoxDecoration(
                    color: Color(0xFF789373),
                  ),
                  accountName: new Text(
                    '',
                    style: TextStyle(
                      fontSize: 1,
                      fontWeight: FontWeight.w800,
                      //color: Colors.grey[300],
                      color: Colors.black,
                    ),
                  ),
                  accountEmail: new Text(
                    'Modify Experiance',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                ),
                new ListTile(
                  title: new Text(
                    'News (gen set)',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                  leading: new Icon(
                    Icons.add_to_home_screen,
                    size: 26.0,
                    color: Colors.black,
                  ),
                ),
                new ListTile(
                  title: new Text(
                'Color & Design',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                  ),
                  onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                  },
                  leading: new Icon(
                Icons.notifications,
                size: 26.0,
                color: Colors.black,
                  ),
                ),
                new ListTile(
                  title: new Text(
                'Social Media',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                  ),
                  onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                  },
                  leading: new Icon(
                Icons.message,
                size: 26.0,
                color: Colors.black,
                  ),
                ),
                new ListTile(
                  title: new Text(
                'Login Options',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                  ),
                  onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                  },
                  leading: new Icon(
                Icons.touch_app,
                size: 26.0,
                color: Colors.black,
                  ),
                ),
                new Divider(
                  color: Colors.black38,
                ),
                new ListTile(
                  title: new Text(
                'Close Menu',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                  ),
                  onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                  },
                  leading: new Icon(
                Icons.close,
                size: 26.0,
                color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}