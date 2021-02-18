import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ResponsiveBody extends StatelessWidget {
  final Widget child;

  ResponsiveBody({this.child});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb)
      return LayoutBuilder(builder: (context, constraints) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PhysicalModel(
              color: Colors.grey,
              elevation: 8,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey[300],
                  ),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                width: constraints.maxWidth > 600 ? 600 : constraints.maxWidth,
                // constraints: BoxConstraints(
                //     // maxWidth: 600,
                //     ),
                child: child,
              ),
            ),
          ],
        );
      });
    return child;
  }
}
