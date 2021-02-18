import 'package:flutter/material.dart';
import '../../models/models.dart';
import '../screens.dart';

class CategoriesScroll extends StatelessWidget {
  final List<Category> categories;
  const CategoriesScroll(
    this.categories, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colors = <Color>[
      Color(0xFFf0f0f0),
      Color(0xFFF9EFF3),
      Color(0xFFd3e6f0),
      Color(0xFFE7DDD6)
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: List.generate(
        categories.length % 10,
        (index) => Container(
            margin: EdgeInsets.only(right: 8),
            padding: EdgeInsets.all(10),
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: colors[index % colors.length],
            ),
            child: InkWell(
              child: Center(
                child: FittedBox(
                  child: Text(
                    categories[index].title.substring(
                        0,
                        categories[index].title.length > 20
                            ? 20
                            : categories[index].title.length),
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SearchScreen(
                    query: SearchQuery(
                      categoryId: categories[index].id,
                    ),
                    fixedTitle: categories[index].title ?? "",
                  ),
                ),
              ),
            )),
      )),
    );
  }
}
