import 'package:equatable/equatable.dart';
import 'package:mobile_product_1/references/todos_app_core/src/uuid.dart';

class NoteEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final List<String> tagsId;

  NoteEntity({
    String id,
    this.title = '',
    this.description = '',
    this.tagsId = const [],
  }) : this.id = id ?? Uuid().generateV4();

  Map<String, Object> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'tagsId': tagsId,
    };
  }

  static NoteEntity fromJson(Map<String, Object> json) {
    return NoteEntity(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      tagsId: json['tagsId'] as List<String>,
    );
  }

  @override
  get props => [id, title, description, tagsId];
}
