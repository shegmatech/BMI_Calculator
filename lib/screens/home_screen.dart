import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants/app_constants.dart';
import 'package:bmi_calculator/constants/right_bar.dart';
import 'package:bmi_calculator/constants/left_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0.0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style: TextStyle(color: accentHexColor, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 42,
                        color: accentHexColor
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Height",
                        hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(0.9)
                        )

                    ),
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: _weightController,
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 42,
                        color: accentHexColor
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Weight",
                        hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(0.9)
                        )

                    ),
                  ),
                )
              ],
            ),

            SizedBox(height: 20,),
            GestureDetector(
              onTap: () {
                setState(() {
                  _calculateBMI();
                });
              },
              child: Container(
                child: Text(
                    'Calculate',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: accentHexColor
                    )),
              ),
           ),
            SizedBox(height: 20,),

            Container(
              child: Text(
                _bmiResult.toStringAsFixed(2),
                style: TextStyle(
                    fontSize: 90,
                    fontWeight: FontWeight.w400,
                    color: accentHexColor
                ),
              ),
            ),
            SizedBox(height: 20,),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(
                child: Text(
                  _textResult,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      color: accentHexColor
                  ),
                ),
              ),
            ),

            SizedBox(height: 10,),
            LeftBar(barWidth: 40,),
            SizedBox(height: 10,),
            LeftBar(barWidth: 70,),
            SizedBox(height: 10,),
            LeftBar(barWidth: 30),
            SizedBox(height: 10,),
            RightBar(barWidth: 50),
            SizedBox(height: 40,),
            RightBar(barWidth: 50),
            SizedBox(height: 30,),
            Container(
              child: Text(
                'UI/UX by Oliver Gomes, App by Olusegun Abiola 07036792585',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: Colors.white.withOpacity(0.9)
                ),
              ),
            )


          ],
        ),
      ),

    );
  }

  void _calculateBMI() {
    double _h = double.parse(_heightController.text);
    double _w = double.parse(_weightController.text);
    _bmiResult = _w/(_h * _h);
    if(_bmiResult > 25){
      _textResult = "You're Overweight";
    } else if(_bmiResult>=18.5 && _bmiResult <=25){
      _textResult = "You have a normal weight";
    } else{
      _textResult = "You are under weight";
    }
  }
}