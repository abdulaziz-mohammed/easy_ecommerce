import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import '../models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'service_base.dart';

class UserService extends ServcieBase {
  static final UserService instance = new UserService();

  Future<bool> isAuthinticated() async {
    return await client.getToken(username, password);

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
