import 'dart:convert';

import 'package:mobile_product_1/entities/tag_entity.dart';
import 'package:mobile_product_1/services/models/note_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/basic_repository.dart';

class KeyValueTagRepository implements BasicRepository<TagEntity> {
  final String key;
  final SharedPreferences prefs;
  final JsonCodec codec;

  const KeyValueTagRepository(this.key, this.prefs, [this.codec = json]);

  @override
  Future<List<TagEntity>> load() async {
    return codec
        .decode(prefs.getString(key))['tags']
        .cast<Map<String, Object>>()
        .map<NoteModel>((tag) => NoteModel.fromJson(tag).toEntity())
        .toList(growable: false);
  }

  @override
  Future<bool> save(List<TagEntity> tags) {
    return prefs.setString(
      key,
      codec.encode({
        'tags': tags.map((tag) => tag.toJson()).toList(),
      }),
    );
  }
}
