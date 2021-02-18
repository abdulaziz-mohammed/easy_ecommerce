import '../../app/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../models/models.dart';
import 'package:provider/provider.dart';

class TrendsList extends StatelessWidget {
  final List<Product> featured;
  const TrendsList(
    this.featured, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverStaggeredGrid.countBuilder(
      crossAxisCount: 2,
      itemBuilder: (context, index) {
        if (index == 0)
          return Container(
            padding: EdgeInsets.only(left: 10, right: 30) +
                EdgeInsets.symmetric(vertical: 20),
            child: FittedBox(
              child: Text(
                "Popular".toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          );
        else
          return Container(
            margin: EdgeInsets.only(right: 8, bottom: 8),
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Colors.grey[200],
                    ),
                    child: InkWell(
                      child: Center(
                        child: featured[index - 1].photos == null ||
                                featured[index - 1].photos.length == 0
                            ? null
                            : Image.network(
                                featured[index - 1].photos[0],
                                width: 100,
                                height: 100,
                                // color: Colors.transparent,
                                // colorBlendMode: BlendMode.screen,
                              ),
                      ),
                      onTap: () {
                        context
                            .read<AppProvider>()
                            .appRoutes
                            .goToProductPage(context, featured[index - 1].id);
                      },
                    ),
                  ),
                ),
                Text(
                  featured[index - 1].getFormatedPrice(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Container(
                  height: 3,
                ),
                Text(
                  featured[index - 1].title,
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          );
      },
      itemCount: this.featured.length + 1,
      staggeredTileBuilder: (index) {
        if (index == 0)
          return StaggeredTile.fit(1);
        else
          return StaggeredTile.count(1, 1);
      },
    );
  }
}
