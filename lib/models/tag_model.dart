import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mobile_product_1/references/todos_app_core/src/uuid.dart';

class TagModel extends Equatable {
  final String id;
  final String name;
  final int color;

  TagModel({id, @required this.name, this.color = 0x0})
      : this.id = id ?? Uuid().generateV4();

  Map<String, Object> toJson() {
    return {
      'id': id,
      'name': name,
      'color': color,
    };
  }

  static TagModel fromJson(Map<String, Object> json) {
    return TagModel(
      id: json['id'] as String,
      name: json['name'] as String,
      color: json['color'] as int,
    );
  }

  @override
  get props => [id, name, color];

  static fromModel(tag) {}
}
