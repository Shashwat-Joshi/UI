import 'package:flutter/material.dart';

Container smallCircle = Container(
  width: 8.0,
  height: 8.0,
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    border: Border.all(
      color: Colors.white60,
    ),
  ),
);

Container mediumCircle = Container(
  width: 50.0,
  height: 50.0,
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    border: Border.all(
      color: Colors.white60,
    ),
  ),
);

Container largeCircle = Container(
  width: 100.0,
  height: 100.0,
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    border: Border.all(
      color: Colors.white60,
    ),
  ),
);

Container coloredCircleBig = Container(
  width: 100.0,
  height: 100.0,
  decoration: BoxDecoration(
    color: Colors.white60.withOpacity(0.2),
    shape: BoxShape.circle,
  ),
);

Container coloredCircleSmall = Container(
  width: 100.0,
  height: 100.0,
  decoration: BoxDecoration(
    color: Colors.white60.withOpacity(0.5),
    shape: BoxShape.circle,
  ),
);
