import 'dart:convert';

import 'package:mobile_product_1/entities/note_entity.dart';
import 'package:mobile_product_1/entities/tag_entity.dart';
import 'package:mobile_product_1/services/repositories/key_value_tag_repository.dart';
import 'package:mobile_product_1/services/models/note_model.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'core/basic_repository.dart';

class KeyValueNoteRepository implements BasicRepository<NoteModel> {
  final String key;
  final SharedPreferences prefs;
  final JsonCodec codec;
  final KeyValueTagRepository tagRepository;

  const KeyValueNoteRepository(this.key, this.prefs, this.tagRepository,
      [this.codec = json]);

  @override
  Future<List<NoteModel>> load() async {
    final noteModels = await _loadNoteModel();
    final tags = await tagRepository.load();

    final taggedNotes = noteModels.map((note) {
      List<TagEntity> requiredTags = _getTagsRequiredForEntity(note, tags);
      return NoteEntity.fromModel(note: note, tags: requiredTags);
    }).toList();

    return taggedNotes;
  }

  Future<List<NoteModel>> _loadNoteModel() async {
    return codec
        .decode(prefs.getString(key))['notes']
        .cast<Map<String, Object>>()
        .map<NoteModel>(NoteModel.fromJson)
        .toList(growable: false);
  }

  List<TagEntity> _getTagsRequiredForEntity(
      NoteModel entity, List<TagEntity> tags) {
    return tags
        .where((tag) => entity.tagsId.contains(tag.id))
        .map((tag) => TagEntity.fromModel(tag));
  }

  @override
  Future<bool> save(List<NoteEntity> notes) {
    return prefs.setString(
      key,
      codec.encode({
        'notes': notes
            .map((note) => NoteModel.fromEntity(entity: note).toJson())
            .toList(),
      }),
    );
  }
}
