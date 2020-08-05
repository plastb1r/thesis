import 'package:flutter/material.dart';
import 'inner_shadow_decoration.dart';

class NeuShape extends StatelessWidget {
  static const double _borderWidth = 1.0;

  final EdgeInsets margin;
  final EdgeInsets padding;
  final double borderRadius;

  final bool withRepaintBoundary;

  final double innerDepth;
  final BoxShadow brightBoxShadow;
  final BoxShadow darkBoxShadow;
  final List<Color> borderGradientColors;
  final List<Color> innerGradientColors;
  final List<Color> innerShadowColors;

  final Widget child;

  const NeuShape.buttonUp({
    Key key,
    this.margin = const EdgeInsets.all(0.0),
    this.padding = const EdgeInsets.all(0.0),
    this.borderRadius = 200.0,
    this.withRepaintBoundary = true,
    this.innerDepth = 0.0,
    this.brightBoxShadow = const BoxShadow(
      color: Color(0xFFFFFFFF),
      blurRadius: 8.0,
      offset: Offset(-4.0, -4.0),
    ),
    this.darkBoxShadow = const BoxShadow(
      color: Color(0xFFA6B4C8),
      blurRadius: 6.0,
      offset: Offset(5.0, 5.0),
    ),
    this.borderGradientColors = const [
      Color(0xFFFFFFFF),
      Color(0xFFC6CEDA),
    ],
    this.innerGradientColors,
    this.innerShadowColors,
    this.child,
  }) : super(key: key);

  const NeuShape.buttonDown({
    Key key,
    this.margin = const EdgeInsets.all(0.0),
    this.padding = const EdgeInsets.all(0.0),
    this.borderRadius = 200.0,
    this.withRepaintBoundary = true,
    this.innerDepth = 7.0,
    this.brightBoxShadow,
    this.darkBoxShadow,
    this.borderGradientColors = const [
      Color(0xFFC6CEDA),
      Color(0xFFFFFFFF),
    ],
    this.innerShadowColors = const [
      Color(0xFFFFFFFF),
      Color(0xFFA6B4C8),
    ],
    this.innerGradientColors,
    this.child,
  }) : super(key: key);

  const NeuShape.buttonHold({
    Key key,
    this.margin = const EdgeInsets.all(0.0),
    this.padding = const EdgeInsets.all(0.0),
    this.borderRadius = 200.0,
    this.withRepaintBoundary = true,
    this.innerDepth = 7.0,
    this.brightBoxShadow,
    this.darkBoxShadow,
    this.borderGradientColors = const [
      Color(0xFFC6CEDA),
      Color(0xFFFFFFFF),
    ],
    this.innerShadowColors = const [
      Color(0xFFEAEFF5),
      Color(0xFF8894A5),
    ],
    this.innerGradientColors,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return withRepaintBoundary
        ? RepaintBoundary(child: _build(context))
        : _build(context);
  }

  Widget _build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: brightBoxShadow != null && darkBoxShadow != null
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              boxShadow: [
                brightBoxShadow,
                darkBoxShadow,
              ],
              gradient: LinearGradient(
                colors: borderGradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            )
          : null,
      child: Container(
        margin: const EdgeInsets.all(NeuShape._borderWidth),
        decoration: innerShadowColors != null
            ? ConcaveDecoration(
                shape: RoundedRectangleBorder(
                  //вот это посмотреть
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                depth: innerDepth,
                colors: innerShadowColors,
              )
            : BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                gradient: LinearGradient(
                  colors: [Color(0xFFEEF0F5), Color(0xFFE6E9EF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
        child: Padding(
          padding: padding,
          child: this.child ?? SizedBox(width: 0, height: 0),
        ),
      ),
    );
  }
}
