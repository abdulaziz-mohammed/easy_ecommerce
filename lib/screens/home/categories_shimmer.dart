import 'package:flutter/material.dart';
import '../../components/shimmer_polyfill.dart';

class CategoriesShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ShimmerPolyfill(
        child: Row(
            children: List.generate(
                MediaQuery.of(context).size.width ~/ 100,
                (index) => Container(
                      margin: EdgeInsets.only(right: index == 3 ? 0 : 8),
                      width:
                          // index == 3
                          //     ? (MediaQuery.of(context).size.width -
                          //             (((MediaQuery.of(context).size.width ~/ 100) -
                          //                     1) *
                          //                 108)) -
                          //         34
                          //     :
                          100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(10),
                          right: Radius.circular(index == 3 ? 0 : 10),
                        ),
                        color: Colors.white,
                      ),
                    ))),
      ),
    );
  }
}
