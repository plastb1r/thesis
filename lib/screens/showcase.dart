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
            SizedBox(height: 30),
            Text("Buttons"),
            Wrap(
              children: [
                ...List.generate(
                    2,
                    (_) => NeuButton(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 65, vertical: 20),
                        )),
                ...List.generate(
                  2,
                  (_) => NeuButton(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 65, vertical: 65),
                  ),
                ),
                ...List.generate(
                  4,
                  (_) => NeuButton(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 70),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Text("Chips"),
            Wrap(
                children: List.generate(
                    8, (indx) => NeuChip(tagEntity: fakeTags[indx]))),
            SizedBox(height: 30),
            Text("Cards"),
            Wrap(
                children: List.generate(
                    8,
                    (_) => NeuButton(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 65, vertical: 20)))),
            SizedBox(height: 30),
            Text("Inside Cards"),
            Wrap(children: List.generate(8, (_) => NeuButton())),
            SizedBox(height: 30),
            Text("Inactive"),
            Wrap(children: List.generate(8, (_) => NeuButton())),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
