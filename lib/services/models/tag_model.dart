import 'package:meta/meta.dart';
import 'package:mobile_product_1/entities/tag_entity.dart';

class TagModel extends TagEntity {
  TagModel({id, @required String name, int color})
      : super(id: id, name: name, color: color);

  TagModel.fromEntity({TagEntity entity})
      : this(
          id: entity.id,
          name: entity.name,
          color: entity.color,
        );

  TagModel.fromJson(Map<String, Object> json)
      : this(
          id: json['id'] as String,
          name: json['name'] as String,
          color: json['color'] as int,
        );

  TagEntity toEntity() {
    return TagEntity(
      id: id,
      name: name,
      color: color,
    );
  }

  Map<String, Object> toJson() {
    return {
      'id': this.id,
      'name': this.name,
      'color': this.color,
    };
  }

  @override
  get props => [id, name, color];
}
