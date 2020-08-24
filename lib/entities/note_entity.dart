import 'package:equatable/equatable.dart';
import 'package:mobile_product_1/entities/tag_entity.dart';
import 'package:mobile_product_1/services/models/note_model.dart';
import 'package:mobile_product_1/core/uuid.dart';
import 'package:mobile_product_1/services/models/tag_model.dart';

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

  NoteEntity.fromModel({NoteModel model, List<TagModel> tags})
      : this.id = model.id,
        this.title = model.title,
        this.description = model.description,
        this.tags = tags;

  NoteModel toModel() {
    return NoteModel(
      id: this.id,
      title: this.title,
      description: this.description,
      tagsId: this.tags.map((tag) => tag.id).toList(),
    );
  }

  @override
  get props => [id, title, description, tags];

  @override
  bool get stringify => true;
}
