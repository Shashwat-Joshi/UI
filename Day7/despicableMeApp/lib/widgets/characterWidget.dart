import 'package:despicableMeApp/models/characters.dart';
import 'package:despicableMeApp/pages/characterDetailScreen.dart';
import 'package:despicableMeApp/styleGuide.dart';
import 'package:flutter/material.dart';

class CharacterWidget extends StatefulWidget {
  final Character character;
  final PageController controller;
  final int currentPage;

  const CharacterWidget(
      {Key key, this.character, this.controller, this.currentPage})
      : super(key: key);

  @override
  _CharacterWidgetState createState() => _CharacterWidgetState();
}

class _CharacterWidgetState extends State<CharacterWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 350),
            pageBuilder: (context, _, __) => CharacterDetailScreen(
              character: widget.character,
            ),
          ),
        );
      },
      child: AnimatedBuilder(
        animation: widget.controller,
        builder: (context, child) {
          double value = 1;
          if (widget.controller.position.haveDimensions) {
            value = widget.controller.page - widget.currentPage;
            value = value.abs();
            value = (1 - value * 0.3).clamp(0.0, 1.0);
            // if (widget.currentPage == 0) print(value);
          }
          return Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: ClipPath(
                  clipper: CustomClipperWidget(),
                  child: Hero(
                    tag: "bg-${widget.character.name}",
                    child: Container(
                      width: size.width * 0.9,
                      height: size.height * 0.60,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: widget.character.colors,
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                // Alignment(0,0) is equivalent to Alignment.center
                alignment: Alignment(0, -0.5),
                child: Hero(
                  tag: "image-${widget.character.imagePath}",
                  child: Image.asset(
                    widget.character.imagePath,
                    height: size.height * 0.55 * value,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30.0,
                  right: 16.0,
                  bottom: 16.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Hero(
                      tag: "Name-${widget.character.name}",
                      child: Material(
                        color: Colors.transparent,
                        child: Container(
                          child: Text(
                            widget.character.name,
                            style: AppTheme.heading,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Tap to read more',
                      style: AppTheme.subHeading,
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class CustomClipperWidget extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    double curve = 40.0;
    path.moveTo(0.0, (size.height * 0.4) + curve);
    path.lineTo(0.0, size.height - curve);
    path.quadraticBezierTo(2, size.height - 2, curve, size.height);
    path.lineTo(size.width - curve, size.height);
    path.quadraticBezierTo(
        size.width - 2, size.height - 1, size.width, size.height - curve);
    path.lineTo(size.width, curve * 1.5);
    path.quadraticBezierTo(
        size.width - 20, 0.0, size.width - (size.width / 4), 50.0);
    path.lineTo(curve, (size.height * 0.4) - 2);
    path.quadraticBezierTo(2, (size.height * 0.4 + curve / 1.5), 0.0,
        (size.height * 0.4) + curve * 2);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
