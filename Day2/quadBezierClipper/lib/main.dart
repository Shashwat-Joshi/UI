import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ClipperWidget(),
    );
  }
}

class ClipperWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QuadBezier Clipper'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClipPath(
            clipper: new MyClipper(),
            child: Image(
              image: AssetImage('images/image.jpg'),
            ),
          ),
          ClipPath(
            clipper: new MyAdvanceClipper(),
            child: Image(
              image: AssetImage('images/image.jpg'),
            ),
          ),
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    path.lineTo(0.0, size.height / 2);

    Offset firstControlPoint = Offset(size.width / 2, size.height);
    Offset firstEndPoint = Offset(size.width, size.height / 2);
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class MyAdvanceClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    path.lineTo(0.0, size.height / 2);

    Offset firstControlPoint = Offset(size.width / 4, size.height / 4);
    Offset firstEndPoint = Offset(size.width / 2, size.height / 2);
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    Offset secondControlPoint = Offset(3 * size.width / 4, 3 * size.height / 4);
    Offset secondEndPoint = Offset(size.width, size.height / 2);
    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy,
    );

    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
