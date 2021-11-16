// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../../../constants.dart';

class NextPageButton extends StatelessWidget {
  final VoidCallback onPressed;

  const NextPageButton({
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: const EdgeInsets.all(kPaddingM),
      elevation: 0.0,
      shape: const CircleBorder(),
      fillColor: kBlack,
      onPressed: onPressed,
      child: const Icon(
        Icons.arrow_forward,
        color: kWhite,
        size: 32.0,
      ),
    );
  }
}
