import '../../app/app_provider.dart';
import 'package:flutter/material.dart';
import '../../page_builders/cart_page_builder.dart';

import '../app_routes.dart';
import '../../components/components.dart';
import '../../models/models.dart';

import 'cart_shimmer.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return CartPageBuilder(builder: (context, state, bloc) {
      return Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text("Cart"),
            ),
            actions: <Widget>[
              Container(
                width: 40,
              )
            ],
          ),
          body: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Column(
              children: <Widget>[
                if (state is CartStateInitial || state is CartStateLoading)
                  CartShimmer(),
                if (state is CartStateSuccess)
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[..._buildItems(state.cart, bloc)],
                      ),
                    ),
                  ),
                if (state is CartStateSuccess && state.cart.items.length > 0)
                  CartSummary(
                    text: "Checkout",
                    onPress: state.cart.items.length == 0
                        ? null
                        : () => goToShipping(bloc),
                  ),
              ],
            ),
          ));
    });
  }

  List<Widget> _buildItems(Cart cart, CartBloc bloc) {
    return cart.items
        .map((item) => Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    item.quantity.toString(),
                    style: TextStyle(fontSize: 10),
                  ),
                  Text(" x ", style: TextStyle(fontSize: 10)),
                  Container(
                    width: 10,
                  ),
                  InkWell(
                    child: ProductThumbnail(item.product),
                    onTap: () => context
                        .read<AppProvider>()
                        .appRoutes
                        .goToProductPage(context, item.product.id),
                  ),
                  Container(
                    width: 5,
                  ),
                  Expanded(
                    child: InkWell(
                      child: Text(
                        item.product.title,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onTap: () => context
                          .read<AppProvider>()
                          .appRoutes
                          .goToProductPage(context, item.product.id),
                    ),
                  ),
                  Container(
                    width: 20,
                  ),
                  Text((item.product.getFormatedPrice()).toString()),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Material(
                            clipBehavior: Clip.hardEdge,
                            borderRadius: BorderRadius.circular(40.0),
                            color: Theme.of(context).primaryColor,
                            child: InkWell(
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Center(
                                  child: Text(
                                    "-",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.white, height: 0.8),
                                  ),
                                ),
                                height: 30,
                                width: 30,
                              ),
                              onTap: () => decreaseQuantity(item, bloc),
                            ),
                          ),
                        ),
                        Container(
                          width: 20,
                          child: Center(
                            child: Text(
                              item.quantity.toString(),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Material(
                            clipBehavior: Clip.hardEdge,
                            borderRadius: BorderRadius.circular(40.0),
                            color: Theme.of(context).primaryColor,
                            child: InkWell(
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Center(
                                  child: Text(
                                    "+",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.white, height: 0.8),
                                  ),
                                ),
                                height: 30,
                                width: 30,
                              ),
                              onTap: () => increaseQuantity(item, bloc),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              height: 70,
              width: double.infinity,
            ))
        .toList();
  }

  increaseQuantity(CartItem item, CartBloc bloc) {
    bloc.add(
        UpdateToCart(productId: item.product.id, quantity: item.quantity + 1));
  }

  decreaseQuantity(CartItem item, CartBloc bloc) {
    bloc.add(
        UpdateToCart(productId: item.product.id, quantity: item.quantity - 1));
  }

  void goToShipping(CartBloc bloc) async {
    await context.read<AppProvider>().appRoutes.goToShippingPage(context);
  }
}
