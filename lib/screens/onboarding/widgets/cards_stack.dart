import 'package:flutter/material.dart';

class CardsStack extends StatelessWidget {
  final int pageNumber;
  final Widget darkCardChild;
  final Animation<Offset> lightCardOffsetAnimation;
  final Animation<Offset> darkCardOffsetAnimation;

  // ignore: use_key_in_widget_constructors
  const CardsStack({
    required this.pageNumber,
    required this.darkCardChild,
    required this.lightCardOffsetAnimation,
    required this.darkCardOffsetAnimation,
  });

  bool get isOddPageNumber => pageNumber % 2 == 1;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      clipBehavior: Clip.none,
      children: <Widget>[
        SlideTransition(
          position: darkCardOffsetAnimation,
          // ignore: sized_box_for_whitespace
          child: SizedBox(
              height: 500,
              child: Center(
                child: darkCardChild,
              )),
        ),
      ],
    );
  }
}
