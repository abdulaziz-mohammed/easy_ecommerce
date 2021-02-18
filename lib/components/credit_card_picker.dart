import '../app/app_provider.dart';

import '../bloc/bloc.dart';
import '../models/models.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:intl/intl.dart';
import 'package:dotted_border/dotted_border.dart';

typedef void CreditCardOnChangeFunction(String id);

class CreditCardPicker extends StatefulWidget {
  final String initial;
  final CreditCardOnChangeFunction onChange;

  CreditCardPicker({this.initial, @required this.onChange});

  @override
  _CreditCardPickerState createState() => _CreditCardPickerState();
}

class _CreditCardPickerState extends State<CreditCardPicker> {
  final CreditCardsBloc _bloc = new CreditCardsBloc();
  int _current = 0;

  @override
  void initState() {
    _bloc.add(FetchCreditCards());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreditCardsBloc, CreditCardsState>(
      bloc: _bloc,
      builder: (context, state) {
        if (state is CreditCardsStateSuccess && state.items.length > 0)
          WidgetsBinding.instance.addPostFrameCallback((_) => widget.onChange(
              _current == state.items.length
                  ? null
                  : state.items[_current].id));

        if (state is CreditCardsStateSuccess)
          return Stack(children: [
            Column(
              children: <Widget>[
                Container(
                  height: 20,
                  width: double.infinity,
                ),
                CarouselSlider(
                  items: <Widget>[
                    ...state.items.map((card) => _buildCard(card)).toList(),
                    Container(
                      margin: EdgeInsets.all(5),
                      color: Colors.grey[100],
                      child: InkWell(
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          dashPattern: [5],
                          color: Color(0xFF474B5C).withOpacity(0.5),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.add,
                                  size: 30,
                                  color: Color(0xFF474B5C),
                                ),
                                Container(
                                  width: 5,
                                ),
                                Text(
                                  "Add a New Card",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Color(0xFF474B5C),
                                  ),
                                )
                              ],
                            ),
                          ),
                          radius: Radius.circular(10),
                        ),
                        onTap: () async {
                          var creditCard = await context
                              .read<AppProvider>()
                              .appRoutes
                              .goToCreditCardPage(context, new CreditCard());
                          if (creditCard != null)
                            _bloc.add(CreateCreditCard(creditCard: creditCard));
                        },
                      ),
                    ),
                  ],
                  options: CarouselOptions(
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.9,
                    enableInfiniteScroll: false,
                    // aspectRatio: 2.0,
                    onPageChanged: (index, _) {
                      setState(() {
                        _current = index;
                        if (index > state.items.length - 1)
                          widget.onChange(null);
                        else
                          widget.onChange(state.items[_current].id);
                      });
                    },
                    enlargeCenterPage: true,
                  ),
                ),
                Container(
                  height: 40,
                  width: double.infinity,
                ),
              ],
            ),
            if (state.items.length > 1)
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    state.items.length,
                    (index) => Container(
                      width: 11.0,
                      height: 11.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == index
                            ? Theme.of(context).primaryColor.withOpacity(0.9)
                            : Theme.of(context).primaryColor.withOpacity(0.4),
                      ),
                    ),
                  ),
                ),
              )
          ]);
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

  Widget _buildCard(CreditCard card) {
    RegExp exp = new RegExp(r"\d{4}");
    Iterable<Match> matches = exp.allMatches(card.number);
    var number = matches.map((m) => m.group(0)).join(" - ");
    if (card.number.length == 15)
      number += " - " + card.number.split("").skip(12).join();

    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            number,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Card Holder",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    height: 5,
                  ),
                  Text(
                    card.fullName,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Expiry",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    height: 5,
                  ),
                  Text(
                    card.expiration,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                card.issuingNetwork,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: InkWell(
                  child: Icon(
                    Icons.edit,
                    color: Color(0xFF474B5C),
                  ),
                  onTap: () => {},
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
              )
            ],
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Color(0xFF474B5C),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    );
  }
}
