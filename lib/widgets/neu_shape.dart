import 'package:flutter/material.dart';
import 'package:mobile_product_1/core/constants.dart';
import '../core/inner_shadow_decoration.dart';

class NeuShape extends StatelessWidget {
  final EdgeInsets margin;
  final EdgeInsets padding;
  final double borderRadius;

  final bool withRepaintBoundary;

  final double innerDepth;
  final BoxShadow outherBrightShadow;
  final BoxShadow outherDarkShadow;
  final List<Color> borderGradientColors;
  final List<Color> innerShadowColors;

  final Widget child;

  const NeuShape.buttonUp({
    Key key,
    this.margin = const EdgeInsets.all(0.0),
    this.padding = const EdgeInsets.all(0.0),
    this.borderRadius = button_border_radius,
    this.withRepaintBoundary = true,
    this.innerDepth = neu_button_up_inner_depth,
    this.outherBrightShadow = neu_bright_box_shadow,
    this.outherDarkShadow = neu_dark_box_shadow,
    this.borderGradientColors = neu_border_gradient_colors,
    this.innerShadowColors,
    this.child,
  }) : super(key: key);

  const NeuShape.buttonDown({
    Key key,
    this.margin = const EdgeInsets.all(0.0),
    this.padding = const EdgeInsets.all(0.0),
    this.borderRadius = button_border_radius,
    this.withRepaintBoundary = true,
    this.innerDepth = neu_button_down_inner_depth,
    this.outherBrightShadow,
    this.outherDarkShadow,
    this.borderGradientColors = neu_border_gradient_colors,
    this.innerShadowColors = neu_inner_shadow_colors,
    this.child,
  }) : super(key: key);

  const NeuShape.buttonHold({
    Key key,
    this.margin = const EdgeInsets.all(0.0),
    this.padding = const EdgeInsets.all(0.0),
    this.borderRadius = button_border_radius,
    this.withRepaintBoundary = true,
    this.innerDepth = neu_button_hold_inner_depth,
    this.outherBrightShadow,
    this.outherDarkShadow,
    this.borderGradientColors = neu_border_gradient_colors,
    this.innerShadowColors = neu_inner_shadow_colors,
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
      decoration: !isBelowSurface()
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              boxShadow: [
                outherBrightShadow,
                outherDarkShadow,
              ],
              gradient: LinearGradient(
                colors: borderGradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            )
          : null,
      child: Container(
        margin: const EdgeInsets.all(border_width),
        decoration: isBelowSurface()
            ? ConcaveDecoration(
                shape: RoundedRectangleBorder(
                  //вот это посмотреть
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                depth: innerDepth,
                colors: innerShadowColors,
                //opacity: 0.6,
              )
            : BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                gradient: LinearGradient(
                  colors: neu_inner_gradient_colors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
        child: Padding(
          padding: padding,
          child: this.child ?? SizedBox(width: 20.0, height: 10.0),
        ),
      ),
    );
  }

  bool isBelowSurface() => innerDepth > 0;
}
