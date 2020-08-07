import 'package:equatable/equatable.dart';
import 'package:mobile_product_1/entities/tag_entity.dart';
import 'package:mobile_product_1/services/models/note_model.dart';
import 'package:mobile_product_1/references/todos_app_core/src/uuid.dart';

class NoteEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final List<TagEntity> tags;

  NoteEntity({
    String id,
    this.title = '',
    this.description = '',
    this.tags = const [],
  }) : this.id = id ?? Uuid().generateV4();

  NoteEntity.fromModel({NoteModel note, List<TagEntity> tags})
      : this.id = note.id ?? Uuid().generateV4(),
        this.title = note.title ?? '',
        this.description = note.description ?? '',
        this.tags = tags ?? const [];

  NoteModel toModel() {
    return NoteModel(
      id: id,
      title: title,
      description: description,
      tagsId: tags.map((tag) => tag.id).toList(),
      tags: tags,
    );
  }

  @override
  get props => [id, title, description, tags];

  @override
  bool get stringify => true;
}
