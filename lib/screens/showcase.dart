import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_product_1/mock_data.dart';
import 'package:mobile_product_1/widgets/neu_button.dart';
import 'package:mobile_product_1/widgets/neu_chip.dart';

class ShowCase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Showcase Screen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Buttons"),
            Wrap(
              children: [
                ...List.generate(
                    2,
                    (_) => NeuButton(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 70, vertical: 20),
                        )),
                ...List.generate(
                  2,
                  (_) => NeuButton(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 70, vertical: 70),
                    borderRadius: 19,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text("Chips"),
            Wrap(
                children: List.generate(
                    8, (indx) => NeuChip(tagEntity: fakeTags[indx]))),
            SizedBox(height: 20),
            Text("Cards"),
            Wrap(children: List.generate(8, (_) => NeuButton())),
            SizedBox(height: 20),
            Text("Inside Cards"),
            Wrap(children: List.generate(8, (_) => NeuButton())),
            SizedBox(height: 20),
            Text("Inactive"),
            Wrap(children: List.generate(8, (_) => NeuButton())),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
