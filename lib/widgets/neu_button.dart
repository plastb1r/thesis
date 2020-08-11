import 'package:flutter/widgets.dart';
import 'package:mobile_product_1/widgets/neu_shape.dart';

enum ButtonState { up, down, hold }

typedef void NeuButtonClickListener();

class NeuButton extends StatefulWidget {
  final EdgeInsets padding;
  final double borderRadius;
  final NeuButtonClickListener onPressed;
  final Widget child;

  const NeuButton(
      {Key key,
      this.padding =
          const EdgeInsets.symmetric(horizontal: 28.0, vertical: 15.0),
      this.borderRadius = 200,
      this.onPressed,
      this.child})
      : super(key: key);

  @override
  _NeuButtonState createState() => _NeuButtonState();
}

class _NeuButtonState extends State<NeuButton> {
  NeuShape shapeUp;
  NeuShape shapeDown;
  NeuShape shapeHold;

  ButtonState nextState;
  bool isSelected;

  @override
  void initState() {
    shapeUp = NeuShape.buttonUp(
      padding: widget.padding,
      borderRadius: widget.borderRadius,
      child: widget.child,
    );
    shapeDown = NeuShape.buttonDown(
      padding: widget.padding,
      borderRadius: widget.borderRadius,
      child: widget.child,
    );
    shapeHold = NeuShape.buttonHold(
      padding: widget.padding,
      borderRadius: widget.borderRadius,
      child: widget.child,
    );
    nextState = ButtonState.up;
    isSelected = false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          nextState = ButtonState.hold;
        });
      },
      onTapUp: (_) {
        setState(() {
          isSelected
              ? nextState = ButtonState.up
              : nextState = ButtonState.down;
          isSelected = !isSelected;
        });
      },
      onTapCancel: () {
        setState(() {
          isSelected
              ? nextState = ButtonState.down
              : nextState = ButtonState.up;
        });
      },
      child: AnimatedCrossFade(
        crossFadeState: nextState == ButtonState.hold
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        duration: const Duration(milliseconds: 200),
        firstChild: Padding(
          padding: const EdgeInsets.all(14),
          child: isSelected ? shapeDown : shapeUp,
        ),
        secondChild: Padding(
          padding: const EdgeInsets.all(14),
          child: shapeHold,
        ),
      ),
    );
  }
}
