import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../theme/theme.dart';

///
/// [GlassMorphism] is a widget with background frosted glass effect
/// ///
/// It can be used as follows
/// ```
/// GlassMorphism(
///   width: 20,
///   height: 20,
/// ),
/// ```
///
/// Select color from [AppColors]
///

class GlassMorphism extends HookWidget {
  const GlassMorphism({
    this.width,
    this.height,
    this.radius = 15,
    this.blur = 15,
    this.opacity = 0.1,
    this.color = AppColors.white,
    this.alignment = Alignment.center,
    this.padding,
    required this.child,
    Key? key,
  }) : super(key: key);

  final double? width;
  final double? height;
  final double radius;
  final double blur;
  final double opacity;
  final Color color;
  final AlignmentGeometry alignment;
  final EdgeInsetsGeometry? padding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaY: blur,
          sigmaX: blur,
        ),
        child: Container(
          alignment: alignment,
          width: width,
          height: height,
          padding: padding,
          decoration: BoxDecoration(
            color: color.withOpacity(opacity),
            borderRadius: BorderRadius.circular(radius),
          ),
          child: child,
        ),
      ),
    );
  }
}
