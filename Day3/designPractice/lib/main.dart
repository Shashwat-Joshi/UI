import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int value = 0;

  _onChanged(double val) {
    setState(() {
      value = val.toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Rotated Box'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RotatedBox(
                quarterTurns: value,
                child: Text('Shashwat'),
              ),
              Slider(
                value: value.toDouble(),
                min: 0.0,
                max: 4.0,
                onChanged: (val) => _onChanged(val),
                activeColor: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
