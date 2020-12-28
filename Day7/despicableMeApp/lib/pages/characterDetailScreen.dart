import 'package:after_layout/after_layout.dart';
import 'package:despicableMeApp/models/characters.dart';
import 'package:despicableMeApp/styleGuide.dart';
import 'package:flutter/material.dart';

class CharacterDetailScreen extends StatefulWidget {
  final Character character;
  final double _expandedbottomSheetBottom = 0;
  final double _collapsedbottomSheetBottom = -250;
  final double _completeCollapsedbottomSheetBottom = -330;

  const CharacterDetailScreen({Key key, this.character}) : super(key: key);

  @override
  _CharacterDetailScreenState createState() => _CharacterDetailScreenState();
}

class _CharacterDetailScreenState extends State<CharacterDetailScreen>
    with AfterLayoutMixin<CharacterDetailScreen> {
  double _currentBottomSheetPosition = -330;
  bool isCollapsed = false;
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
                      setState(() {
                        _currentBottomSheetPosition =
                            widget._completeCollapsedbottomSheetBottom;
                      });
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
                SizedBox(
                  height: _currentBottomSheetPosition + 330,
                ),
              ],
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
            bottom: _currentBottomSheetPosition,
            left: 0.0,
            right: 0.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        (_currentBottomSheetPosition ==
                                widget._collapsedbottomSheetBottom)
                            ? _currentBottomSheetPosition =
                                widget._expandedbottomSheetBottom
                            : _currentBottomSheetPosition =
                                widget._collapsedbottomSheetBottom;
                      });
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: 80.0,
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Text(
                        'Clips',
                        style: AppTheme.subHeading.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: _clipsWidget(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _clipsWidget() {
    return Container(
      height: 250.0,
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Column(
            children: [
              roundedContainer(color: Colors.redAccent),
              SizedBox(height: 20.0),
              roundedContainer(color: Colors.greenAccent),
            ],
          ),
          SizedBox(width: 20.0),
          Column(
            children: [
              roundedContainer(color: Colors.orange),
              SizedBox(height: 20.0),
              roundedContainer(color: Colors.purple),
            ],
          ),
          SizedBox(width: 20.0),
          Column(
            children: [
              roundedContainer(color: Colors.grey),
              SizedBox(height: 20.0),
              roundedContainer(color: Colors.grey[700]),
            ],
          ),
          SizedBox(width: 20.0),
          Column(
            children: [
              roundedContainer(color: Colors.lightGreenAccent),
              SizedBox(height: 20.0),
              roundedContainer(color: Colors.pink),
            ],
          ),
        ],
      ),
    );
  }

  Widget roundedContainer({Color color}) {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        isCollapsed = true;
        _currentBottomSheetPosition = widget._collapsedbottomSheetBottom;
      });
    });
  }
}
