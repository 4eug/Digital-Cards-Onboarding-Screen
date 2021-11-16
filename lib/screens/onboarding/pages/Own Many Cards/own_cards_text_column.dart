import 'package:flutter/material.dart';

import '../../widgets/text_column.dart';

class OwnCardText extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const OwnCardText();

  @override
  Widget build(BuildContext context) {
    return const TextColumn(
      title: 'Own Many Cards',
      text: 'Add as many cards to your digital wallet',
    );
  }
}
