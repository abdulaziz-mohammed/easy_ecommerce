import '../../app/app_provider.dart';
import 'package:flutter/material.dart';
import '../../page_builders/cart_page_builder.dart';
import 'package:provider/provider.dart';

class PlaceOrderScreen extends StatefulWidget {
  @override
  _PlaceOrderScreenState createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return CartPageBuilder(builder: (context, state, bloc) {
      return Scaffold(
          body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          children: <Widget>[
            if (state is CartStateInitial || state is CartStateLoading)
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Placing Order",
                      style: TextStyle(fontSize: 30),
                    ),
                    Container(
                      height: 20,
                    ),
                    CircularProgressIndicator(
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
            if (state is CartStateSuccess)
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 60,
                    ),
                    Container(
                      height: 20,
                    ),
                    Text(
                      "Order Placed Successfully",
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
              ),
            if (state is CartStateSuccess)
              RaisedButton(
                child: Container(
                  height: 50,
                  child: Center(
                    child: Text("Back To Home".toUpperCase()),
                  ),
                  width: double.infinity,
                ),
                onPressed: () =>
                    context.read<AppProvider>().appRoutes.goToHomePage(context),
              )
          ],
        ),
      ));
    });
  }
}
