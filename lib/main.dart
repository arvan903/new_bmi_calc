import 'package:flutter/material.dart';
// this is for math actions
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // these variables uses to keep input values
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  // these variables are for showing results
  // this is result number
  late double _bmiResult = 0;
  // this is result text (for example Overweight)
  late String _textResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'BMI Calculator',
          style: TextStyle(color: Colors.yellow, fontSize: 13.0),
        ),
        // put app bar title in center
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 15.0,
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 35.0, right: 35.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Container(
                      color: Colors.black,
                      height: 90.0,
                      width: 110.0,
                      child: TextField(
                        controller: _heightController,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.yellow, fontSize: 35.0),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Height in CM',
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      color: Colors.black,
                      height: 90.0,
                      width: 110.0,
                      child: TextField(
                        controller: _weightController,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.yellow,
                          fontSize: 35.0,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Weight in KG',
                          hintStyle: TextStyle(
                              fontSize: 15.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.black),
              onPressed: () {
                double height = double.parse(_heightController.text);
                double weight = double.parse(_weightController.text);
                setState(() {
                  _bmiResult = weight / pow(height / 100, 2);
                  if (_bmiResult > 25) {
                    _textResult = 'You Are Overweight !!';
                  } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                    _textResult = 'Your Weight is Normal !';
                  } else {
                    _textResult = 'You Are Underweight !!';
                  }
                });
              },
              child: const Text(
                'Calculate',
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 25,
                ),
              ),
            ),
          ),
          const Flexible(
            child: SizedBox(
              height: 50.0,
            ),
          ),
          Flexible(
            child: Text(
              _bmiResult.toStringAsFixed(1),
              style: const TextStyle(color: Colors.yellow, fontSize: 30.0),
            ),
          ),
          const Flexible(
            child: SizedBox(
              height: 50.0,
            ),
          ),
          Flexible(
            child: Visibility(
              visible: _textResult.isNotEmpty,
              child: Text(
                _textResult,
                style: const TextStyle(fontSize: 23, color: Colors.yellow),
              ),
            ),
          ),
          const Flexible(
            child: SizedBox(
              height: 50.0,
            ),
          ),
          const RightBar(barwidth: 28.0),
          const RightBar(barwidth: 60.0),
          const RightBar(barwidth: 30.0),
          const LeftBar(barwidth: 28.0),
          const LeftBar(barwidth: 60.0),
          const LeftBar(barwidth: 30.0),
        ],
      ),
    );
  }
}

class RightBar extends StatelessWidget {
  final double barwidth;
  const RightBar({Key? key, required this.barwidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 26,
              width: barwidth,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20),
                ),
                color: Colors.yellow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LeftBar extends StatelessWidget {
  final double barwidth;
  const LeftBar({Key? key, required this.barwidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 26,
              width: barwidth,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  bottomRight: Radius.circular(20),
                ),
                color: Colors.yellow,
              ),
            )
          ],
        ),
      ),
    );
  }
}
