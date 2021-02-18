import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:meta/meta.dart';

class CarouselWithIndicator extends StatefulWidget {
  final List<Widget> children;

  CarouselWithIndicator({@required this.children});

  @override
  _CarouselWithIndicatorState createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        children: <Widget>[
          Container(
            height: 20,
            width: double.infinity,
          ),
          CarouselSlider(
            items: widget.children,
            options: CarouselOptions(
              autoPlay: widget.children.length > 1,
              aspectRatio: 16 / 9,
              viewportFraction: 1.0,
              enableInfiniteScroll: widget.children.length > 1,
              // aspectRatio: 2.0,
              onPageChanged: (index, _) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),
          Container(
            height: 40,
            width: double.infinity,
          ),
        ],
      ),
      if (widget.children.length > 1)
        Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.children.length,
                (index) => Container(
                  width: 11.0,
                  height: 11.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index
                        ? Theme.of(context).primaryColor.withOpacity(0.9)
                        : Theme.of(context).primaryColor.withOpacity(0.4),
                  ),
                ),
              ),
            ))
    ]);
  }
}
