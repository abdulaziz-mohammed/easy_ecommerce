import '../external/store_client_interface.dart';

class ServcieBase {
  static StoreClientInterface _client;

  static setClient(StoreClientInterface client) {
    _client = client;
  }

  StoreClientInterface get client {
    if (_client == null) throw NullThrownError();
    return _client;
  }
}
