import 'package:flutter/material.dart';

import '../../components/shimmer_polyfill.dart';

import '../app_routes.dart';

class ProductShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShimmerPolyfill(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            height: 270,
            width: double.infinity,
            color: Colors.black,
          ),
          Container(
            height: 35,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0) + EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 250,
                        height: 40.0,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                      ),
                      Container(
                        width: 150,
                        height: 30.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
