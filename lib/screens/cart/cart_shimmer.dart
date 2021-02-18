import 'package:flutter/material.dart';

import '../../components/shimmer_polyfill.dart';

class CartShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ShimmerPolyfill(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                children: List.generate(
                    (MediaQuery.of(context).size.height - 158 - 150) ~/ 70,
                    (_) => Padding(
                          padding: const EdgeInsets.only(bottom: 20.0, top: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 10.0,
                                height: 15.0,
                                color: Colors.white,
                              ),
                              Text(
                                " x ",
                                style: TextStyle(fontSize: 10),
                              ),
                              Container(
                                width: 10.0,
                              ),
                              Container(
                                width: 40.0,
                                height: 40.0,
                                color: Colors.white,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                              ),
                              Expanded(
                                child: Container(
                                  width: 40.0,
                                  height: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                              ),
                              Container(
                                width: 110.0,
                                height: 30.0,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        )).toList(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 100.0,
                  height: 20.0,
                  color: Colors.white,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                ),
                Container(
                  width: 150.0,
                  height: 20.0,
                  color: Colors.white,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 70.0,
                  height: 20.0,
                  color: Colors.white,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                ),
                Container(
                  width: 140.0,
                  height: 20.0,
                  color: Colors.white,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 80.0,
                  height: 20.0,
                  color: Colors.white,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                ),
                Container(
                  width: 170.0,
                  height: 20.0,
                  color: Colors.white,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
            ),
            Container(
              width: double.infinity,
              height: 50.0,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
