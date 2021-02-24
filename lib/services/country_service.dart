import '../services/user_service.dart';
import '../models/models.dart';
import 'service_base.dart';

class CountryService extends ServcieBase {
  static final CountryService instance = new CountryService();

  Future<List<Country>> getAll() async {
    return await client.listCountries(await UserService.instance.getToken());
  }
}
