import 'dart:math';

import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CalculatePage extends StatefulWidget {
  CalculatePage({super.key});

  @override
  State<CalculatePage> createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {
  int _selectedContainer = 0;
  double currentSliderValue = 100;
  final ValueNotifier<double> counter1 = ValueNotifier<double>(20);

  void _incrementCounter1() {
    counter1.value++;
  }

  void _decrementCounter1() {
    if (counter1.value > 20) {
      counter1.value--;
    }
  }

  final ValueNotifier<int> _counter2 = ValueNotifier<int>(10);

  void _incrementCounter2() {
    _counter2.value++;
  }

  void _decrementCounter2() {
    if (_counter2.value > 10) {
      _counter2.value--;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'BMI Calculator',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedContainer = 1;
                      });
                    },
                    child: MaleContainer(selectedContainer: _selectedContainer),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedContainer = 2;
                      });
                    },
                    child:
                        FemaleContainer(selectedContainer: _selectedContainer),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              child: Container(
                  width: 370,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(29, 30, 51, 255),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0) +
                            EdgeInsets.only(top: 13),
                        child: Text(
                          'Height',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0) +
                            EdgeInsets.only(bottom: 3),
                        child: Text(
                          '${currentSliderValue.round()} cm',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 30),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Slider(
                          activeColor: Color.fromARGB(235, 250, 12, 39),
                          value: currentSliderValue,
                          min: 100,
                          max: 200,
                          divisions: 200,
                          label: currentSliderValue.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              currentSliderValue = value;
                            });
                          },
                        ),
                      ),
                    ],
                  )),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 100,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(29, 30, 51, 255),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Weight',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                        ValueListenableBuilder(
                            valueListenable: counter1,
                            builder: (context, value, child) {
                              return Text(
                                '${value.toInt()}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 30),
                              );
                            }),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IconButton(
                                    onPressed: _decrementCounter1,
                                    icon: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                      size: 50,
                                    )),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IconButton(
                                    onPressed: _incrementCounter1,
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 50,
                                    )),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 100,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(29, 30, 51, 255),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Age',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                        ValueListenableBuilder(
                            valueListenable: _counter2,
                            builder: (context, value, child) {
                              return Text(
                                '${value}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 30),
                              );
                            }),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IconButton(
                                    onPressed: _decrementCounter2,
                                    icon: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                      size: 50,
                                    )),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IconButton(
                                    onPressed: _incrementCounter2,
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 50,
                                    )),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
              width: double.infinity,
              height: 80,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (counter1.value >= 20) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResultPage(
                                  currentSliderValue: currentSliderValue,
                                  counter1: counter1.value)));
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: Color.fromARGB(29, 30, 51, 255),
                            title: Text(
                              "Warning",
                              style: TextStyle(color: Colors.white),
                            ),
                            content: Text(
                              "Please enter the value of the weight correctly. (The value of the weight must be greater than 10)",
                              style: TextStyle(color: Colors.white),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  "Close",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Text(
                    'Calcualte',
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

class FemaleContainer extends StatelessWidget {
  const FemaleContainer({
    super.key,
    required int selectedContainer,
  }) : _selectedContainer = selectedContainer;

  final int _selectedContainer;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 210,
      decoration: BoxDecoration(
          color: _selectedContainer == 2
              ? Color.fromARGB(235, 250, 12, 39)
              : Color.fromARGB(29, 30, 51, 255),
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.female,
                color: Colors.white,
                size: 130,
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Female',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class MaleContainer extends StatelessWidget {
  const MaleContainer({
    super.key,
    required int selectedContainer,
  }) : _selectedContainer = selectedContainer;

  final int _selectedContainer;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 210,
      decoration: BoxDecoration(
          color: _selectedContainer == 1
              ? Color.fromARGB(235, 250, 12, 39)
              : Color.fromARGB(29, 30, 51, 255),
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.male,
                color: Colors.white,
                size: 130,
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Male',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
