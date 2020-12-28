import 'package:despicableMeApp/pages/characterListingScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Despicable Me',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        canvasColor: Colors.white,
      ),
      home: CharacterListingScreen(),
    );
  }
}
