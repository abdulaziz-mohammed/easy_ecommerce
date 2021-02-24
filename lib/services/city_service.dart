import '../services/user_service.dart';
import '../models/models.dart';
import 'service_base.dart';

class CityService extends ServcieBase {
  static final CityService instance = new CityService();

  Future<List<City>> getAll(String countryId) async {
    return await client.listCities(
        await UserService.instance.getToken(), countryId);
  }
}
