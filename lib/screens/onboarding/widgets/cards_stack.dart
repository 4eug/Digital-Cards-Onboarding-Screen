import 'package:flutter/material.dart';

import '../../../constants.dart';

class CardsStack extends StatelessWidget {
  final int pageNumber;
  // final Widget lightCardChild;
  final Widget darkCardChild;
  final Animation<Offset> lightCardOffsetAnimation;
  final Animation<Offset> darkCardOffsetAnimation;

  // ignore: use_key_in_widget_constructors
  const CardsStack({
    required this.pageNumber,
    // required this.lightCardChild,
    required this.darkCardChild,
    required this.lightCardOffsetAnimation,
    required this.darkCardOffsetAnimation,
  });

  bool get isOddPageNumber => pageNumber % 2 == 1;

  @override
  Widget build(BuildContext context) {
    final darkCardWidth = MediaQuery.of(context).size.width - 2 * kPaddingL;
    final darkCardHeight = MediaQuery.of(context).size.height / 3;

    return Stack(
      alignment: AlignmentDirectional.center,
      clipBehavior: Clip.none,
      children: <Widget>[
        SlideTransition(
          position: darkCardOffsetAnimation,
          // ignore: sized_box_for_whitespace
          child: SizedBox(
              height: 500,
              // padding: EdgeInsets.only(
              //   top: !isOddPageNumber ? 1.0 : 0.0,
              //   bottom: isOddPageNumber ? 10.0 : 0.0,
              // ),
              child: Center(
                child: darkCardChild,
              )),
        ),
        // Positioned(
        //   top: !isOddPageNumber ? -25.0 : null,
        //   bottom: isOddPageNumber ? -25.0 : null,
        //   child: SlideTransition(
        //     position: lightCardOffsetAnimation,
        //     child: Card(
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(16.0),
        //       ),
        //       color: kBlack,
        //       child: Container(
        //         width: darkCardWidth * 0.8,
        //         height: darkCardHeight * 0.5,
        //         padding: const EdgeInsets.symmetric(horizontal: kPaddingM),
        //         // child: Center(child: lightCardChild),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
