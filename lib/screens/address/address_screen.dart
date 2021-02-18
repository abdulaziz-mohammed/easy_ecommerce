import 'package:flutter/material.dart';
import '../../models/models.dart';
import '../../services/services.dart';

class AddressScreen extends StatefulWidget {
  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final _formKey = GlobalKey<FormState>();

  final fullname = new TextEditingController();
  final line1 = new TextEditingController();
  final line2 = new TextEditingController();
  final zip = new TextEditingController();
  final phone = new TextEditingController();

  bool initilized = false;

  bool loadingCountries = true;
  bool loadingCities = true;
  List<Country> countries;
  List<City> cities;
  Country country;
  City city;

  @override
  void initState() {
    loadCountries();
    super.initState();
  }

  loadCountries() async {
    setState(() {
      loadingCountries = true;
      country = null;
    });
    countries = await CountryService.instance.getAll();
    setState(() {
      country = countries[0];
      loadingCountries = false;
    });
    if (country != null) await loadCities();
  }

  loadCities() async {
    setState(() {
      loadingCities = true;
      city = null;
    });
    cities = await CityService.instance.getAll(country.id);
    setState(() {
      loadingCities = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!initilized) {
      final Address address = ModalRoute.of(context).settings.arguments;
      fullname.text = address.fullName;
      line1.text = address.line1;
      line2.text = address.line2;
      zip.text = address.zip;
      phone.text = address.phone;
      initilized = true;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(
          child: Text("Shipping Address"),
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
                  labelText: "Full Name",
                ),
                validator: (value) {
                  if (value.isEmpty) return "Required";
                  if (value.split(" ").length < 2) return "Needs Full Name";
                  return null;
                },
              ),
              TextFormField(
                controller: line1,
                decoration: InputDecoration(
                  labelText: "Line 1",
                ),
                validator: (value) {
                  if (value.isEmpty) return "Required";
                  return null;
                },
              ),
              TextFormField(
                controller: line2,
                decoration: InputDecoration(
                  labelText: "Line 2",
                ),
              ),
              FormField(
                builder: (FormFieldState<Country> state) => Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    if (loadingCountries)
                      Padding(
                        padding: EdgeInsets.all(21),
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.transparent,
                          valueColor: new AlwaysStoppedAnimation<Color>(
                              Theme.of(context).primaryColor),
                        ),
                      ),
                    if (!loadingCountries)
                      DropdownButton<Country>(
                        isExpanded: true,
                        hint: Text("Select Country"),
                        underline: Container(),
                        value: country,
                        items: countries.map((Country country) {
                          return new DropdownMenuItem<Country>(
                            value: country,
                            child: Text(country.name),
                          );
                        }).toList(),
                        onChanged: (country) {
                          setState(() {
                            this.country = country;
                          });
                          loadCities();
                          state.didChange(country);
                        },
                      ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                        width: 0.5,
                        color: state.hasError ? Color(0xFFD33030) : Colors.grey,
                      )),
                    ),
                    if (state.hasError)
                      Text(
                        state.errorText,
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFFD33030),
                        ),
                      ),
                  ],
                ),
                initialValue: country,
                validator: (value) {
                  if (value == null) return "Required";
                  return null;
                },
              ),
              if (!loadingCountries)
                FormField(
                  builder: (FormFieldState<City> state) => Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      if (loadingCities)
                        Padding(
                          padding: EdgeInsets.all(21),
                          child: LinearProgressIndicator(
                            backgroundColor: Colors.transparent,
                            valueColor: new AlwaysStoppedAnimation<Color>(
                                Theme.of(context).primaryColor),
                          ),
                        ),
                      if (!loadingCities)
                        DropdownButton<City>(
                          isExpanded: true,
                          hint: Text("Select City"),
                          underline: Container(),
                          value: city,
                          items: cities.map((City city) {
                            return new DropdownMenuItem<City>(
                              value: city,
                              child: Text(city.name),
                            );
                          }).toList(),
                          onChanged: (city) {
                            setState(() {
                              this.city = city;
                            });
                            state.didChange(city);
                          },
                        ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                          width: 0.5,
                          color:
                              state.hasError ? Color(0xFFD33030) : Colors.grey,
                        )),
                      ),
                      if (state.hasError)
                        Text(
                          state.errorText,
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFFD33030),
                          ),
                        ),
                    ],
                  ),
                  initialValue: city,
                  validator: (value) {
                    if (value == null) return "Required";
                    return null;
                  },
                ),
              TextFormField(
                controller: zip,
                decoration: InputDecoration(
                  labelText: "Zip",
                ),
                validator: (value) {
                  if (value.isEmpty) return "Required";
                  if (!RegExp(r'^\d{5}(?:[-\s]\d{4})?$').hasMatch(value))
                    return "Wrong Formate";
                  return null;
                },
              ),
              TextFormField(
                controller: phone,
                decoration: InputDecoration(
                  labelText: "Phone",
                ),
                validator: (value) {
                  if (value.isEmpty) return "Required";
                  if (!RegExp(r'^\+?[0-9]{3}-?[0-9]{6,12}$').hasMatch(value))
                    return "Wrong Formate";
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
    if (_formKey.currentState.validate() && country != null && city != null)
      Navigator.of(context).pop(new Address(
        fullName: fullname.text,
        line1: line1.text,
        line2: line2.text,
        zip: zip.text,
        phone: phone.text,
      ));
  }
}
