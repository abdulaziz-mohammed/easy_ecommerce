import 'package:flutter/material.dart';
import '../models/models.dart';
import '../services/services.dart';
import 'package:meta/meta.dart';

typedef void SummaryOnPressFunction();

class CartSummary extends StatelessWidget {
  final SummaryOnPressFunction onPress;
  final String text;

  CartSummary({this.onPress, this.text});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Cart>(
      stream: CartService.instance.onCartChange(),
      initialData: CartService.instance.localCart,
      builder: (context, snapshot) {
        var cart = snapshot.data;

        return Container(
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Subtotal",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        cart.getFormatedSubTotal(),
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Container(
                    height: 1,
                    margin: EdgeInsets.symmetric(vertical: 5),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Tax",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        cart.getFormatedTax(),
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Container(
                    height: 1,
                    color: Colors.grey[300],
                    margin: EdgeInsets.symmetric(vertical: 10),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Total",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        cart.getFormatedTotal(),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 1,
                    margin: EdgeInsets.symmetric(vertical: 5),
                  ),
                ],
              ),
              RaisedButton(
                child: Container(
                  height: 50,
                  child: Center(
                    child: Text(text.toUpperCase()),
                  ),
                  width: double.infinity,
                ),
                onPressed: onPress,
              )
            ],
          ),
        );
      },
    );
  }
}
