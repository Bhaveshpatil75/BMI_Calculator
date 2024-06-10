import 'dart:math';
import 'dart:ui';
import 'package:bmi_calculator/splash_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:font_awesome_flutter/font_awesome_flutter.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white10),
        useMaterial3: true,
      ),
      home: SplashPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wt=TextEditingController();
  var ht=TextEditingController();
  var bmi="";
  var res="";
  Color col=Colors.red;
  double wd=0;
  var mini;
  var maxi;
  RichText suggest=RichText(text: TextSpan());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Center(child: Text("BMI Calculator",style: TextStyle(color: Colors.white),)),
      ),
      body: Container(
        color: Colors.black12,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: wt,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label:Text("Weight in kg"),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(width:
                    5,color: Colors.greenAccent)),
                    suffixText: "Kg",
                    //hintText: "Weight",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 5)
                    )
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: ht,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text("Height in cm"),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 5,color: Colors.greenAccent)),
                    //hintText: "Height",
                    suffixText: "cm",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 5)
                    )
                  ),
                ),
                SizedBox(height: 10,),
                ElevatedButton(onPressed: (){
                  setState(() {
                    var n1=double.parse(ht.text)/100;
                    bmi=(double.parse(wt.text)/pow(n1, 2)).toStringAsFixed(2);
                    mini=(18.5*pow(n1, 2)).toStringAsFixed(2);
                    maxi=(24.9*pow(n1, 2)).toStringAsFixed(2);
                    suggest=RichText(text:TextSpan(
                      style: TextStyle(fontSize: 15,color: Colors.black),
                      children: [
                        TextSpan(text: "A/c to Height the "),
                        TextSpan(text: " Weight ",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                        TextSpan(text:"should be in Range" ),
                        TextSpan(text: " ${mini} Kg ",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.green)),
                        TextSpan(text: "&"),
                        TextSpan(text: " ${maxi} Kg",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.green))
                      ],
                        )
                    );
                    if (double.parse(bmi)<18.5) {
                      res = "Underweight";
                      wd=15;
                      col=Colors.redAccent;
                    }
                    else if(double.parse(bmi)<25){
                      res="Normal";
                      wd=40;
                    col=Colors.green;
                    }
                    else if (double.parse(bmi)<30) {
                      res = "Overweight";
                      wd = 85;
                      col=Colors.redAccent;
                    }
                    else{
                      res="Obesity";
                      wd=110;
                      col=Colors.red;
                    }
                  }
                  );
                }, child: Text("Calculate")),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("BMI = ",style: TextStyle(fontFamily: "Font1",fontSize: 30),),
                    Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black87,width: 1,
                        )
                      ),
                      child: Center(child: Text(bmi,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                Wrap(
                  direction: Axis.horizontal,
                  spacing: 10,
                  children: [
                    Text(res,style: TextStyle(fontSize: 30,fontFamily: "Font1",color:col),),
                    Container(
                      height: 50,
                      width: wd,
                      child: FittedBox(
                          fit: BoxFit.fill,child: FaIcon(FontAwesomeIcons.person)),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                suggest
              ],
            ),
          ),
        ),
      ),
    );
  }
}
