import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class ConcaveDecoration extends Decoration {
  final ShapeBorder shape;
  final double depth;
  final List<Color> colors;
  final double opacity;

  ConcaveDecoration({
    @required this.shape,
    @required this.depth,
    this.colors = const [Colors.black87, Colors.white],
    this.opacity = 1.0,
  })  : assert(shape != null),
        assert(colors == null || colors.length == 2);

  @override
  BoxPainter createBoxPainter([onChanged]) =>
      _ConcaveDecorationPainter(shape, depth, colors, opacity);

  @override
  EdgeInsetsGeometry get padding => shape.dimensions;

  @override
  Decoration lerpFrom(Decoration a, double t) {
    if (a is ConcaveDecoration) {
      t = Curves.easeInOut.transform(t);
      return ConcaveDecoration(
        shape: ShapeBorder.lerp(a.shape, shape, t),
        depth: ui.lerpDouble(a.depth, depth, t),
        colors: [
          Color.lerp(a.colors[0], colors[0], t),
          Color.lerp(a.colors[1], colors[1], t),
        ],
        opacity: ui.lerpDouble(a.opacity, opacity, t),
      );
    }
    return null;
  }
}

class _ConcaveDecorationPainter extends BoxPainter {
  ShapeBorder shape;
  double depth;
  List<Color> colors;
  double opacity;

  _ConcaveDecorationPainter(this.shape, this.depth, this.colors, this.opacity) {
    if (depth > 0) {
      colors = [
        colors[1],
        colors[0],
      ];
    } else {
      depth = -depth;
    }
    colors = [
      colors[0].withOpacity(opacity),
      colors[1].withOpacity(opacity),
    ];
  }

  @override
  void paint(
      ui.Canvas canvas, ui.Offset offset, ImageConfiguration configuration) {
    final shapePath = shape.getOuterPath(offset & configuration.size);
    final rect = shapePath.getBounds();

    final delta = 32 / rect.longestSide;
    final stops = [0.5 - delta, 0.5 + delta];

    final path = Path()
      ..fillType = PathFillType.evenOdd
      ..addRect(rect.inflate(depth * 2))
      ..addPath(shapePath, Offset.zero);
    canvas.save();
    canvas.clipPath(shapePath);

    final paint = Paint()
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, depth);

    List<Offset> offsets = getGradientOffsets(rect.size);

    paint..shader = ui.Gradient.linear(offsets[0], offsets[1], colors, stops);

    canvas.save();
    canvas.drawPath(path, paint);
    canvas.restore();
    canvas.restore();
  }

  List<Offset> getGradientOffsets(Size boxSize) {
    final diagonal =
        sqrt(boxSize.height * boxSize.height + boxSize.width * boxSize.width);

    if (boxSize.aspectRatio > 1) {
      final cosine = boxSize.width / diagonal;
      final delta = diagonal / (2 * cosine);
      return [Offset(boxSize.width - delta, 0), Offset(delta, boxSize.height)];
    } else {
      final cosine = boxSize.height / diagonal;
      final delta = diagonal / (2 * cosine);
      return [Offset(0, boxSize.height - delta), Offset(boxSize.width, delta)];
    }
  }
}
