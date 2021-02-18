import '../services/user_service.dart';
import '../models/models.dart';
import 'service_base.dart';

class BannerService extends ServcieBase {
  static final BannerService instance = new BannerService();

  List<Banner> banners;

  Future<List<Banner>> getAll() async {
    if (banners != null) return banners;

    return banners = await client.listBanners(UserService.instance.getToken());
  }
}
