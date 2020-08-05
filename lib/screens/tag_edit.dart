import 'package:flutter/material.dart';
import '../mock_data.dart';
import '../widgets/neu_shape.dart';

class TagEdit extends StatelessWidget {
  const TagEdit({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        titleSpacing: 20,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: FlatButton(
          onPressed: () => {},
          child: Icon(Icons.menu),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Icon(Icons.check),
            ),
          ),
          FlatButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Icon(Icons.grid_on),
            ),
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: fakeTags.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (BuildContext context, int index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: NeuShape.buttonDown(
                  child: TextField(
                    decoration: InputDecoration(hintText: ''),
                  ),
                ),
              ),
              CircleAvatar(),
              Icon(Icons.delete),
            ],
          );
        },
      ),
    );
  }
}
