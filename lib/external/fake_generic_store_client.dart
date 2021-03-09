import '../errors/errors.dart';
import 'package:dio/dio.dart';
import '../models/models.dart';

import 'store_client_interface.dart';

class FakeGenericStoreClient implements StoreClientInterface {
  var products = <Product>[
    new Product(
        id: "1",
        title: "suit",
        description: "fancy suit",
        price: 20.00,
        currency: "SAR",
        photos: <String>[
          "https://2yjvhw.am.files.1drv.com/y4milarlQ4epxO8cjpepGjW5W2Gtn0Ggd5IV_J45ioHcbcZyjJMlprgO6dgumSYbiOu85tHW4F_qNpShRq5H6-j_KRcVaPmMeUSr74Y7_qJCNJCMP__7IN4ivsinDQOvKtvfjHzuNRCj2aYz00BSyZO-iq4_7EUVGS-79JLC-lFzqdPZwEd5i46sJdWiwemUB8RNuLZY_S9bl9luyTNx1coDQ/suit.png?psid=1"
        ],
        categories: <Category>[
          new Category(
            id: "3",
          ),
          new Category(
            id: "4",
          )
        ]),
    new Product(
        id: "2",
        title: "iphone x",
        description: "apple's latest phone",
        price: 3990.00,
        currency: "SAR",
        photos: <String>[
          "https://2yjvhw.am.files.1drv.com/y4mbwVhm8J9U2y6j5-Te97_hIEIBXrPSlhIY9pi189W02ct0WI1PBUhuuqeX1yGwW7_0zEkjtLf8NEm1yD2l5qB518mZ3j-_9eBfehCDvYkfupi7RQofulOrfP1W6ocoI0vBoXGq3S8MbUiwwGYKrFFC6swzhRz5Fl7D1-luRTJ_bH2yzMJ5eX4DYEwX46Rk4_Cr_Jfl0ZHj3Ak-XXrOD-U7A/iphone-x-10.png?psid=1",
          "https://2yjvhw.am.files.1drv.com/y4mlp8BV46VXMaoPPmyQtwUNUeTfIZb50ijYIt-Ed-mVFLf-LDpzkmByqbsaCachqOo2wQbqoQXfs44kWU1309Xp6hNk93WDNP_dD5fhbk51jPwLz9zHdjCFWPGscBeWPLI5CuAGCYyrx2g7RRZMXRu4xtEY0lQ3yHz6qMWMUOKhQhZa6W2NpRNCIkPiVV__rMXchFYMHInwDY3aJ4WfZThng/iphone-x-10-2.jpg?psid=1",
          "https://2yjvhw.am.files.1drv.com/y4mg9yPB6YyOmLOaZfTU7UgxJKzDbfdqyOWztMsyFNApIeJfL0InSADCXnEVZ2Y1kpVWnNxsixa17jwsxaBINZ_Av6Pk1y5xL-u5hWiqcEw8J3Uu3-fTzFECoPASjHXQIXK8K_QQjbfW_0qvpMkQCnkKZuag_l-2WACjyQNchemKSn3X7pdx7Eu5ZVlrVxg91zfAiGBbKhTJOsDkGW-WeeiFA/iphone-x-10-3.png?psid=1",
        ],
        categories: <Category>[
          new Category(
            id: "5",
          ),
          new Category(
            id: "2",
          ),
        ]),
    new Product(
        id: "3",
        title: "samsung Galaxy s8 plus 2019 refurbished",
        description:
            "The revolutionary design of the Galaxy S8 and S8+ begins from the inside out. We rethought every part of the phone's layout to break through the confines of the smartphone screen. So all you see is pure content and virtually no bezel. It's the biggest, most immersive screen on a Galaxy smartphone of this size. And it's easy to hold in one hand.",
        price: 949.00,
        currency: "SAR",
        photos: <String>[
          "https://2yjvhw.am.files.1drv.com/y4m54amCEJDFMjH1Q6EPc3Ep-EWaRa0ttD1Ps1pLCe4asrW3WJliW_5jNAGQfxN8YClMBgzDVgLk1Nq4go1dK1Fhx8sDvyi5aSv5601TUAh11HdDIS-Y5aJO9RAZHw7lKj6z8EvDM7XVrdJxy3n6_zPFR2Fojtlfb4ff9E8RQq092DwHqZZEaIbPKM49rk--3OG90v9Us4FIrbck9WzlA9fSw/galaxy.png?psid=1",
        ],
        categories: <Category>[
          new Category(
            id: "5",
          ),
          new Category(
            id: "2",
          ),
        ]),
    new Product(
        id: "4",
        title: "4x4 table",
        description: "4x4 table!",
        price: 704.00,
        currency: "SAR",
        photos: <String>[
          "https://2yjvhw.am.files.1drv.com/y4mX4A61YH_jjA9aIvPanEfXYell4CX58Qiu_qiarOnwWfEvGjYffMgdwXeovJ6MkspOraaK2EOLy9sKsZOJF80mh_ER2nt2GJuLCfchPUraOiwI_cLbMMTUOSrRrwlrkIHudtMgu3BnZXHxbhn48I-cN-xRGixwqFR-aaHAMW-rm0-KRSTyeDedqn07g757h1sqx8uzm2cP475TuChWJiTPg/table.png?psid=1",
          "https://2yjvhw.am.files.1drv.com/y4mnoaZs2YqBEfCbdFayJ_Qsj0lixIjZ2mtq7ilVeCzrkngt_1JV-8in2VzWihLpTsHK8tr7cJiN_-6m0TGX3YmO-u552vMbAbvZmwYiu6jDEtNt8fRUawlOj-94owESoErQPPSzIsQ5Dz8NGYMlNSygkQlux9tqm-N_t3SHak0CYeEMRf9-Jpxvq14AUUECmGD62nOGCK7PrjZn19tskJfOw/table2.png?psid=1",
        ],
        categories: <Category>[
          new Category(
            id: "9",
          ),
        ]),
    new Product(
        id: "5",
        title: "Paper Printer",
        description: "Paper Printer!",
        price: 1239.00,
        currency: "SAR",
        photos: <String>[
          "https://2yjvhw.am.files.1drv.com/y4mZGLAdDQROmoyARBj5JM05nTe5pXcEfzVIAolemVqYaEFtFwg_PWz4naH97p9dPznOKhE4P63K8ZPDEtGZoHzJNIvR4ByiGvFCVRZuChUK3FM18mwmbgE3pgBGfbc85T0JWKz8BWyC9A6yYvyKCIuf60RX0U6WDQSvCo5eRQpnjtQ36q_DLEm1Z1H7YAhw4-wmvzC3Jdbtx1h_djER1HtOw/printer.png?psid=1"
        ],
        categories: <Category>[
          new Category(
            id: "8",
          ),
        ])
  ];

  var categories = <Category>[];

  var cart = new Cart(
      currency: "SAR"
      // , tax: 0, totalPrice: 0
      ,
      items: []);

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

  @override
  Future<Customer> getCustomer(String token) async {
    await Future.delayed(Duration(milliseconds: 1000));

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
    await Future.delayed(Duration(milliseconds: 1000));

    var product = products.firstWhere((a) => a.id == id);

    if (product == null) throw AppError();

    return product.copyWith(
        categories:
            _getCategories(product.categories.map((c) => c.id).toList()));
  }

  @override
  Future<String> getToken(String username, String password) async {
    await Future.delayed(Duration(milliseconds: 1000));

    return "87gg87weef78twefg43F43#98992";
  }

  @override
  Future<List<Category>> listCategories(String token) async {
    await Future.delayed(Duration(milliseconds: 1000));

    var items = <Category>[
      new Category(
        id: "1",
        title: "clothing",
        description: "pants and shirts!",
        photo: "",
      ),
      new Category(
        id: "2",
        title: "electronics",
        description: "electronics and mobiles",
        photo: "",
      ),
      new Category(
          id: "3",
          title: "pants",
          description: "pants!",
          photo: "",
          parent: new Category(id: "1")),
      new Category(
          id: "4",
          title: "shirts",
          description: "shirts!",
          photo: "",
          parent: new Category(id: "1")),
      new Category(
          id: "5",
          title: "phones",
          description: "phones!",
          photo: "",
          parent: new Category(id: "2")),
      new Category(
        id: "6",
        title: "Home Appliances",
        description: "Home Appliances!",
        photo: "",
      ),
      new Category(
        id: "7",
        title: "Foods",
        description: "Foods!",
        photo: "",
      ),
      new Category(
        id: "8",
        title: "Office Supplies",
        description: "Office Supplies!",
        photo: "",
      ),
      new Category(
        id: "9",
        title: "furnitures",
        description: "furnitures!",
        photo: "",
      ),
    ];

    return categories = _buildCateegoryTree(items);
  }

  @override
  Future<List<Product>> listProducts(String token, SearchQuery query) async {
    await Future.delayed(Duration(milliseconds: 1000));

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
        title: "Best Selling Electronics",
        photo:
            "https://2yjvhw.am.files.1drv.com/y4mOH7LCdwPD8vXgGXEcOIGyf_Rk2-kxyLiN8A3V6N5A2buOjuwswmILDadxZ6aMoNY0sDR04rMZo3Z-2sHSzrv5gAd2m2Cxxo8lHq8qIXE9VD1XmaXrn4-g5w7CZkRDlUo7ofX12a0pYX5Qw9XrB9N2DrIrg9IEfDb7ilTrXdjPo152giatMN_2XitSEueJ1xE7VFfEPGJLg0oTS6FatI3oQ/L_1565207211_weben.jpg?psid=1",
        query: SearchQuery(
          categoryId: "2",
        ),
      ),
      new Banner(
        photo:
            "https://2yjvhw.am.files.1drv.com/y4mbFfXP572EewwDp1WUw3WqmqC1CVASkSbKDa8hIqFd4zywDDOiu43FG537fSDogMk6R-Im4e0AmG3GJW4D9PL-YRHNbe2A-qnsGYd_XTOV03L_c5rou0AOV99BwbJcZlyi83WQ8zozBzkUqxxFYX8XwOF3xlfcDuLldym9Gt4Vpw-YQVCNLXBbpcSWgZa3NH3qIZ7ue4UXH6QZdHxLyKdXg/L_1565249414_bagsen.jpg?psid=1",
      )
    ];
  }

  @override
  Future<Cart> getCart(String token) async {
    await Future.delayed(Duration(milliseconds: 1500));

    return cart.copyWith();
  }

  @override
  Future<Cart> addToCart(String token, String productId, int quantity) async {
    await Future.delayed(Duration(milliseconds: 1000));

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
    await Future.delayed(Duration(milliseconds: 1000));

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
    await Future.delayed(Duration(milliseconds: 1000));

    return cart = cart.copyWith(
        creditCard: creditCards.firstWhere((a) => a.id == creditCardId));
  }

  Future<Cart> addAddressToCart(String token, String addressId) async {
    await Future.delayed(Duration(milliseconds: 1000));

    return cart =
        cart.copyWith(address: addresses.firstWhere((a) => a.id == addressId));
  }

  Future<Order> placeOrder(String token) async {
    await Future.delayed(Duration(milliseconds: 3000));

    cart = new Cart();

    return new Order();
  }

  Future<List<CreditCard>> listCreditCards(String token) async {
    await Future.delayed(Duration(milliseconds: 1000));

    return creditCards.map((a) => a.copyWith()).toList();
  }

  Future<CreditCard> createCreditCard(
      String token, CreditCard creditCard) async {
    await Future.delayed(Duration(milliseconds: 1000));

    creditCards
        .add(creditCard.copyWith(id: (creditCards.length + 1).toString()));

    return creditCard;
  }

  Future<List<Address>> listAddresses(String token) async {
    await Future.delayed(Duration(milliseconds: 1000));

    return addresses.map((a) => a.copyWith()).toList();
  }

  Future<Address> createAddress(String token, Address address) async {
    await Future.delayed(Duration(milliseconds: 1000));

    addresses.add(address.copyWith(id: (addresses.length + 1).toString()));

    return address;
  }

  @override
  Future<List<Country>> listCountries(String token) async {
    await Future.delayed(Duration(milliseconds: 1000));

    return <Country>[
      new Country(id: "1", name: "Kingdom of Saudi Arabia"),
      new Country(id: "2", name: "Bahrain"),
    ];
  }

  @override
  Future<List<City>> listCities(String token, String countryId) async {
    await Future.delayed(Duration(milliseconds: 1000));

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
                c.parent != null && c.parent.id != "0" && c.id == c.parent.id,
            orElse: () => null);
        if (parent != null && !parent.children.any((cc) => cc.id == c.id)) {
          inserted++;
          newChildAdded = true;
          parent.addChild(c.copyWith());
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
    return new Order();
  }

  @override
  Future<List<Order>> listOrders(String token) async {
    return <Order>[];
  }
}
