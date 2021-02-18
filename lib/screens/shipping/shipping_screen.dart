import '../../app/app_provider.dart';
import 'package:flutter/material.dart';
import '../../page_builders/cart_page_builder.dart';
import '../../components/components.dart';
import 'shipping_shimmer.dart';
import 'package:provider/provider.dart';

class ShippingScreen extends StatefulWidget {
  @override
  _ShippingScreenState createState() => _ShippingScreenState();
}

class _ShippingScreenState extends State<ShippingScreen> {
  String addressId;

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return CartPageBuilder(builder: (context, state, bloc) {
      return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: Center(
              child: Text("Shipping"),
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
                if (state is CartStateInitial ||
                    state is CartStateLoading ||
                    loading)
                  PaymentShimmer(),
                if (state is CartStateSuccess && !loading)
                  if (state is CartStateSuccess)
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Select Shipping Address",
                              style: TextStyle(fontSize: 20),
                            ),
                            AddressPicker(
                              onChange: (id) => setState(() => addressId = id),
                            )
                          ],
                        ),
                      ),
                    ),
                if (state is CartStateSuccess && !loading)
                  CartSummary(
                    text: "Payment",
                    onPress: (addressId != null)
                        ? () => addPaymentPressed(bloc)
                        : null,
                  ),
              ],
            ),
          ));
    });
  }

  void addPaymentPressed(CartBloc bloc) async {
    await context.read<AppProvider>().appRoutes.goToPaymentPage(context);
    bloc.add(AddAddress(addressId: addressId));
  }
}
