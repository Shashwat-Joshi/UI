import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class CustomBottomBar extends StatefulWidget {
  final List<BarItems> barItems;
  final Duration animationDuration;
  final BarStyle barStyle;
  final Function onTap;

  CustomBottomBar({
    this.barItems,
    this.animationDuration = const Duration(milliseconds: 1000),
    this.onTap,
    this.barStyle,
  });

  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar>
    with TickerProviderStateMixin {
  int _selectedBarIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10.0,
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 20.0,
          top: 18.0,
          left: 24.0,
          right: 24.0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _buildBarItems(),
        ),
      ),
    );
  }

  List<Widget> _buildBarItems() {
    List<Widget> _barItems = List();
    for (int i = 0; i < widget.barItems.length; i++) {
      BarItems _item = widget.barItems[i];
      bool _isSelected = (_selectedBarIndex == i);
      _barItems.add(
        InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            setState(() {
              _selectedBarIndex = i;
              widget.onTap(_selectedBarIndex);
            });
          },
          child: AnimatedContainer(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            duration: widget.animationDuration,
            decoration: _isSelected
                ? BoxDecoration(
                    color: _item.color.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(30.0),
                  )
                : BoxDecoration(),
            child: Row(
              children: [
                Icon(
                  _item.iconData,
                  color: _isSelected ? _item.color : Colors.black,
                  size: widget.barStyle.iconSize,
                ),
                SizedBox(
                  width: 10.0,
                ),
                AnimatedSize(
                  vsync: this,
                  duration: widget.animationDuration,
                  curve: Curves.easeIn,
                  child: Text(
                    _isSelected ? _item.text : '',
                    style: TextStyle(
                      color: _item.color,
                      fontWeight: widget.barStyle.fontWeight,
                      fontSize: widget.barStyle.fontSize,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return _barItems;
  }
}

class BarStyle {
  final double fontSize, iconSize;
  final FontWeight fontWeight;

  BarStyle({
    this.fontSize = 16.0,
    this.iconSize = 24.0,
    this.fontWeight = FontWeight.w600,
  });
}

class BarItems {
  final String text;
  final IconData iconData;
  final Color color;

  BarItems({
    this.text,
    this.iconData,
    this.color,
  });
}
