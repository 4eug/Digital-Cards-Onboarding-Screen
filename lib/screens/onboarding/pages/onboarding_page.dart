// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../widgets/cards_stack.dart';

class OnboardingPage extends StatelessWidget {
  final int number;
  final Widget darkCardChild;
  final Animation<Offset> lightCardOffsetAnimation;
  final Animation<Offset> darkCardOffsetAnimation;
  final Widget textColumn;

  const OnboardingPage({
    required this.number,
    required this.darkCardChild,
    required this.lightCardOffsetAnimation,
    required this.darkCardOffsetAnimation,
    required this.textColumn,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CardsStack(
          pageNumber: number,
          darkCardChild: darkCardChild,
          lightCardOffsetAnimation: lightCardOffsetAnimation,
          darkCardOffsetAnimation: darkCardOffsetAnimation,
        ),
        AnimatedSwitcher(
          duration: kCardAnimationDuration,
          child: textColumn,
        ),
      ],
    );
  }
}
