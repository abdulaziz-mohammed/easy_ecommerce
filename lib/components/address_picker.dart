import '../app/app_provider.dart';

import '../bloc/bloc.dart';
import '../models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

typedef void AddressOnChangeFunction(String id);

class AddressPicker extends StatefulWidget {
  final String initial;
  final AddressOnChangeFunction onChange;

  AddressPicker({this.initial, @required this.onChange});

  @override
  _AddressPickerState createState() => _AddressPickerState();
}

class _AddressPickerState extends State<AddressPicker> {
  final AddressesBloc _bloc = new AddressesBloc();
  int _current = 0;

  @override
  void initState() {
    _bloc.add(FetchAddresses());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressesBloc, AddressesState>(
      bloc: _bloc,
      builder: (context, state) {
        if (state is AddressesStateSuccess && state.items.length > 0)
          WidgetsBinding.instance.addPostFrameCallback(
              (_) => widget.onChange(state.items[_current].id));

        if (state is AddressesStateSuccess)
          return Column(
            children: <Widget>[
              for (var i = 0; i < state.items.length; i++)
                _buildAddress(state.items[i], _current == i, i),
              Container(
                height: 20,
              ),
              FittedBox(
                child: InkWell(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.add,
                          color: Colors.black87,
                        ),
                        Text(
                          "Add New Address",
                          style: TextStyle(color: Colors.black87),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      border: Border.all(
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                  onTap: () async {
                    var address = await context
                        .read<AppProvider>()
                        .appRoutes
                        .goToAddressPage(context, new Address());
                    if (address != null) {
                      _bloc.add(CreateAddress(address: address));
                    }
                  },
                ),
              )
            ],
          );
        else
          return Container(
            padding: EdgeInsets.all(30),
            child: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.transparent,
                valueColor: new AlwaysStoppedAnimation<Color>(
                    Theme.of(context).primaryColor),
              ),
            ),
          );
      },
    );
  }

  Widget _buildAddress(Address address, bool selected, int index) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(3),
              child: Icon(
                selected ? Icons.check : null,
                size: 20,
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                color: selected ? Theme.of(context).primaryColor : null,
                border: selected ? null : Border.all(color: Colors.grey[300]),
                borderRadius: BorderRadius.circular(36),
              ),
            ),
            Container(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(address.fullName ?? ""),
                Text(address.phone ?? ""),
                Text(address.line1 ?? ""),
                Text(address.line2 ?? ""),
                Text((address.city ?? "") + ", " + (address.country ?? "")),
                Text(address.zip ?? ""),
              ],
            ),
          ],
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey[200],
            ),
          ),
          // borderRadius: BorderRadius.all(
          //   Radius.circular(10),
          // ),
        ),
      ),
      onTap: () => setState(() {
        _current = index;
      }),
    );
  }
}
