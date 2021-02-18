import 'package:flutter/material.dart';
import '../../components/shimmer_polyfill.dart';

class BannersShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShimmerPolyfill(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 200.0,
            color: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
          ),
        ],
      ),
    );
  }
}
