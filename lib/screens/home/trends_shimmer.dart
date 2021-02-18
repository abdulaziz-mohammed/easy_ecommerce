import 'package:flutter/material.dart';
import '../../components/shimmer_polyfill.dart';

class TrendsShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return SliverGrid.count(
    //   crossAxisCount: 2,
    //   crossAxisSpacing: 10,
    //   children: List.generate(
    //     4,
    //     (_) => Container(
    //       padding: EdgeInsets.all(0),
    //       margin: EdgeInsets.symmetric(
    //         horizontal: 0,
    //         vertical: 5,
    //       ),
    //       color: Colors.grey[300],
    //       width: 20,
    //       height: 20,
    //     ),
    //   ),
    // );

    var length = MediaQuery.of(context).size.width / 2 - 21;
    return SliverList(
        delegate: SliverChildListDelegate(<Widget>[
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ShimmerPolyfill(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      color: Colors.grey[300],
                      width: length,
                      height: length - (length / 3),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      color: Colors.grey[300],
                      width: length,
                      height: length,
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      color: Colors.grey[300],
                      width: length,
                      height: length,
                    ),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    color: Colors.grey[300],
                    width: length,
                    height: length,
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    color: Colors.grey[300],
                    width: length,
                    height: length,
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    ]));
  }
}
