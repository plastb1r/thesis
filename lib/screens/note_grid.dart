import 'package:flutter/material.dart';
import 'package:masonry_grid/masonry_grid.dart';

import '../mock_data.dart';
import '../widgets/neu_shape.dart';
import '../widgets/note_card.dart';

class NotesGrid extends StatefulWidget {
  const NotesGrid({Key key}) : super(key: key);

  @override
  _NotesGridState createState() => _NotesGridState();
}

class _NotesGridState extends State<NotesGrid> {
  List<NoteCard> cards;

  @override
  void initState() {
    cards = List.generate(fakeNotes.length - 1, (i) => NoteCard(fakeNotes[i]));
    super.initState();
  }

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
          child: NeuShape.buttonUp(child: Icon(Icons.menu)),
        ),
        title: NeuShape.buttonDown(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0),
              prefixIcon: Icon(Icons.search),
              hintText: 'Search for ',
              border: InputBorder.none,
            ),
            maxLines: 1,
          ),
        ),
        actions: <Widget>[
          NeuShape.buttonUp(
            child: FlatButton(
              onPressed: () => {},
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: MasonryGrid(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                staggered: true,
                column: 2,
                children: cards),
          ),
        ],
      ),
    );
  }
}
