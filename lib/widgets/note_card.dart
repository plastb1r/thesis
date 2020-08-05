import 'package:flutter/material.dart';
import 'package:mobile_product_1/models/note_entity.dart';
import 'package:mobile_product_1/widgets/neu_shape.dart';

class NoteCard extends StatelessWidget {
  final NoteEntity data;

  NoteCard(this.data, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<NeuShape> tags = data.tagsId
        .map((tag) =>
            NeuShape.buttonDown(withRepaintBoundary: false, child: Text(tag)))
        .toList();

    return NeuShape.buttonDown(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            data.title,
            style: TextStyle(
              fontSize: 19.0,
              color: Color(0xFF515151),
            ),
          ),
          SizedBox(height: 10),
          Text(
            data.description,
            style: TextStyle(
              fontSize: 15.0,
              color: Color(0xFF787878),
            ),
          ),
          SizedBox(height: 5),
          Row(
            children: <Widget>[
              NeuShape.buttonDown(
                padding: const EdgeInsets.all(9.0),
                withRepaintBoundary: false,
                child: Text(
                  'tag',
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Color(0xFF494949),
                  ),
                ),
              ),
              SizedBox(
                width: 9.0,
              ),
              Wrap(
                children: <Widget>[...tags],
              )
            ],
          )
        ],
      ),
    );
  }
}
