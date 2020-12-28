import 'package:flutter/material.dart';
import 'barItems.dart';

class AnimatedBottomBar extends StatefulWidget {
  final List<BarItems> barItems = [
    BarItems(
      text: 'Home',
      color: Colors.indigo,
      iconData: Icons.home,
    ),
    BarItems(
      text: 'Likes',
      color: Colors.pinkAccent,
      iconData: Icons.favorite_border,
    ),
    BarItems(
      text: 'Search',
      color: Colors.yellow.shade900,
      iconData: Icons.search,
    ),
    BarItems(
      text: 'Profile',
      color: Colors.teal,
      iconData: Icons.person_outline,
    ),
  ];
  @override
  _AnimatedBottomBarState createState() => _AnimatedBottomBarState();
}

class _AnimatedBottomBarState extends State<AnimatedBottomBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          color: widget.barItems[selectedIndex].color,
        ),
        bottomNavigationBar: CustomBottomBar(
          barItems: widget.barItems,
          animationDuration: Duration(milliseconds: 200),
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          barStyle: BarStyle(),
        ),
      ),
    );
  }
}
