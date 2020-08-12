import 'package:flutter/widgets.dart';
import 'package:mobile_product_1/core/constants.dart';
import 'package:mobile_product_1/entities/tag_entity.dart';

import 'neu_button.dart';

class NeuChip extends StatelessWidget {
  final Key key;
  final TagEntity tagEntity;

  NeuChip({Key key, @required this.tagEntity})
      : this.key = key ?? Key(tagEntity.id),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeuButton(
      key: key,
      child: Container(
        margin: const EdgeInsets.all(neu_button_colored_field_padding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(button_border_radius),
          color: Color(tagEntity.color),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: neu_button_text_padding_height,
              vertical: neu_button_text_padding_width),
          child: Text(tagEntity.name),
        ),
      ),
    );
  }
}
