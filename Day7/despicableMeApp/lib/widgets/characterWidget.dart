import 'package:despicableMeApp/models/characters.dart';
import 'package:despicableMeApp/pages/characterDetailScreen.dart';
import 'package:despicableMeApp/styleGuide.dart';
import 'package:flutter/material.dart';

class CharacterWidget extends StatelessWidget {
  final Character character;

  const CharacterWidget({Key key, this.character}) : super(key: key);
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
              character: character,
            ),
          ),
        );
      },
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: CustomClipperWidget(),
              child: Hero(
                tag: "bg-${character.name}",
                child: Container(
                  width: size.width * 0.9,
                  height: size.height * 0.60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: character.colors,
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
              tag: "image-${character.imagePath}",
              child: Image.asset(
                character.imagePath,
                height: size.height * 0.55,
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
                  tag: "Name-${character.name}",
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      child: Text(
                        character.name,
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
