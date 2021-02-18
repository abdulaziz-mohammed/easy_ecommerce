import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../extensions/ThemeData.dart';

class ShimmerPolyfill extends StatelessWidget {
  final Widget child;
  final Color baseColor;
  final Color highlightColor;

  ShimmerPolyfill({this.child, this.baseColor, this.highlightColor});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb)
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 40,
            width: 40,
            child: CircularProgressIndicator(),
          ),
        ],
      );
    return Shimmer.fromColors(
      baseColor: this.baseColor ??
          Theme.of(context).onLight(Colors.grey[300], Color(0xFF808080)),
      highlightColor: this.highlightColor ??
          Theme.of(context).onLight(Colors.grey[100], Colors.grey[400]),
      child: child,
    );
  }
}
