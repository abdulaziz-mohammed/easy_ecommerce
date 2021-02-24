import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import '../models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'service_base.dart';

class UserServiceOld2 extends ServcieBase {
  static final UserServiceOld2 instance = new UserServiceOld2();
  // final onAuthnticated = BehaviorSubject<bool>.seeded(false);

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  _setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<bool> isAuthinticated() async {
    var token = await getToken();
    if (token != null && token.length > 0) return true;
    return false;
  }

  Future<Customer> authenticate({
    @required String username,
    @required String password,
  }) async {
    var token = await client.getToken(username, password);
    await _setToken(token);

    var customer = await client.getCustomer(token);

    // onAuthnticated.add(true);

    return customer;
  }

  logout() async {
    await _setToken(null);
    // onAuthnticated.add(false);
  }
}
