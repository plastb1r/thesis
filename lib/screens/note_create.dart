import 'package:flutter/material.dart';
import '../mock_data.dart';
import '../widgets/neu_button.dart';
import '../widgets/neu_shape.dart';

class CreateNote extends StatelessWidget {
  const CreateNote({Key key}) : super(key: key);

  int operator [](int index) => 1;

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
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              minLines: 1,
              maxLines: 1000000,
              style: TextStyle(fontSize: 25.0),
              decoration: InputDecoration(
                hintText: 'Header',
                border: InputBorder.none,
              ),
            ),
            TextField(
              style: TextStyle(fontSize: 17.0),
              minLines: 9,
              maxLines: 1000000,
              decoration: InputDecoration(
                hintText: 'Body text',
                border: InputBorder.none,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                NeuShape.buttonUp(
                  child: FlatButton(
                    onPressed: () async {
                      await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now(),
                      );
                    },
                    child: Row(
                      children: <Widget>[
                        Text('data'),
                        SizedBox(width: 5),
                        Icon(Icons.keyboard_arrow_down)
                      ],
                    ),
                  ),
                ),
                NeuShape.buttonUp(
                  child: FlatButton(
                    onPressed: () async {
                      await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                    },
                    child: Row(
                      children: <Widget>[
                        Text('time'),
                        SizedBox(width: 5),
                        Icon(Icons.keyboard_arrow_down)
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Wrap(
              spacing: 30,
              runSpacing: 30,
              //alignment: WrapAlignment.start,
              children: <Widget>[
                ...fakeTags
                    .map(
                      (tag) => NeuButton(
                        // child: FlatButton(
                        child: Text(tag.name),
                        //   onPressed: () {},
                        // ),
                      ),
                    )
                    .toList()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
