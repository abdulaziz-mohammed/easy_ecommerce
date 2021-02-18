import 'package:meta/meta.dart';
import '../models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'service_base.dart';

class UserService extends ServcieBase {
  String _token;

  static final UserService instance = new UserService();

  _loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token');
  }

  _saveToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', _token);
  }

  _setToken(String token) async {
    this._token = token;
    _saveToken();
  }

  Future<bool> isAuthinticated() async {
    await _loadToken();
    if (_token != null && _token.length > 0) return true;
    return false;
  }

  String getToken() => _token;

  Future<Customer> authenticate({
    @required String username,
    @required String password,
  }) async {
    var token = await client.getToken(username, password);
    await _setToken(token);

    var customer = await client.getCustomer(token);

    return customer;
  }

  deleteToken() async {
    this._token = null;
    await _saveToken();
  }
}
