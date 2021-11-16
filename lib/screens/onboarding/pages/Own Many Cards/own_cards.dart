import 'package:flutter/material.dart';

import '../../../../constants.dart';

class OwnCard extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const OwnCard();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Image.asset(Cards.kcard2),
        )
      ],
    );
  }
}
