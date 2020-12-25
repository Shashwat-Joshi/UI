import 'dart:io';

import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final String initialText, finalText;
  final CustomButtonStyle buttonStyle;
  final IconData iconData;
  final double iconSize;
  final Duration animationDuration;
  final Function onTap;

  AnimatedButton({
    this.initialText,
    this.finalText,
    this.buttonStyle,
    this.iconData,
    this.iconSize,
    this.animationDuration,
    this.onTap,
  });

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with TickerProviderStateMixin {
  AnimationController _controller;
  ButtonState _currentState;
  Duration _smallDuration;
  Animation<double> _scalefinalTextAnimation;

  @override
  void initState() {
    super.initState();
    _currentState = ButtonState.SHOW_ONLY_TEXT;
    _smallDuration = Duration(
        milliseconds: (widget.animationDuration.inMilliseconds * 0.2).round());
    _controller =
        AnimationController(duration: widget.animationDuration, vsync: this);
    _controller.addListener(() {
      double _controllerValue = _controller.value;
      if (_controllerValue < 0.2) {
        setState(() {
          _currentState = ButtonState.SHOW_ONLY_ICON;
        });
      } else if (_controllerValue >= 0.8) {
        setState(() {
          _currentState = ButtonState.SHOW_BOTH;
        });
      }
    });
    _scalefinalTextAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        return widget.onTap();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(widget.buttonStyle.borderRadius),
      elevation: widget.buttonStyle.elevation,
      child: InkWell(
        onTap: () {
          _controller.forward();
        },
        child: AnimatedContainer(
          duration: _smallDuration,
          height: widget.iconSize + 16.0,
          decoration: BoxDecoration(
            color: (_currentState == ButtonState.SHOW_ONLY_TEXT)
                ? widget.buttonStyle.primaryColor
                : widget.buttonStyle.secondaryColor,
            border: Border.all(
              color: widget.buttonStyle.primaryColor,
            ),
            borderRadius:
                BorderRadius.circular(widget.buttonStyle.borderRadius),
          ),
          padding: EdgeInsets.symmetric(
              horizontal:
                  (_currentState == ButtonState.SHOW_ONLY_ICON) ? 8.0 : 48.0,
              vertical: 8.0),
          child: AnimatedSize(
            vsync: this,
            duration: _smallDuration,
            curve: Curves.easeIn,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                (_currentState == ButtonState.SHOW_ONLY_ICON ||
                        _currentState == ButtonState.SHOW_BOTH)
                    ? Icon(
                        widget.iconData,
                        size: widget.iconSize,
                        color: widget.buttonStyle.primaryColor,
                      )
                    : Container(),
                SizedBox(
                  width: (_currentState == ButtonState.SHOW_BOTH) ? 30.0 : 0.0,
                ),
                getTextWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getTextWidget() {
    if (_currentState == ButtonState.SHOW_ONLY_TEXT) {
      return Text(
        widget.initialText,
        style: widget.buttonStyle.initialTextStyle,
      );
    } else if (_currentState == ButtonState.SHOW_ONLY_ICON) {
      return Container();
    } else {
      return ScaleTransition(
        scale: _scalefinalTextAnimation,
        child: Text(
          widget.finalText,
          style: widget.buttonStyle.finalTextStyle,
        ),
      );
    }
  }
}

class CustomButtonStyle {
  final TextStyle initialTextStyle, finalTextStyle;
  final Color primaryColor, secondaryColor;
  final double elevation, borderRadius;

  CustomButtonStyle({
    this.initialTextStyle,
    this.finalTextStyle,
    this.primaryColor,
    this.secondaryColor,
    this.elevation,
    this.borderRadius,
  });
}

enum ButtonState {
  SHOW_ONLY_TEXT,
  SHOW_ONLY_ICON,
  SHOW_BOTH,
}
