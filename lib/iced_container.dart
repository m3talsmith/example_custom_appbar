import 'package:flutter/material.dart';
import 'dart:ui';

class IcedContainer extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          top: 15,
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: Container(
              width: width,
              height: height,
              decoration: decoration?.copyWith(
                backgroundBlendMode: BlendMode.color,
              ),
            ),
          ),
        ),
        Container(
          width: width,
          height: height,
          padding: padding,
          decoration: decoration,
          child: child,
        ),
      ],
    );
  }
}
