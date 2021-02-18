import '../../app/app_provider.dart';
import 'package:flutter/material.dart';
import '../../page_builders/cart_page_builder.dart';
import '../../components/components.dart';

import 'payment_shimmer.dart';
import 'package:provider/provider.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String creditCardId;

  @override
  Widget build(BuildContext context) {
    return CartPageBuilder(builder: (context, state, bloc) {
      return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Center(
              child: Text("Payment"),
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
                  PaymentShimmer(),
                if (state is CartStateSuccess)
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Select Credit Card",
                          style: TextStyle(fontSize: 20),
                        ),
                        CreditCardPicker(
                          onChange: (id) => setState(() => creditCardId = id),
                        )
                      ],
                    ),
                  ),
                if (state is CartStateSuccess)
                  CartSummary(
                    text: "Place Order",
                    onPress: (creditCardId != null)
                        ? () => placeOrderPressed(bloc)
                        : null,
                  ),
              ],
            ),
          ));
    });
  }

  void placeOrderPressed(CartBloc bloc) {
    bloc.add(PlaceOrder(creditCardId: creditCardId));
    context.read<AppProvider>().appRoutes.goToPlaceOrderPage(context);
  }
}
