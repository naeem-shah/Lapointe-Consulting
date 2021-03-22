import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lapointeconsultingllc/ui/pages/auth/login.dart';
import 'package:lapointeconsultingllc/ui/pages/dashboard.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              "images/logo.png",
              height: 250,
            ),
          ),
          Positioned(
            bottom: 40,
              left: 0,right: 0,
              child: Center(child: CircularProgressIndicator()))
        ],
      ),
    );
  }

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, (){
      Get.off(()=>Login());
    });
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }


}


