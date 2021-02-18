import '../services/user_service.dart';
import '../models/models.dart';
import 'service_base.dart';

class AddressService extends ServcieBase {
  static final AddressService instance = new AddressService();

  Future<List<Address>> getAll() async {
    return await client.listAddresses(UserService.instance.getToken());
  }

  Future<Address> create(Address address) async {
    return await client.createAddress(UserService.instance.getToken(), address);
  }
}