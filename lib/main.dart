import 'package:bmi_calculator/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants/app_constants.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: !true,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: HomeScreen(),
    );
  }
}
