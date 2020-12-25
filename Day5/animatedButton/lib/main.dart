import 'package:animatedButton/widgets/animatedButton.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Animated Button",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Button'),
      ),
      body: Center(
        child: AnimatedButton(
          onTap: () {
            print('Button Pressed');
          },
          animationDuration: const Duration(milliseconds: 1500),
          initialText: 'Confirm',
          finalText: 'Submitted',
          iconData: Icons.check,
          iconSize: 32.0,
          buttonStyle: CustomButtonStyle(
            primaryColor: Colors.green.shade600,
            secondaryColor: Colors.white,
            elevation: 10.0,
            initialTextStyle: TextStyle(
              fontSize: 22.0,
              color: Colors.white,
            ),
            finalTextStyle: TextStyle(
              fontSize: 22.0,
              color: Colors.green.shade600,
            ),
            borderRadius: 10.0,
          ),
        ),
      ),
    );
  }
}
