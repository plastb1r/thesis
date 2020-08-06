import 'package:mobile_product_1/models/note_entity.dart';
import 'models/tag_entity.dart';

// final List<NoteEntity> fakeData = [
//   NoteEntity(
//       '1headerodoadkoksdoicsod woidasd oiwej kod kweoikwohfishfoiseuhfo9hfohvoahvodhgo9hvdoizjvopvjodfhvjk;xzfpoidfhjvlkc hoiwe jf9weoifj eae9 ofsja9ef joae f9jawf iudi jfaef hnaeieosjf apeffks;zl vndhaoeijfpofdkw',
//       'madkw eikwodkweokssc,sdpinText',
//       [Tag('name'), Tag('dd')]),
//   NoteEntity('2', '2', [Tag('e'), Tag('d')]),
//   NoteEntity('3header', 'mainText', [Tag('ngbfvds'), Tag('dd')]),
//   NoteEntity('4dsgbdsdv', '', [Tag('sss'), Tag('qqqq')]),
//   NoteEntity('5', 'mainText', [Tag('name'), Tag('dd')]),
//   NoteEntity('6header', 'mainText', [Tag('name'), Tag('dd')]),
//   NoteEntity('7header', 'mainText', [Tag('name'), Tag('dd')]),
//   NoteEntity('8headerodoadkoksdoicsod woidasd oiwej kod kweoikwodkw',
//       'madkw eikwodkweokssc,sdpinText', [Tag('name'), Tag('dd')]),
//   NoteEntity('9header', 'mainText', [Tag('e'), Tag('d')]),
//   NoteEntity('10header', 'mainText', [Tag('ngbfvds'), Tag('dd')]),
//   NoteEntity('11sgbdsdv', '', [Tag('sss'), Tag('qqqq')]),
//   NoteEntity('12', 'mainText', [Tag('name'), Tag('dd')]),
//   NoteEntity('13header', 'mainText', [Tag('name'), Tag('dd')]),
//   NoteEntity('14header', 'mainText', [Tag('name'), Tag('dd')]),
//   NoteEntity('15headerodoadkoksdoicsod woidasd oiwej kod kweoikwodkw',
//       'madkw eikwodkweokssc,sdpinText', [Tag('name'), Tag('dd')]),
//   NoteEntity('16header', 'mainText', [Tag('e'), Tag('d')]),
//   NoteEntity('17header', 'mainText', [Tag('ngbfvds'), Tag('dd')]),
//   NoteEntity('18dsgbdsdv', '', [Tag('sss'), Tag('qqqq')]),
//   NoteEntity('19', 'mainText', [Tag('name'), Tag('dd')]),
//   NoteEntity('20header', 'mainText', [Tag('name'), Tag('dd')]),
//   NoteEntity('21header', 'mainText', [Tag('name'), Tag('dd')]),
//   NoteEntity('22headerodoadkoksdoicsod woidasd oiwej kod kweoikwodkw',
//       'madkw eikwodkweokssc,sdpinText', [Tag('name'), Tag('dd')]),
//   NoteEntity('23header', 'mainText', [Tag('e'), Tag('d')]),
//   NoteEntity('24header', 'mainText', [Tag('ngbfvds'), Tag('dd')]),
//   NoteEntity('25dsgbdsdv', '', [Tag('sss'), Tag('qqqq')]),
//   NoteEntity('26', 'mainText', [Tag('name'), Tag('dd')]),
//   NoteEntity('27header', 'mainText', [Tag('name'), Tag('dd')]),
//   NoteEntity('28header', 'mainText', [Tag('name'), Tag('dd')]),
//   NoteEntity('29headerodoadkoksdoicsod woidasd oiwej kod kweoikwodkw',
//       'madkw eikwodkweokssc,sdpinText', [Tag('name'), Tag('dd')]),
//   NoteEntity('header', 'mainText', [Tag('e'), Tag('d')]),
//   NoteEntity('header', 'mainText', [Tag('ngbfvds'), Tag('dd')]),
//   NoteEntity('dsgbdsdv', '', [Tag('sss'), Tag('qqqq')]),
//   NoteEntity('', 'mainText', [Tag('name'), Tag('dd')]),
//   NoteEntity('header', 'mainText', [Tag('name'), Tag('dd')]),
//   NoteEntity('header', 'mainText', [Tag('name'), Tag('dd')]),
//   NoteEntity('headerodoadkoksdoicsod woidasd oiwej kod kweoikwodkw',
//       'madkw eikwodkweokssc,sdpinText', [Tag('name'), Tag('dd')]),
//   NoteEntity('header', 'mainText', [Tag('e'), Tag('d')]),
//   NoteEntity('header', 'mainText', [Tag('ngbfvds'), Tag('dd')]),
//   NoteEntity('dsgbdsdv', '', [Tag('sss'), Tag('qqqq')]),
//   NoteEntity('', 'mainText', [Tag('name'), Tag('dd')]),
//   NoteEntity('header', 'mainText', [Tag('name'), Tag('dd')]),
//   NoteEntity('header', 'mainText', [Tag('name'), Tag('dd')]),
// ];

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
    (index) =>
        TagEntity(name: 'tag tag$index', color: 0xFF200000 + 0x60 * index));
