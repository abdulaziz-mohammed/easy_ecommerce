import 'user_service.dart';
import '../models/models.dart';
import 'service_base.dart';

class OrdersService extends ServcieBase {
  static final OrdersService instance = new OrdersService();

  Future<List<Order>> getAll() async {
    return await client.listOrders(await UserService.instance.getToken());
  }

  Future<Order> create(Order order) async {
    return await client.createOrder(
        await UserService.instance.getToken(), order);
  }
}
