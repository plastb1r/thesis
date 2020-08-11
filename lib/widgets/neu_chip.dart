import 'package:flutter/widgets.dart';
import 'package:mobile_product_1/entities/tag_entity.dart';

import 'neu_button.dart';

class NeuChip extends StatelessWidget {
  final Key key;
  final double _borderRadius = 200.0;
  final TagEntity tagEntity;

  NeuChip({Key key, @required this.tagEntity})
      : this.key = key ?? Key(tagEntity.id),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeuButton(
      key: key,
      padding: EdgeInsets.symmetric(vertical: 37, horizontal: 8),
      child: Container(
        margin: EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_borderRadius),
          color: Color(tagEntity.color),
        ),
        child: Text(tagEntity.name),
      ),
    );
  }
}
