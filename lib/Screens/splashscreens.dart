import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mausam/Api/Apidata.dart';
import 'package:mausam/Screens/homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    // getData("Delhi");
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/mlogo.png",
                height: 240,
                width: 240,
              ),
              Text(
                "Mausam",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500,color: Colors.white),
              ),
              SizedBox(height: 10),
              Text(
                "Made by Aman",
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.white),
              ),
              SizedBox(height: 30,),
              SpinKitWave(
                color: Colors.white,
                size: 50,
              )
            ],
          ),
        ),
        backgroundColor: Colors.blue[300],
      ),
    );
  }
}
