import 'package:dio/dio.dart';
import '../models/models.dart';
import 'store_client_interface.dart';
import 'http_client.dart';
import 'dart:convert';

const String BASE_URL = "https://moaibr.dreamhosters.com/wp-json";
const String WOOCOMMERCE_URL = "https://moaibr.dreamhosters.com/wp-json/wc/v3";

class WooCommerceClient implements StoreClientInterface {
  static HttpClient client;

  static String currency = "SAR";

  static String customerId;

  static List<Category> categories = <Category>[];

  WooCommerceClient(String baseUrl) {
    client = new HttpClient(baseUrl: baseUrl);
  }

  Map<String, String> buildHeaders({String token}) {
    Map<String, String> headers = {};

    if (token != null && token.isNotEmpty)
      headers["authorization"] = "bearer $token";

    return headers;
  }

  @override
  Future<String> getToken(String username, String password) async {
    var response = await WooCommerceClient.client.post(
      "$BASE_URL/jwt-auth/v1/token",
      {
        "username": username,
        "password": password,
      },
    );

    var item = response.data;

    return item["token"];
  }

  @override
  Future<Customer> getCustomer(String token) async {
    await updateCrrency(token);

    var response = await WooCommerceClient.client
        .get("/customers/" + customerId, headers: buildHeaders(token: token));

    var item = response.data;

    return new Customer(
      id: item["id"],
      token: token,
      firstName: item["first_name"],
      lastName: item["last_name"],
      profilePhoto: item["avatar_url"],
    );
  }

  @override
  Future<Product> getProduct(String token, String id) async {
    var response = await WooCommerceClient.client
        .get("/products/" + id, headers: buildHeaders(token: token));

    var item = response.data;

    return new Product(
      id: item["id"],
      price: item["price"],
      currency: currency,
      title: item["name"],
      description: item["description"],
      categories: _getCategories(item["categories"] as List<String>),
      photos: (item["images"] as List<dynamic>).map((b) => b["src"]),
    );
  }

  @override
  Future<List<Product>> listProducts(String token, SearchQuery query) async {
    var response = await WooCommerceClient.client.get("/products",
        query: {
          "search": query.keyword,
          "page": query.page.toString(),
          "category": query.categoryId.toString(),
          "per_page": query.pageSize,
        },
        headers: buildHeaders(token: token));

    var items = response.data as List<dynamic>;

    items.map((a) => new Product(
          id: a["id"],
          price: a["price"],
          currency: currency,
          title: a["name"],
          description: a["description"],
          categories:
              (a["categories"] as List<String>).map((b) => new Category(id: b)),
          photos: (a["images"] as List<dynamic>).map((b) => b["src"]),
        ));

    return items;
  }

  @override
  Future<List<Category>> listCategories(String token) async {
    var response = await WooCommerceClient.client
        .get("/products/categories", headers: buildHeaders(token: token));

    var items = response.data as List<dynamic>;

    items.map((a) => new Category(
        id: a["id"],
        title: a["name"],
        description: a["description"],
        photo: a["image"]["src"],
        parent: new Category(id: a["parent"]),
        children: <Category>[]));

    return categories = _buildCategoryTree(items);
  }

  @override
  Future<List<Banner>> listBanners(String token) async {
    throw new UnimplementedError();
  }

  @override
  Future<Cart> getCart(String token) async {
    throw new UnimplementedError();
  }

  @override
  Future<Cart> addToCart(String token, String productId, int quantity) async {
    throw new UnimplementedError();
  }

  @override
  Future<Cart> updateCart(String token, String productId, int quantity) async {
    throw new UnimplementedError();
  }

  List<Category> _buildCategoryTree(List<Category> categories) {
    var tree = <Category>[];
    var list = <Category>[];

    tree.addAll(categories
        .where((a) => a.parent.id == "0")
        .map((a) => a.copyWith(parent: null)));

    list.addAll(tree);

    var inserted = tree.length;
    var newChildAdded = true;

    while (inserted != categories.length && newChildAdded) {
      newChildAdded = false;
      categories.forEach((c) {
        var parent = tree.firstWhere((p) => p.id == c.parent.id);
        if (parent != null && !parent.children.any((cc) => cc.id == c.id)) {
          inserted++;
          newChildAdded = true;
          parent.addChild(c);
          list.add(c);
        }
      });
    }

    // categories = list;

    return tree;
  }

  Future<Cart> addCreditCardToCart(String token, String creditCardId) async {
    throw new UnimplementedError();
  }

  Future<Cart> addAddressToCart(String token, String addressId) async {
    throw new UnimplementedError();
  }

  Future<Order> placeOrder(String token) async {
    throw new UnimplementedError();
  }

  Future<List<CreditCard>> listCreditCards(String token) async {
    throw new UnimplementedError();
  }

  Future<CreditCard> createCreditCard(String token, CreditCard creditCard) {
    throw new UnimplementedError();
  }

  Future<List<Address>> listAddresses(String token) async {
    throw new UnimplementedError();
  }

  Future<Address> createAddress(String token, Address address) {
    throw new UnimplementedError();
  }

  @override
  Future<List<Country>> listCountries(String token) async {
    throw new UnimplementedError();
  }

  @override
  Future<List<City>> listCities(String token, String countryId) async {
    throw new UnimplementedError();
  }

  @override
  Stream<Response> onHttpResponse() {
    return client.onResponse();
  }

  Future<void> updateCrrency(String token) async {
    var response = await WooCommerceClient.client
        .get("/data/currencies/current", headers: buildHeaders(token: token));

    var item = response.data;

    currency = item["code"];
  }

  List<Category> _getCategories(List<String> categoryId) {
    var categories = <Category>[];

    for (var i = 0; i < categoryId.length; i++) {
      var category = _getCategory(categoryId[i]);
      if (category != null) categories.add(category);
    }
    return categories;
  }

  Category _getCategory(String categoryId) {
    return _findCategory(categoryId, categories);
  }

  Category _findCategory(String categoryId, List<Category> categories) {
    if (categories == null) return null;

    for (var i = 0; i < categories.length; i++) {
      if (categories[i].id == categoryId) return categories[i];

      var c = _findCategory(categoryId, categories[i].children);
      if (c != null) return c;
    }
    return null;
  }

  @override
  Future<Order> createOrder(String token, Order order) async {
    return new Order();
  }

  @override
  Future<List<Order>> listOrders(String token) async {
    return <Order>[];
  }
}
