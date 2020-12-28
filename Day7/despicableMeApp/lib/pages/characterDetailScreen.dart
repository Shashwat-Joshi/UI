import 'package:despicableMeApp/models/characters.dart';
import 'package:despicableMeApp/styleGuide.dart';
import 'package:flutter/material.dart';

class CharacterDetailScreen extends StatefulWidget {
  final Character character;

  const CharacterDetailScreen({Key key, this.character}) : super(key: key);

  @override
  _CharacterDetailScreenState createState() => _CharacterDetailScreenState();
}

class _CharacterDetailScreenState extends State<CharacterDetailScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Hero(
            tag: "bg-${widget.character.name}",
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: widget.character.colors,
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      size: 40.0,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Hero(
                    tag: "image-${widget.character.imagePath}",
                    child: Image.asset(
                      widget.character.imagePath,
                      height: size.height * 0.45,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32.0, bottom: 8.0),
                  child: Hero(
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
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32.0, 0.0, 8.0, 32.0),
                  child: Text(
                    widget.character.description,
                    style: AppTheme.subHeading,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
