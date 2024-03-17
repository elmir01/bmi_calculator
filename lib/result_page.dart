import 'dart:ffi';
import 'dart:math';

import 'package:bmi_calculator/calculate_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  final double currentSliderValue;
  final double counter1;
  ResultPage({
    Key? key,
    required this.currentSliderValue,
    required this.counter1,
  }) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    double result = (widget.counter1 / pow(widget.currentSliderValue / 100, 2));
    String textToShow = '';

    if (result <= 18.5) {
      textToShow = 'Weak';
    } else if (result > 18.5 && result <= 24.9) {
      textToShow = 'Normal';
    } else if (result >= 25 && result <= 29.9) {
      textToShow = 'Overweight';
    } else if (result >= 30 && result <= 34.9) {
      textToShow = 'Fat (obesity class 1)';
    } else if (result >= 35 && result <= 39.9) {
      textToShow = 'Overweight (obesity class 2)';
    } else {
      textToShow = 'Extremely obese \n(obesity class 3)';
    }

    Color getColorForBMIResult(String result) {
      switch (textToShow) {
        case 'Weak':
          return Colors.blue;
        case 'Normal':
          return Colors.green;
        case 'Overweight':
          return Colors.yellow;
        case 'Fat (obesity class 1)':
          return Colors.orange;
        case 'Overweight (obesity class 2)':
          return Colors.redAccent;
        default:
          return Colors.red;
      }
    }

    Color color = getColorForBMIResult(result.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text('Result',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
      ),
      body: Column(
        children: [
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(8.0) + EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Your result',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w600)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 500,
              decoration: BoxDecoration(
                  color: Color.fromARGB(29, 30, 51, 255),
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Column(
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      textToShow,
                      style: TextStyle(color: color, fontSize: 25),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${result.toStringAsFixed(2)}',
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
              width: double.infinity,
              height: 80,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CalculatePage()));
                  },
                  child: Text(
                    'Recalcualte',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(235, 250, 12, 39)),
                ),
              ))
        ],
      ),
    );
  }
}
