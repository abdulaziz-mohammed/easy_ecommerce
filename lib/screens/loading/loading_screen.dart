import '../../generated/l10n.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Timer timer;
  String dots;

  @override
  void initState() {
    dots = ".";
    timer = Timer.periodic(
        Duration(milliseconds: 500),
        (_) => setState(() =>
            dots = List.generate(dots.length % 3 + 1, (_) => ".").join()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            InfiniteRotation(),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Text(
                "${I18n.of(context).loading}$dots ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF62b1ba)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}

class InfiniteRotation extends StatefulWidget {
  @override
  _InfiniteRotationState createState() => _InfiniteRotationState();
}

class _InfiniteRotationState extends State<InfiniteRotation>
    with TickerProviderStateMixin {
  AnimationController controller;

  Animation<double> animation;

  @override
  void initState() {
    controller = new AnimationController(
        vsync: this,
        upperBound: 1,
        value: 0.5,
        duration: Duration(milliseconds: 1000));
    animation = Tween<double>(begin: -pi / 6, end: pi / 6)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
    controller.addStatusListener(reachdEdge);
    //controller.repeat();
    controller.forward();

    super.initState();
  }

  reachdEdge(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      controller.reverse();
    } else if (status == AnimationStatus.dismissed) {
      controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: animation.value,
          child: Image.asset(
            "assets/images/shopping-basket.png",
            height: 90,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
