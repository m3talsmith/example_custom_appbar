import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:ui';

class IcedContainer extends StatefulWidget {
  final Widget child;
  final double? width;
  final double? height;
  final BoxDecoration? decoration;
  final EdgeInsets? padding;

  const IcedContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.decoration,
    this.padding,
  });

  @override
  State<IcedContainer> createState() => _IcedContainerState();
}

class _IcedContainerState extends State<IcedContainer> {
  double blurx = 10;
  double blury = 10;
  double maxBlur = 50;
  double minBlur = 10;
  int blurDirection = 1;

  double getBlur(double blur) {
    if (blur == minBlur) {
      setState(() {
        blurDirection = 1;
      });
    } else if (blur == maxBlur) {
      setState(() {
        blurDirection = -1;
      });
    }
    return blur + blurDirection;
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        blurx = getBlur(blurx);
        blury = getBlur(blury);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          top: 10,
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: blurx, sigmaY: blury),
            child: Container(
              width: widget.width,
              height: widget.height,
              decoration: widget.decoration?.copyWith(
                backgroundBlendMode: BlendMode.color,
              ),
            ),
          ),
        ),
        Container(
          width: widget.width,
          height: widget.height,
          padding: widget.padding,
          decoration: widget.decoration,
          child: widget.child,
        ),
      ],
    );
  }
}
