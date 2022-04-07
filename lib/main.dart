import 'package:flutter/material.dart';

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

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'BMI Calculator',
          style: TextStyle(color: Colors.yellow, fontSize: 13.0),
        ),
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
                  Container(
                    color: Colors.black,
                    height: 90.0,
                    width: 110.0,
                    child: const TextField(
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.yellow, fontSize: 35.0),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Height',
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 35.0)),
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    height: 90.0,
                    width: 110.0,
                    child: const TextField(
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 35.0,
                      ),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Weight',
                          hintStyle: TextStyle(
                              fontSize: 35,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.black),
              onPressed: () {},
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
          const Flexible(
            child: Text(
              '0',
              style: TextStyle(color: Colors.yellow, fontSize: 30.0),
            ),
          ),
          const Flexible(
            child: SizedBox(
              height: 50.0,
            ),
          ),
          const Flexible(
            child: Text(
              'Normal Weight!',
              style: TextStyle(fontSize: 23, color: Colors.yellow),
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
                    bottomLeft: Radius.circular(20)),
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
                    bottomRight: Radius.circular(20)),
                color: Colors.yellow,
              ),
            )
          ],
        ),
      ),
    );
  }
}
