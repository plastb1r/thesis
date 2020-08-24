import 'dart:convert';

import 'package:mobile_product_1/entities/note_entity.dart';
import 'package:mobile_product_1/entities/tag_entity.dart';
import 'package:mobile_product_1/services/models/note_model.dart';
import 'package:mobile_product_1/services/models/tag_model.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'core/basic_repository.dart';

class KeyValueNoteRepository implements BasicRepository<NoteEntity> {
  final String key;
  final SharedPreferences prefs;
  final BasicRepository tagRepository;
  final JsonCodec codec;

  const KeyValueNoteRepository(this.key, this.prefs, this.tagRepository,
      [this.codec = json]);

  @override
  Future<List<NoteEntity>> load() async {
    final noteModels = await _loadNoteModel();
    final tags = await tagRepository.load();

    final taggedNotes = noteModels.map((note) {
      List<TagModel> requiredTags = _getTagsRequiredForEntity(note, tags);
      return NoteEntity.fromModel(model: note, tags: requiredTags);
    }).toList();

    return taggedNotes;
  }

  Future<List<NoteModel>> _loadNoteModel() async {
    return codec
        .decode(prefs.getString(key))['notes']
        .cast<Map<String, Object>>()
        .map<NoteModel>((note) => NoteModel.fromJson(note))
        .toList();
  }

  List<TagModel> _getTagsRequiredForEntity(
      NoteModel entity, List<TagModel> tags) {
    return tags.where((tag) => entity.tagsId.contains(tag.id)).toList();
  }

  @override
  Future<bool> save(List<NoteEntity> notes) {
    return prefs.setString(
      key,
      codec.encode({
        'notes': notes.map((note) => note.toModel().toJson()).toList(),
      }),
    );
  }
}
