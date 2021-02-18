import '../../generated/l10n.dart';
import '../../app/app_provider.dart';
import 'package:flutter/material.dart';
import '../../page_builders/search_page_builder.dart';
import '../app_routes.dart';
import '../../components/components.dart';
import 'search_shimmer.dart';
import '../../models/models.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  final SearchQuery query;
  final String fixedTitle;

  SearchScreen({
    this.query,
    this.fixedTitle,
  });

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  FocusNode textFocus;

  TextEditingController keyword;

  @override
  void initState() {
    textFocus = new FocusNode();
    if (widget.query == null) {
      keyword = new TextEditingController();
      WidgetsBinding.instance.addPostFrameCallback(
          (_) => FocusScope.of(context).requestFocus(textFocus));
    } else {
      keyword = new TextEditingController(text: widget.query.keyword);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SearchPageBuilder(
      initialQuery: widget.query,
      builder: (context, state, bloc) {
        return Scaffold(
            appBar: AppBar(
              title: Center(
                child: state is ProductSearchStateLoading ||
                        widget.fixedTitle != null
                    ? Text(widget.fixedTitle != null
                        ? widget.fixedTitle ?? ""
                        : keyword.text)
                    : TextField(
                        focusNode: textFocus,
                        // cursorColor: Colors.white,
                        style: TextStyle(
                          // color: Colors.white,
                          fontSize: 20,
                        ),
                        textInputAction: TextInputAction.search,
                        controller: keyword,
                        decoration: InputDecoration(
                          hintText: I18n.of(context).search,
                          hintStyle: TextStyle(
                            color: Colors.white70,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        onSubmitted: (_) {
                          var query = new SearchQuery(keyword: keyword.text);
                          if (widget.query == null)
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => SearchScreen(
                                    query: query,
                                  ),
                                ),
                                (route) =>
                                    route.settings.name == AppRoutes.HOME);
                          else
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SearchScreen(
                                query: query,
                              ),
                            ));
                          keyword.text = widget.query?.keyword ?? "";
                        },
                        enabled: !(state is ProductSearchStateLoading),
                      ),
              ),
              actions: <Widget>[
                CartButton(),
              ],
            ),
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildListDelegate(
                      <Widget>[
                        if (state is ProductSearchStateInitial)
                          Center(
                            child: Text("Type search term then hit search. "),
                          ),
                        if (state is ProductSearchStateSuccess)
                          Center(
                            child: state.items.length == 0
                                ? Text(widget.fixedTitle != null
                                    ? "No items found."
                                    : "No Results Found For \"${keyword.text}\"")
                                : Column(
                                    children: _buildResults(state.items),
                                  ),
                          ),
                        if (state is ProductSearchStateLoading) SearchShimmer()
                      ],
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }

  List<Widget> _buildResults(List<Product> items) {
    return items
        .map(
          (product) => Column(
            children: <Widget>[
              InkWell(
                onTap: () {
                  context
                      .read<AppProvider>()
                      .appRoutes
                      .goToProductPage(context, product.id);
                },
                child: Container(
                  child: Row(
                    children: <Widget>[
                      ProductThumbnail(product),
                      Container(width: 10),
                      Expanded(
                        child: Text(
                          product.title,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(product.getFormatedPrice()),
                      ),
                    ],
                  ),
                  height: 70,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1, color: Colors.grey[200]),
                  ),
                ),
              )
            ],
          ),
        )
        .toList();
  }

  @override
  void dispose() {
    textFocus.dispose();

    super.dispose();
  }
}
