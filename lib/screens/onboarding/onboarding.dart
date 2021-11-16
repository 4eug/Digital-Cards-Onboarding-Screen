import 'dart:math';

import 'package:flutter/material.dart';

import '../../constants.dart';
import 'pages/Create A Card/index.dart';
import 'pages/Notifications/index.dart';
import 'pages/Own Many Cards/index.dart';
import 'pages/onboarding_page.dart';
import 'widgets/next_page_button.dart';
import 'widgets/onboarding_page_indicator.dart';

class Onboarding extends StatefulWidget {
  final double screenHeight;

  // ignore: use_key_in_widget_constructors
  const Onboarding({
    required this.screenHeight,
  });

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> with TickerProviderStateMixin {
  late final AnimationController _cardsAnimationController;
  late final AnimationController _pageIndicatorAnimationController;

  late Animation<Offset> _slideAnimationLightCard;
  late Animation<Offset> _slideAnimationDarkCard;
  late Animation<double> _pageIndicatorAnimation;

  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    _cardsAnimationController = AnimationController(
      vsync: this,
      duration: kCardAnimationDuration,
    );
    _pageIndicatorAnimationController = AnimationController(
      vsync: this,
      duration: kButtonAnimationDuration,
    );

    _setPageIndicatorAnimation();
    _setCardsSlideOutAnimation();
  }

  @override
  void dispose() {
    _cardsAnimationController.dispose();
    _pageIndicatorAnimationController.dispose();
    super.dispose();
  }

  bool get isFirstPage => _currentPage == 1;

  Widget _getPage() {
    switch (_currentPage) {
      case 1:
        return OnboardingPage(
          number: 1,
          darkCardChild: const CreateCard(),
          lightCardOffsetAnimation: _slideAnimationLightCard,
          darkCardOffsetAnimation: _slideAnimationDarkCard,
          textColumn: const CreateCardText(),
        );
      case 2:
        return OnboardingPage(
          number: 2,
          darkCardChild: const OwnCard(),
          lightCardOffsetAnimation: _slideAnimationLightCard,
          darkCardOffsetAnimation: _slideAnimationDarkCard,
          textColumn: const OwnCardText(),
        );
      case 3:
        return OnboardingPage(
          number: 3,
          darkCardChild: const NotificationCard(),
          lightCardOffsetAnimation: _slideAnimationLightCard,
          darkCardOffsetAnimation: _slideAnimationDarkCard,
          textColumn: const NotificationText(),
        );
      default:
        throw Exception("Page with number '$_currentPage' does not exist.");
    }
  }

  void _setCardsSlideInAnimation() {
    setState(() {
      _slideAnimationLightCard = Tween<Offset>(
        begin: const Offset(3.0, 0.0),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: _cardsAnimationController,
        curve: Curves.easeOut,
      ));
      _slideAnimationDarkCard = Tween<Offset>(
        begin: const Offset(1.5, 0.0),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: _cardsAnimationController,
        curve: Curves.easeOut,
      ));
      _cardsAnimationController.reset();
    });
  }

  void _setCardsSlideOutAnimation() {
    setState(() {
      _slideAnimationLightCard = Tween<Offset>(
        begin: Offset.zero,
        end: const Offset(-3.0, 0.0),
      ).animate(CurvedAnimation(
        parent: _cardsAnimationController,
        curve: Curves.easeIn,
      ));
      _slideAnimationDarkCard = Tween<Offset>(
        begin: Offset.zero,
        end: const Offset(-1.5, 0.0),
      ).animate(CurvedAnimation(
        parent: _cardsAnimationController,
        curve: Curves.easeIn,
      ));
      _cardsAnimationController.reset();
    });
  }

  void _setPageIndicatorAnimation({bool isClockwiseAnimation = true}) {
    final multiplicator = isClockwiseAnimation ? 2 : -2;

    setState(() {
      _pageIndicatorAnimation = Tween(
        begin: 0.0,
        end: multiplicator * pi,
      ).animate(
        CurvedAnimation(
          parent: _pageIndicatorAnimationController,
          curve: Curves.easeIn,
        ),
      );
      _pageIndicatorAnimationController.reset();
    });
  }

  void _setNextPage(int nextPageNumber) {
    setState(() {
      _currentPage = nextPageNumber;
    });
  }

  Future<void> _nextPage() async {
    switch (_currentPage) {
      case 1:
        if (_pageIndicatorAnimation.status == AnimationStatus.dismissed) {
          _pageIndicatorAnimationController.forward();
          await _cardsAnimationController.forward();
          _setNextPage(2);
          _setCardsSlideInAnimation();
          await _cardsAnimationController.forward();
          _setCardsSlideOutAnimation();
          _setPageIndicatorAnimation(isClockwiseAnimation: false);
        }
        break;
      case 2:
        if (_pageIndicatorAnimation.status == AnimationStatus.dismissed) {
          _pageIndicatorAnimationController.forward();
          await _cardsAnimationController.forward();
          _setNextPage(3);
          _setCardsSlideInAnimation();
          await _cardsAnimationController.forward();
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(kPaddingL),
              child: Column(
                children: <Widget>[
                  // Header(onSkip: _goToLogin),
                  Expanded(child: _getPage()),
                  AnimatedBuilder(
                    animation: _pageIndicatorAnimation,
                    builder: (_, Widget? child) {
                      return OnboardingPageIndicator(
                        angle: _pageIndicatorAnimation.value,
                        currentPage: _currentPage,
                        child: child!,
                      );
                    },
                    child: NextPageButton(onPressed: _nextPage),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
