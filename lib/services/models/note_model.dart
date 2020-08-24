import 'package:mobile_product_1/entities/note_entity.dart';
import 'package:mobile_product_1/entities/tag_entity.dart';

class NoteModel extends NoteEntity {
  final List<String> tagsId;

  NoteModel({
    String id,
    String title,
    String description,
    List<String> tagsId,
    List<TagEntity> tags = const [],
  })  : this.tagsId = tagsId ?? tags.map((tag) => tag.id).toList(),
        super(
          id: id,
          title: title,
          description: description,
          tags: tags,
        );

  NoteModel.fromEntity({NoteEntity entity, List<String> tagsId})
      : this(
          id: entity.id,
          title: entity.title,
          description: entity.description,
          tagsId: tagsId,
          tags: entity.tags,
        );

  NoteModel.fromJson(Map<String, Object> json)
      : this(
          id: json['id'] as String,
          title: json['title'] as String,
          description: json['description'] as String,
          tagsId: json['tagsId'] as List<String>,
        );

  NoteEntity toEntity() {
    return NoteEntity(
      id: this.id,
      title: this.title,
      description: this.description,
      tags: this.tags,
    );
  }

  Map<String, Object> toJson() {
    return {
      'id': this.id,
      'title': this.title,
      'description': this.description,
      'tagsId': this.tagsId,
    };
  }
}
