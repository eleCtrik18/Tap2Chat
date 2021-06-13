import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerApp extends StatefulWidget {
  const DrawerApp({Key? key}) : super(key: key);

  @override
  _DrawerAppState createState() => _DrawerAppState();
}

class _DrawerAppState extends State<DrawerApp> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Center(child: Text('Tap 2 Chat')),
          ),
          ListTile(
            trailing: new Icon(CupertinoIcons.device_laptop),
            title: Text('GitHub'),
            onTap: () {
              launch('https://github.com/eleCtrik18');
            },
          ),
          ListTile(
              title: Text('Feedback'),
              trailing: new Icon(CupertinoIcons.book),
              onTap: (() {
                launch(
                    "mailto:flutterproject18@gmail.com?subject=Regarding App");
              })),
          ListTile(
            trailing: new Icon(CupertinoIcons.gift),
            title: Text('Buy Me a Coffee'),
            onTap: () {
              launch(
                  'upi://pay?pa=singhchetan0542@okaxis&pn=Chetan Singh&am=100&cu=INR');
            },
          ),
        ],
      ),
    );
  }
}
