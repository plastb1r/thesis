import 'package:meta/meta.dart';
import 'package:mobile_product_1/models/note_entity.dart';
import 'package:mobile_product_1/models/tag_entity.dart';

class TaggedNote extends NoteEntity {
  final List<TagEntity> tags;

  TaggedNote({
    this.tags = const [],
    id,
    title = '',
    description = '',
    tagsId = const [],
  }) : super(
          id: id,
          title: title,
          description: description,
          tagsId: tagsId,
        );

  TaggedNote.fromEntity({@required NoteEntity entity, List<TagEntity> tags})
      : this(
          tags: tags,
          id: entity.id,
          title: entity.title,
          description: entity.description,
          tagsId: entity.tagsId,
        );

  NoteEntity toEntity() {
    return NoteEntity(
      id: id,
      title: title,
      description: description,
      tagsId: tagsId,
    );
  }
}
