import '../page_builders/cart_page_builder.dart';
import 'package:dio/dio.dart';
import '../models/models.dart';
import '../errors/errors.dart';

import 'store_client_interface.dart';

class FakeStoreClient implements StoreClientInterface {
  var products = <Product>[
    new Product(
      id: "1",
      title: "بلايستيشن امريكي 10 دولار",
      description: "الوصف",
      price: 40.00,
      oldPrice: 42.00,
      featured: true,
      currency: "ريال",
      photos: <String>[
        "https://abdulaziz.dev/assets/img/cardscart/9d82128a45114937a0bba2aa36cedf231558025831.jpeg"
      ],
      categories: <Category>[
        new Category(
          id: "1",
        ),
        new Category(
          id: "3",
        )
      ],
    ),
    new Product(
      id: "2",
      title: "بلايستيشن امريكي 20 دولار",
      price: 77.00,
      currency: "ريال",
      photos: <String>[
        "https://abdulaziz.dev/assets/img/cardscart/ad1f5bec145e1fee7a510d4a588646281558025897.jpeg"
      ],
      categories: <Category>[
        new Category(
          id: "1",
        ),
        new Category(
          id: "3",
        )
      ],
    ),
    new Product(
      id: "3",
      title: "بلايستيشن امريكي بلس 3 أشهر",
      price: 87.00,
      currency: "ريال",
      photos: <String>[
        "https://abdulaziz.dev/assets/img/cardscart/b5375646b925b3a059ab21ed4ac36a611558025927.jpeg"
      ],
      categories: <Category>[
        new Category(
          id: "1",
        ),
        new Category(
          id: "3",
        )
      ],
    ),
    new Product(
      id: "4",
      title: "بلايستيشن امريكي 50 دولار",
      price: 185.00,
      currency: "ريال",
      photos: <String>[
        "https://abdulaziz.dev/assets/img/cardscart/e87595eb915a7cd7919861a7616b82d41558025913.jpeg"
      ],
      categories: <Category>[
        new Category(
          id: "1",
        ),
        new Category(
          id: "3",
        )
      ],
    ),
    new Product(
      id: "5",
      title: "بلايستيشن سعودي 5 دولار",
      price: 20.00,
      currency: "ريال",
      photos: <String>[
        "https://abdulaziz.dev/assets/img/cardscart/51992bce2f24bcde0173cfa8f8da186c1558026069.png"
      ],
      categories: <Category>[
        new Category(
          id: "1",
        ),
        new Category(
          id: "4",
        )
      ],
    ),
    new Product(
      id: "6",
      title: "بلايستيشن سعودي بلس 1 شهر",
      price: 30.00,
      currency: "ريال",
      photos: <String>[
        "https://abdulaziz.dev/assets/img/cardscart/e263dc24b7db854bcdef3bcdb751c6d11566232242.jpeg"
      ],
      categories: <Category>[
        new Category(
          id: "1",
        ),
        new Category(
          id: "4",
        )
      ],
    ),
    new Product(
      id: "7",
      title: "بلايستيشن سعودي 10 دولار",
      price: 40.00,
      currency: "ريال",
      photos: <String>[
        "https://abdulaziz.dev/assets/img/cardscart/1d0734119df4bfa785c367ca525687d21558125948.png"
      ],
      categories: <Category>[
        new Category(
          id: "1",
        ),
        new Category(
          id: "4",
        )
      ],
    ),
    new Product(
      id: "8",
      title: "بلايستيشن سعودي 15 دولار",
      price: 57.00,
      currency: "ريال",
      photos: <String>[
        "https://abdulaziz.dev/assets/img/cardscart/9384a1c0f8d294782b26efdc523ba7611558026153.png"
      ],
      categories: <Category>[
        new Category(
          id: "1",
        ),
        new Category(
          id: "4",
        )
      ],
    ),
    new Product(
      id: "9",
      title: "ايتونز امريكي 5 دولار",
      price: 23.00,
      currency: "ريال",
      photos: <String>[
        "https://abdulaziz.dev/assets/img/cardscart/442830c4d083b38e53983215a88576e31589794535.jpeg"
      ],
      categories: <Category>[
        new Category(
          id: "2",
        ),
        new Category(
          id: "5",
        )
      ],
    ),
    new Product(
      id: "10",
      title: "ايتونز امريكي 10 دولار",
      price: 39.00,
      currency: "ريال",
      photos: <String>[
        "https://abdulaziz.dev/assets/img/cardscart/b7759f3db3db8368d4861224f05e71c91589794194.jpeg"
      ],
      categories: <Category>[
        new Category(
          id: "2",
        ),
        new Category(
          id: "5",
        )
      ],
    ),
    new Product(
      id: "11",
      title: "ايتونز امريكي 15 دولار",
      price: 58.00,
      currency: "ريال",
      photos: <String>[
        "https://abdulaziz.dev/assets/img/cardscart/99a1e25af6b8b2c1278a9f8ef82c195e1589794260.jpeg"
      ],
      categories: <Category>[
        new Category(
          id: "2",
        ),
        new Category(
          id: "5",
        )
      ],
      featured: true,
    ),
    new Product(
      id: "12",
      title: "ايتونز امريكي 25 دولار",
      price: 95.00,
      currency: "ريال",
      photos: <String>[
        "https://abdulaziz.dev/assets/img/cardscart/28d8f482581532e970e2cb6dbecc20fc1589794295.jpeg"
      ],
      categories: <Category>[
        new Category(
          id: "2",
        ),
        new Category(
          id: "5",
        )
      ],
    ),
    new Product(
      id: "13",
      title: "ايتونز سعودي 50 ريال",
      price: 50.00,
      currency: "ريال",
      photos: <String>[
        "https://abdulaziz.dev/assets/img/cardscart/e82adc464ba73f3ca2aab3e86c8b63871589794551.jpeg"
      ],
      categories: <Category>[
        new Category(
          id: "2",
        ),
        new Category(
          id: "6",
        )
      ],
    ),
    new Product(
      id: "14",
      title: "ايتونز سعودي 75 ريال",
      price: 75.00,
      currency: "ريال",
      photos: <String>[
        "https://abdulaziz.dev/assets/img/cardscart/cf3ba2860d1c95a27de07b0d90f346991589794762.jpeg"
      ],
      categories: <Category>[
        new Category(
          id: "2",
        ),
        new Category(
          id: "6",
        )
      ],
      featured: true,
    ),
    new Product(
      id: "15",
      title: "ايتونز سعودي 100 ريال",
      price: 100.00,
      currency: "ريال",
      photos: <String>[
        "https://abdulaziz.dev/assets/img/cardscart/6fcc36984c5a61116d828885be48d5ae1589794687.jpeg"
      ],
      categories: <Category>[
        new Category(
          id: "2",
        ),
        new Category(
          id: "6",
        )
      ],
    ),
    new Product(
      id: "16",
      title: "ايتونز سعودي 150 ريال",
      price: 150.00,
      currency: "ريال",
      photos: <String>[
        "https://abdulaziz.dev/assets/img/cardscart/4b540fd705e1bd7d3f5a83ac8ec747721589794814.jpeg"
      ],
      categories: <Category>[
        new Category(
          id: "2",
        ),
        new Category(
          id: "6",
        )
      ],
    ),
  ];

  var categories = <Category>[
    new Category(
      id: "1",
      title: "بلايستيشن",
      photo: "https://abdulaziz.dev/assets/img/cardscart/PlayStation_logo.png",
    ),
    new Category(
      id: "2",
      title: "ايتونز",
      photo: "https://abdulaziz.dev/assets/img/cardscart/itunes_logo.png",
    ),
    new Category(
      id: "3",
      title: "بلايستيشن امريكي",
      parent: new Category(id: "1"),
    ),
    new Category(
      id: "4",
      title: "بلايستيشن سعودي",
      parent: new Category(id: "1"),
    ),
    new Category(
      id: "5",
      title: "ايتونز امريكي",
      parent: new Category(id: "2"),
    ),
    new Category(
      id: "6",
      title: "ايتونز سعودي",
      parent: new Category(id: "2"),
    ),
    new Category(
      id: "7",
      title: "بلايستيشن",
      photo: "https://abdulaziz.dev/assets/img/cardscart/PlayStation_logo.png",
    ),
    new Category(
      id: "8",
      title: "ايتونز",
      photo: "https://abdulaziz.dev/assets/img/cardscart/itunes_logo.png",
    ),
  ];

  var cart = new Cart(
    currency: "ريال",
    //  tax: 0, totalPrice: 0,
    items: [],
  );

  var orders = [
    new Order(
      id: "12345678",
      currency: "ريال",
      subTotal: 100,
      tax: 20,
      totalPrice: 120,
      items: [],
      status: "مكتمل",
      createdAt: DateTime.now(),
    ),
  ];

  var creditCards = <CreditCard>[
    new CreditCard(
        id: "1",
        fullName: "abdulaziz mohammed",
        number: "373222744792648",
        expiration: "11/22",
        ccv: "422",
        issuingNetwork: "Visa"),
    new CreditCard(
        id: "2",
        fullName: "abdulaziz mohammed",
        number: "377924119420533",
        expiration: "8/21",
        ccv: "846",
        issuingNetwork: "MasterCard"),
  ];

  var addresses = <Address>[
    new Address(
      id: "1",
      fullName: "abdulaziz mohammed",
      line1: "Bader alBarrak st",
      line2: "building no. 23423",
      city: "Riyadh",
      country: "Saudi Arabia",
      zip: "29824",
      phone: "9664533876",
    ),
    new Address(
      id: "2",
      fullName: "abdulaziz mohammed",
      line1: "risallah st",
      line2: "Apartment 32, building no. 24",
      city: "Jeddah",
      country: "Saudi Arabia",
      zip: "42274",
      phone: "9664533876",
    ),
  ];

  FakeStoreClient() {
    cart.items.add(CartItem(product: products[0].copyWith(), quantity: 1));
    orders[0]
        .items
        .add(CartItem(product: products[0].copyWith(), quantity: 1, data: {
          "codes": ["DFS333FEWE54FEXSX3443"]
        }));
    orders.add(orders[0].copyWith());
    orders[1]
        .items
        .add(CartItem(product: products[8].copyWith(), quantity: 2, data: {
          "codes": [
            "DFS333FEWE54FEXSX3443",
            "DFS333FEWE54FEXSX3443",
          ]
        }));
    orders.add(orders[0].copyWith());
  }

  @override
  Future<Customer> getCustomer(String token) async {
    await Future.delayed(Duration(milliseconds: 500));

    return new Customer(
      "1",
      "87gg87weef78twefg43F43#98992",
      "jhon",
      "doe",
      null,
    );
  }

  @override
  Future<Product> getProduct(String token, String id) async {
    await Future.delayed(Duration(milliseconds: 500));

    var product = products.firstWhere((a) => a.id == id);

    if (product == null) throw AppError();

    return product.copyWith(
        categories:
            _getCategories(product.categories.map((c) => c.id).toList()));
  }

  @override
  Future<String> getToken(String username, String password) async {
    await Future.delayed(Duration(milliseconds: 500));

    return "87gg87weef78twefg43F43#98992";
  }

  @override
  Future<List<Category>> listCategories(String token) async {
    await Future.delayed(Duration(milliseconds: 500));

    return _buildCateegoryTree(categories);
  }

  @override
  Future<List<Product>> listProducts(String token, SearchQuery query) async {
    await Future.delayed(Duration(milliseconds: 500));

    var result = products;

    if (query.keyword != null)
      result = result.where((a) => a.title.contains(query.keyword)).toList();
    if (query.categoryId != null)
      result = result
          .where((a) => a.categories.any((b) => b.id == query.categoryId))
          .toList();
    if (query.page != null)
      result = result
          .skip((int.parse(query.page) - 1) * query.pageSize)
          .take(query.pageSize)
          .toList();

    return result
        .map((a) => a.copyWith(
            categories: _getCategories(a.categories.map((c) => c.id).toList())))
        .toList();
  }

  @override
  Future<List<Banner>> listBanners(String token) async {
    return <Banner>[
      new Banner(
        title: "banner 1",
        photo: "https://abdulaziz.dev/assets/img/cardscart/banner1.png",
      ),
      new Banner(
        photo: "https://abdulaziz.dev/assets/img/cardscart/banner2.jpeg",
      )
    ];
  }

  @override
  Future<Cart> getCart(String token) async {
    await Future.delayed(Duration(milliseconds: 500));

    return cart.copyWith();
  }

  @override
  Future<Cart> addToCart(String token, String productId, int quantity) async {
    await Future.delayed(Duration(milliseconds: 500));

    var items = cart.items.where((a) => a.product.id != productId).toList();

    if (quantity > 0) {
      var product = products.firstWhere((a) => a.id == productId);
      quantity += cart.items
              .firstWhere((a) => a.product.id == productId, orElse: () => null)
              ?.quantity ??
          0;
      items.add(new CartItem(product: product, quantity: quantity));
    }

    double totalPrice = items.fold(
        0, (total, item) => total + item.product.price * item.quantity);

    cart = cart.copyWith(
      items: items,
      totalPrice: totalPrice + 0.05 * totalPrice,
      subTotal: totalPrice,
      tax: 0.05 * totalPrice,
    );

    return cart;
  }

  @override
  Future<Cart> updateCart(String token, String productId, int quantity) async {
    await Future.delayed(Duration(milliseconds: 500));

    var items = cart.items.where((a) => a.product.id != productId).toList();

    if (quantity > 0) {
      var product = products.firstWhere((a) => a.id == productId);
      items.add(new CartItem(product: product, quantity: quantity));
    }
    double totalPrice = items.fold(
        0, (total, item) => total + item.product.price * item.quantity);

    cart = cart.copyWith(
      items: items,
      totalPrice: totalPrice + 0.05 * totalPrice,
      subTotal: totalPrice,
      tax: 0.05 * totalPrice,
    );

    return cart;
  }

  Future<Cart> addCreditCardToCart(String token, String creditCardId) async {
    await Future.delayed(Duration(milliseconds: 500));

    return cart = cart.copyWith(
        creditCard: creditCards.firstWhere((a) => a.id == creditCardId));
  }

  Future<Cart> addAddressToCart(String token, String addressId) async {
    await Future.delayed(Duration(milliseconds: 500));

    return cart =
        cart.copyWith(address: addresses.firstWhere((a) => a.id == addressId));
  }

  Future<Order> placeOrder(String token) async {
    await Future.delayed(Duration(milliseconds: 3000));

    cart = new Cart();

    return new Order();
  }

  Future<List<CreditCard>> listCreditCards(String token) async {
    await Future.delayed(Duration(milliseconds: 500));

    return creditCards.map((a) => a.copyWith()).toList();
  }

  Future<CreditCard> createCreditCard(
      String token, CreditCard creditCard) async {
    await Future.delayed(Duration(milliseconds: 500));

    creditCards
        .add(creditCard.copyWith(id: (creditCards.length + 1).toString()));

    return creditCard;
  }

  Future<List<Address>> listAddresses(String token) async {
    await Future.delayed(Duration(milliseconds: 500));

    return addresses.map((a) => a.copyWith()).toList();
  }

  Future<Address> createAddress(String token, Address address) async {
    await Future.delayed(Duration(milliseconds: 500));

    addresses.add(address.copyWith(id: (addresses.length + 1).toString()));

    return address;
  }

  @override
  Future<List<Country>> listCountries(String token) async {
    await Future.delayed(Duration(milliseconds: 500));

    return <Country>[
      new Country(id: "1", name: "Kingdom of Saudi Arabia"),
      new Country(id: "2", name: "Bahrain"),
    ];
  }

  @override
  Future<List<City>> listCities(String token, String countryId) async {
    await Future.delayed(Duration(milliseconds: 500));

    if (countryId == "1")
      return <City>[
        new City(id: "1", name: "Riyadh"),
        new City(id: "2", name: "Jeddah"),
      ];

    return <City>[
      new City(id: "1", name: "Manama"),
    ];
  }

  @override
  Stream<Response> onHttpResponse() {
    return new Stream.empty();
  }

//two levels only
  List<Category> _buildCateegoryTree(List<Category> categories) {
    var tree = <Category>[];

    tree.addAll(categories
        .where((a) => a.parent == null || a.parent.id == "0")
        .map((a) => a.copyWith(parent: null))
        .toList());

    var inserted = tree.length;
    var newChildAdded = true;

    while (inserted != categories.length && newChildAdded) {
      newChildAdded = false;
      categories.forEach((c) {
        var parent = tree.firstWhere(
            (p) =>
                // p.parent != null && p.parent.id != "0" &&
                c.parent != null && c.parent.id != "0" && p.id == c.parent.id,
            orElse: () => null);
        if (parent != null && !parent.children.any((cc) => cc.id == c.id)) {
          inserted++;
          newChildAdded = true;
          parent.addChild(c.copyWith());
          // parent.addChild(c);
        }
      });
    }

    return tree;
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

  List<Category> _getChildCategories(Category category) {
    return category.children
        .map((c) => _getChildCategories(c).toList())
        .toList()
        .expand((c) => c);
  }

  @override
  Future<Order> createOrder(String token, Order order) async {
    await Future.delayed(Duration(milliseconds: 500));
    orders.add(order);
    return order;
  }

  @override
  Future<List<Order>> listOrders(String token) async {
    await Future.delayed(Duration(milliseconds: 500));
    return orders;
  }
}
