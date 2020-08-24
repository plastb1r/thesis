import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mobile_product_1/core/uuid.dart';
import 'package:mobile_product_1/services/models/tag_model.dart';

class TagEntity extends Equatable {
  final String id;
  final String name;
  final int color;

  TagEntity({String id, @required this.name, this.color})
      : this.id = id ?? Uuid().generateV4();

  TagEntity.fromModel(TagModel model)
      : this.id = model.id,
        this.name = model.name,
        this.color = model.color;

  TagModel toModel() {
    return TagModel(
      id: this.id,
      name: this.name,
      color: this.color,
    );
  }

  @override
  get props => [id, name, color];

  @override
  bool get stringify => true;
}
