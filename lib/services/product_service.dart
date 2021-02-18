import '../services/user_service.dart';
import 'package:meta/meta.dart';
import '../models/models.dart';
import 'service_base.dart';

class ProductService extends ServcieBase {
  static final ProductService instance = new ProductService();

  Future<Product> getProductById({@required String id}) async {
    return await client.getProduct(UserService.instance.getToken(), id);
  }

  Future<List<Product>> getProductsByCategory(
      {@required String categoryId, @required String page}) async {
    return await client.listProducts(UserService.instance.getToken(),
        new SearchQuery(categoryId: categoryId, page: page));
  }

  Future<List<Product>> getProductsByQuery(
      {@required SearchQuery query}) async {
    return await client.listProducts(UserService.instance.getToken(), query);
  }

  Future<List<Product>> getFeatured() async {
    return await client.listProducts(
        UserService.instance.getToken(), new SearchQuery(featured: true));
  }

  Future<List<Product>> getOnsale() async {
    return await client.listProducts(
        UserService.instance.getToken(), new SearchQuery(onSale: true));
  }
}
