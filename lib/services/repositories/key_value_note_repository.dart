import 'dart:convert';

import 'package:mobile_product_1/services/repositories/key_value_tag_repository.dart';
import 'package:mobile_product_1/models/note_entity.dart';
import 'package:mobile_product_1/models/tag_entity.dart';
import 'package:mobile_product_1/models/tagged_note.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/basic_repository.dart';

class KeyValueNoteRepository implements BasicRepository<TaggedNote> {
  final String key;
  final SharedPreferences prefs;
  final JsonCodec codec;
  final KeyValueTagRepository tagRepository;

  const KeyValueNoteRepository(this.key, this.prefs, this.tagRepository,
      [this.codec = json]);

  @override
  Future<List<TaggedNote>> load() async {
    List<NoteEntity> noteEntities = await _loadNoteEntity();
    List<TagEntity> tags = await tagRepository.load();

    List<TaggedNote> taggedNotes = noteEntities.map((entity) {
      List<TagEntity> requiredTags = _getTagsRequiredForEntity(entity, tags);
      return TaggedNote.fromEntity(entity: entity, tags: requiredTags);
    }).toList();

    return taggedNotes;
  }

  Future<List<NoteEntity>> _loadNoteEntity() async {
    return codec
        .decode(prefs.getString(key))['notes']
        .cast<Map<String, Object>>()
        .map<NoteEntity>(NoteEntity.fromJson)
        .toList(growable: false);
  }

  List<TagEntity> _getTagsRequiredForEntity(
      NoteEntity entity, List<TagEntity> tags) {
    return tags.where((tag) => entity.tagsId.contains(tag.id)).toList();
  }

  @override
  Future<bool> save(List<TaggedNote> notes) {
    return prefs.setString(
      key,
      codec.encode({
        'notes': notes.map((note) => note.toEntity().toJson()).toList(),
      }),
    );
  }
}
