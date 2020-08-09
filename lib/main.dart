import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobile_product_1/screens/note_create.dart';
import 'package:mobile_product_1/screens/note_grid.dart';
import 'package:mobile_product_1/screens/tag_edit.dart';

const int background_color = 0xFFE9EDF0;

void main() {
  debugProfilePaintsEnabled = true;
  //debugProfileBuildsEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showPerformanceOverlay: true,
      //checkerboardRasterCacheImages: true,
      //checkerboardOffscreenLayers: true,
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Color(background_color),
        scaffoldBackgroundColor: Color(background_color),
      ),
      home: PageView(
        children: [CreateNote()],
      ),
    );
  }
}
