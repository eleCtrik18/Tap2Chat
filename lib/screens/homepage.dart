// @dart=2.9

import 'dart:async';

import 'dart:ui';

import 'package:animated_button/animated_button.dart';
import 'package:c2c/screens/ad_state.dart';
import 'package:c2c/screens/drawer.dart';
import 'package:c2c/screens/telegram.dart';
import 'package:c2c/screens/whatsapp.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BannerAd banner;
  @override
  void initState() {
    super.initState();
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
    final adState = Provider.of<AdState>(context);
    adState.initialization.then((status) {
      setState(() {
        banner = BannerAd(
            size: AdSize.banner,
            adUnitId: adState.bannerAdUnitId,
            listener: adState.bannerAdListener,
            request: AdRequest())
          ..load();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () {});
    return Scaffold(
      drawer: DrawerApp(),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: AppBar(
              brightness: Brightness.dark,
              backgroundColor: Colors.white.withOpacity(.05),
              elevation: 0,
              title: Text(
                'Tap 2 Chat',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white.withOpacity(.7),
                  fontWeight: FontWeight.w400,
                ),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {
                    showDialog();
                  },
                  tooltip: 'Info',
                  enableFeedback: false,
                  icon: Icon(CupertinoIcons.info),
                )
              ],
            ),
          ),
        ),
      ),
      body: Container(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 120),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              height: 15,
            ),
            Text(
              'Select the App to send the message',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 100,
            ),
            whatsappsection(),
            SizedBox(
              height: 40,
            ),
            telegramsection(),
            SizedBox(
              height: 40,
            ),
            if (banner == null)
              SizedBox(
                height: 10,
              )
            else
              Container(
                height: 60,
                child: AdWidget(
                  ad: banner,
                ),
              )
          ]),
        ),
      ),
    );
  }

  Container whatsappsection() {
    return Container(
      alignment: Alignment.center,
      child: AnimatedButton(
        child: Text(
          'WhatsApp',
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        color: Colors.green,
        onPressed: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (c, a1, a2) => WhatsApp(),
              transitionsBuilder: (c, anim, a2, child) =>
                  FadeTransition(opacity: anim, child: child),
              transitionDuration: Duration(milliseconds: 300),
            ),
          );
        },
        enabled: true,
        shadowDegree: ShadowDegree.light,
      ),
    );
  }

  Container telegramsection() {
    return Container(
      alignment: Alignment.center,
      child: AnimatedButton(
        child: Text(
          'Telegram',
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        color: Colors.blue,
        onPressed: () {
          Fluttertoast.showToast(
            msg: "Coming Soon",
          );

          // Navigator.push(
          //   context,
          //   PageRouteBuilder(
          //     pageBuilder: (c, a1, a2) => Telegram(),
          //     transitionsBuilder: (c, anim, a2, child) =>
          //         FadeTransition(opacity: anim, child: child),
          //     transitionDuration: Duration(milliseconds: 300),
          //   ),
          // );
        },
        enabled: true,
        shadowDegree: ShadowDegree.light,
      ),
    );
  }

  void showDialog() {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 300,
            child: SizedBox.expand(child: Image.asset('assets/alert.jpg')),
            margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }
}
