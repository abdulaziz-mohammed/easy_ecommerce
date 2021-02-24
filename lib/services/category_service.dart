import '../services/user_service.dart';
import '../models/models.dart';
import 'service_base.dart';

class CategoryService extends ServcieBase {
  static final CategoryService instance = new CategoryService();

  List<Category> categories;

  Future<List<Category>> getAll() async {
    if (categories != null) return categories;

    return categories =
        await client.listCategories(await UserService.instance.getToken());
  }
}
