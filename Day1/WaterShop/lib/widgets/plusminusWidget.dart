import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget plusMinus = Container(
  width: 90.0,
  height: 30.0,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(
        width: 24.0,
        height: 24.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
        child: Icon(
          Icons.remove,
          size: 22.0,
        ),
      ),
      Text(
        '1',
        style: GoogleFonts.dmSans(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
      ),
      Container(
        width: 24.0,
        height: 24.0,
        decoration: BoxDecoration(
          color: Color(0xff2AA7C4),
          shape: BoxShape.circle,
          border: Border.all(
            color: Color(0xff2AA7C4),
            width: 0.5,
          ),
        ),
        child: Icon(
          Icons.add,
          size: 20.0,
          color: Colors.white,
        ),
      ),
    ],
  ),
);
