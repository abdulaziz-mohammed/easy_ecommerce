import '../../generated/l10n.dart';
import '../../app/app_provider.dart';
import 'package:flutter/material.dart';
import '../../page_builders/home_page_builder.dart';

import '../../components/components.dart';

import 'banners_shimmer.dart';
import 'categories_shimmer.dart';
import 'trends_shimmer.dart';

import 'banners_carousel.dart';
import 'categories_scroll.dart';
import 'trends_list.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return HomePageBuilder(builder: (context, state, bloc) {
      return Scaffold(
        appBar: AppBar(
          title: Center(child: Text(I18n.of(context).home)),
          actions: <Widget>[
            CartButton(),
          ],
          leading: InkWell(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Center(
                child: Text(
                  "logout",
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
            onTap: () =>
                context.read<AppProvider>().appRoutes.goToLoginPage(context),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            children: <Widget>[
              FlatButton(
                padding: EdgeInsets.all(0),
                child: Container(
                  width: double.infinity,
                  color: Theme.of(context).inputDecorationTheme.fillColor,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.search,
                          color: Colors.grey[400],
                        ),
                        Container(
                          width: 10,
                        ),
                        Text(
                          "Search",
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                onPressed: () => context
                    .read<AppProvider>()
                    .appRoutes
                    .goToSearchPage(context),
              ),
              Container(
                height: 10,
              ),
              Expanded(
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverList(
                      delegate: SliverChildListDelegate(
                        <Widget>[
                          if (state is HomeStateLoading) BannersShimmer(),
                          if (state is HomeStateSuccess &&
                              state.banners.length > 0)
                            new BannersCarousel(
                              state.banners,
                            ),
                          Container(
                            height: 10,
                          ),
                          if (state is HomeStateLoading) CategoriesShimmer(),
                          if (state is HomeStateSuccess &&
                              state.banners.length > 0)
                            new CategoriesScroll(state.categories),
                          Container(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    if (state is HomeStateLoading) TrendsShimmer(),
                    if (state is HomeStateSuccess && state.banners.length > 0)
                      new TrendsList(state.featured),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
