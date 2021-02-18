import 'package:dio/dio.dart';
import '../models/models.dart';

abstract class StoreClientInterface {
  Future<Product> getProduct(String token, String id);
  Future<List<Product>> listProducts(String token, SearchQuery query);
  Future<List<Category>> listCategories(String token);
  Future<List<Banner>> listBanners(String token);
  Future<Customer> getCustomer(String token);
  Future<String> getToken(String username, String password);
  Future<Cart> getCart(String token);
  Future<Cart> addToCart(String token, String productId, int quantity);
  Future<Cart> updateCart(String token, String productId, int quantity);
  Future<Cart> addCreditCardToCart(String token, String creditCardId);
  Future<Cart> addAddressToCart(String token, String addressId);
  Future<Order> placeOrder(String token);
  Future<List<CreditCard>> listCreditCards(String token);
  Future<CreditCard> createCreditCard(String token, CreditCard creditCard);
  Future<List<Address>> listAddresses(String token);
  Future<Address> createAddress(String token, Address address);
  Future<List<Country>> listCountries(String token);
  Future<List<City>> listCities(String token, String countryId);
  Future<List<Order>> listOrders(String token);
  Future<Order> createOrder(String token, Order order);
  Stream<Response> onHttpResponse();
}
