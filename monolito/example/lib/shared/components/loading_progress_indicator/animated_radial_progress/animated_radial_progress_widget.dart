import 'dart:math';

import 'package:flutter/cupertino.dart';

class AnimatedRadialProgressWidget extends StatefulWidget {
  final double size;
  final int animationConstant;
  final String assetPath;
  AnimatedRadialProgressWidget({
    Key? key,
    required this.size,
    required this.animationConstant,
    required this.assetPath,
  }) : super(key: key);

  @override
  _AnimatedRadialProgressWidgetState createState() =>
      _AnimatedRadialProgressWidgetState();
}

class _AnimatedRadialProgressWidgetState
    extends State<AnimatedRadialProgressWidget> with TickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1500))
          ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        return Transform.rotate(
          angle: _controller.value * widget.animationConstant * pi,
          child: Image.asset(widget.assetPath),
        );
      },
    );
  }
}
