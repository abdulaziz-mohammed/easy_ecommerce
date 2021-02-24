import '../services/user_service.dart';
import '../models/models.dart';
import 'service_base.dart';

class CreditCardService extends ServcieBase {
  static final CreditCardService instance = new CreditCardService();

  Future<List<CreditCard>> getAll() async {
    return await client.listCreditCards(await UserService.instance.getToken());
  }

  Future<CreditCard> create(CreditCard creditCard) async {
    return await client.createCreditCard(
        await UserService.instance.getToken(), creditCard);
  }
}
