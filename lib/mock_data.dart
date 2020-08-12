import 'entities/note_entity.dart';
import 'entities/tag_entity.dart';

List<NoteEntity> fakeNotes = List.generate(
    30,
    (index) => NoteEntity(id: 'id $index', title: 'title$index', tags: [
          // '$index', 'test'
          TagEntity(name: 'tag$index', color: 0xFF200000 + 0x60 * index),
          TagEntity(name: 'tag$index', color: 0xFF400000 + 0x60 * index),
          TagEntity(name: 'tag$index', color: 0xFF800000 + 0x60 * index),
        ]));

List<TagEntity> fakeTags = List.generate(
    30,
    (index) => TagEntity(
        name: 'loooong index $index', color: 0xFF6AE0B6 + 0xA0 * index));
