import '../app/app_provider.dart';
import 'package:flutter/material.dart';
import '../services/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc.dart';
import '../models/models.dart';

class CartButton extends StatelessWidget {
  final Function onTap;

  CartButton({this.onTap});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Cart>(
        stream: CartService.instance.onCartChange(),
        initialData: CartService.instance.localCart,
        builder: (context, snapshot) {
          var count = snapshot.data.items
              .fold(0, (total, item) => item.quantity + total);
          return IconButton(
            icon: Stack(
              children: <Widget>[
                Icon(Icons.shopping_cart),
                if (count > 0)
                  Positioned(
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 12,
                        minHeight: 12,
                      ),
                      child: Text(
                        count.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
              ],
            ),
            onPressed: () => onTap == null
                ? context.read<AppProvider>().appRoutes.goToCartPage(context)
                : onTap(),
          );
        });
  }
}
