import 'dart:async';
import 'package:bmi_calculator/main.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget{
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() { //managing the state initially
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage()));  //calling homepage from old_main1.dart
    });//using pushReplacement will not add splash_page to stack hence when user hits back from homepage he will be exited directly rather than switching to splashPage
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        color: Colors.black12,
        child: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("BMI CALCULATOR",style: TextStyle(fontSize: 30,fontFamily: "Font1",color: Colors.black),),
            SizedBox(height: 20,),
            Text("   -By Bhavesh Patil",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w700))
          ],
        )),
      ),
    );
  }
}