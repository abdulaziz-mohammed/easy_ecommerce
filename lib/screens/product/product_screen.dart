import '../product/product_shimmer.dart';
import 'package:flutter/material.dart';

import '../../page_builders/product_page_builder.dart';

import '../../components/components.dart';
import '../../component_builders/builders.dart';

class ProductScreen extends StatefulWidget {
  // final String productId;

  // ProductScreen(this.productId);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    final String productId = ModalRoute.of(context).settings.arguments;

    return ProductPageBuilder(
      productId: productId,
      builder: (context, state, bloc) {
        // if (state is ProductStateLoading) return LoadingScreen();

        return Scaffold(
          appBar: AppBar(
            title: Center(
                child: Text(
                    (state is ProductStateSuccess) ? state.item.title : "")),
            actions: <Widget>[CartButton()],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      if (state is ProductStateLoading) ProductShimmer(),
                      if (state is ProductStateSuccess)
                        if (state.item.photos != null &&
                            state.item.photos.length > 0)
                          CarouselWithIndicator(
                            children: state.item.photos
                                .map((b) => ClipRRect(
                                    borderRadius:
                                        new BorderRadius.circular(8.0),
                                    child: Image.network(
                                      b,
                                      fit: BoxFit.fitHeight,
                                    )))
                                .toList(),
                          ),
                      if (state is ProductStateSuccess)
                        Padding(
                          padding: EdgeInsets.all(40),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text(
                                state.item.title,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 40),
                              ),
                              Text(
                                state.item.getFormatedPrice(),
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 30,
                                ),
                              ),
                              Container(
                                height: 20,
                              ),
                              Text(
                                state.item.description ?? "",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40) +
                    EdgeInsets.only(bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    AddToCartBuilder(
                      productId: productId,
                      builder: (context, state, quantity, bloc) {
                        if (state is CartItemStateInitial ||
                            state is CartItemStateLoading)
                          return Container(
                            height: 55,
                            width: double.infinity,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                            decoration: BoxDecoration(
                              color: Colors
                                  .transparent, //Theme.of(context).backgroundColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3)),
                            ),
                          );
                        return RaisedButton(
                          onPressed: () => {bloc.add(QuickAdd(quantity: 1))},
                          color: Theme.of(context).primaryColor,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.add_shopping_cart,
                                  color: Colors.white,
                                ),
                                Container(
                                  width: 20,
                                ),
                                Text(
                                  "Add to Cart" +
                                      (quantity > 0 ? " ($quantity)" : ""),
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
