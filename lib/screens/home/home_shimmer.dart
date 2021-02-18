import 'package:flutter/material.dart';

import '../../components/shimmer_polyfill.dart';

import '../app_routes.dart';

class HomeShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: <Widget>[
      SliverList(
          delegate: SliverChildListDelegate(<Widget>[
        Column(children: <Widget>[
          ShimmerPolyfill(
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
          ),
          Container(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ShimmerPolyfill(
              child: Row(
                  children: List.generate(
                      MediaQuery.of(context).size.width ~/ 100,
                      (index) => Container(
                            margin: EdgeInsets.only(right: index == 3 ? 0 : 8),
                            width: index == 3
                                ? (MediaQuery.of(context).size.width -
                                        (((MediaQuery.of(context).size.width ~/
                                                    100) -
                                                1) *
                                            108)) -
                                    34
                                : 100,
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
          ),
          Container(
            height: 10,
          ),
          // GridView.count(
          //   crossAxisCount: 2,
          //   children: List.generate(
          //       4,
          //       (_) => Container(
          //         color: Colors.black,
          //             width: 20,
          //             height: 20,
          //           )),
          // ),
          ShimmerPolyfill(
            child: Column(
              children: List.generate(
                  (MediaQuery.of(context).size.height - 110 - 210) ~/ 64,
                  (_) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 48.0,
                              height: 48.0,
                              color: Colors.white,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 8.0,
                                    color: Colors.white,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2.0),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 8.0,
                                    color: Colors.white,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2.0),
                                  ),
                                  Container(
                                    width: 40.0,
                                    height: 8.0,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )).toList(),
            ),
          ),
        ])
      ])),
      SliverGrid.count(
        crossAxisCount: 2,
        children: List.generate(
            4,
            (_) => Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(5),
                  color: Colors.grey[300],
                  width: 20,
                  height: 20,
                )),
      )
    ]);
  }
}
