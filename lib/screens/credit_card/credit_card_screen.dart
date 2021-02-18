import 'package:flutter/material.dart';
import '../../models/models.dart';
import '../../services/services.dart';
import 'package:credit_card_number_validator/credit_card_number_validator.dart';
import 'package:flutter/services.dart';

class CreditCardScreen extends StatefulWidget {
  @override
  _CreditCardScreenState createState() => _CreditCardScreenState();
}

class _CreditCardScreenState extends State<CreditCardScreen> {
  final _formKey = GlobalKey<FormState>();

  final fullname = new TextEditingController();
  final number = new TextEditingController();
  final expiration = new TextEditingController();
  final ccv = new TextEditingController();

  String cardType;

  bool initilized = false;

  @override
  Widget build(BuildContext context) {
    if (!initilized) {
      final CreditCard card = ModalRoute.of(context).settings.arguments;
      fullname.text = card.fullName;
      number.text = card.number;
      ccv.text = card.ccv;
      expiration.text = card.expiration;
      initilized = true;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(
          child: Text("Credit Card"),
        ),
        actions: <Widget>[
          Container(
            width: 40,
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: fullname,
                decoration: InputDecoration(
                  labelText: "Holder's Name",
                ),
                validator: (value) {
                  if (value.isEmpty) return "Required";
                  if (value.split(" ").length < 2) return "Needs Full Name";
                  return null;
                },
              ),
              TextFormField(
                controller: number,
                // keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Card's Number",
                ),
                inputFormatters: [
                  MaskedNumberInputFormatter(
                      mask: "xxxx-xxxx-xxxx-xxxx", separator: "-"),
                ],
                validator: (value) {
                  if (value.isEmpty) return "Required";
                  Map<String, dynamic> cardData =
                      CreditCardValidator.getCard(value.split("-").join());
                  bool isValid = cardData[CreditCardValidator.isValidCard];
                  if (!isValid) return "Wrong Formate";
                  if (cardType == null) return "Wrong Formate";
                  return null;
                },
                onChanged: (value) {
                  Map<String, dynamic> cardData =
                      CreditCardValidator.getCard(value.split("-").join());
                  cardType = cardData[CreditCardValidator.cardType].toString();

                  if (cardType != null) {
                    cardType =
                        '${cardType[0].toUpperCase()}${cardType.substring(1)}';

                    if (cardType.toLowerCase() == "mastercard")
                      cardType = "MasterCard";
                  }
                },
              ),
              TextFormField(
                controller: expiration,
                // keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Card's Expiration Date",
                ),
                inputFormatters: [
                  MaskedNumberInputFormatter(mask: "xx/xx", separator: "/"),
                ],
                validator: (value) {
                  if (value.isEmpty) return "Required";
                  if (!RegExp(r"^\d{2}/\d{2}$").hasMatch(value))
                    return "Wrong Formate";
                  return null;
                },
              ),
              TextFormField(
                controller: ccv,
                decoration: InputDecoration(
                  labelText: "Card's Scurity Code",
                ),
                inputFormatters: [
                  MaskedNumberInputFormatter(mask: "xxxx"),
                ],
                validator: (value) {
                  if (value.isEmpty) return "Required";
                  return null;
                },
              ),
              RaisedButton(
                child: Text("Save"),
                onPressed: saveAndClose,
              )
            ],
          ),
        ),
      ),
    );
  }

  void saveAndClose() {
    if (_formKey.currentState.validate())
      Navigator.of(context).pop(new CreditCard(
        fullName: fullname.text,
        number: number.text,
        expiration: expiration.text,
        ccv: ccv.text,
        issuingNetwork: cardType,
      ));
  }
}

class CreditCardExpirationFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    try {
      if (newValue.text.length == 0) return newValue;
      if (newValue.text.length == 2 && oldValue.text.length == 3)
        return newValue.copyWith(
          text: newValue.text.substring(0, 1),
          selection: TextSelection.collapsed(
            offset: 1,
          ),
        );
      if (newValue.text.length > 5) throw Error();

      if (newValue.text.length > 0) int.parse(newValue.text.split("/").join());

      // if (newValue.text.length > 0) int.parse(newValue.text.substring(0, 2));
      // if (newValue.text.length > 3) int.parse(newValue.text.substring(3) ?? 0);

      if (newValue.text.length == 1)
        return newValue.copyWith(text: int.parse(newValue.text).toString());

      if (newValue.text.length == 2)
        return newValue.copyWith(
            text: int.parse(newValue.text).toString() + "/",
            selection: TextSelection.collapsed(
              offset: newValue.selection.end + 1,
            ));

      return newValue.copyWith(
          text: int.parse(newValue.text.split("/")[0]).toString() +
              "/" +
              int.parse(newValue.text.split("/")[1]).toString());
    } catch (Error) {
      return oldValue;
    }

    return newValue;
  }
}

class MaskedNumberInputFormatter extends TextInputFormatter {
  final String mask;
  final String separator;

  MaskedNumberInputFormatter({
    @required this.mask,
    this.separator = " ",
  }) {
    assert(mask != null);
    assert(separator != null);
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    try {
      if (newValue.selection.extentOffset < newValue.text.length)
        return oldValue;

      newValue.text.split(separator).map((a) => int.parse(a));

      if (newValue.text.isNotEmpty)
        for (var group in newValue.text.split(separator)) {
          if (group.isNotEmpty) int.parse(group);
        }

      if (newValue.text.length > 0) {
        if (newValue.text.length > oldValue.text.length) {
          if (newValue.text.length > mask.length) return oldValue;
          if (newValue.text.length < mask.length &&
              mask[newValue.text.length] == separator) {
            return TextEditingValue(
              text:
                  '${oldValue.text}${newValue.text.substring(newValue.text.length - 1)}$separator',
              selection: TextSelection.collapsed(
                offset: newValue.selection.end + 1,
              ),
            );
          }
        } else if (mask[newValue.text.length] == separator) {
          return TextEditingValue(
            text: newValue.text.substring(0, newValue.text.length - 1),
            selection: TextSelection.collapsed(
              offset: newValue.selection.end - 1,
            ),
          );
        }
      }
      return newValue;
    } catch (Error) {
      return oldValue;
    }
  }
}
