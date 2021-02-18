// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class I18n {
  I18n();
  
  static I18n current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<I18n> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      I18n.current = I18n();
      
      return I18n.current;
    });
  } 

  static I18n of(BuildContext context) {
    return Localizations.of<I18n>(context, I18n);
  }

  /// `ar_SA`
  String get lang_COUNTRY {
    return Intl.message(
      'ar_SA',
      name: 'lang_COUNTRY',
      desc: '',
      args: [],
    );
  }

  /// `سلة البطاقات`
  String get appTitle {
    return Intl.message(
      'سلة البطاقات',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `الرئيسية`
  String get home {
    return Intl.message(
      'الرئيسية',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الدخول`
  String get login {
    return Intl.message(
      'تسجيل الدخول',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `اسم المستخدم`
  String get username {
    return Intl.message(
      'اسم المستخدم',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور`
  String get password {
    return Intl.message(
      'كلمة المرور',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `تحميل`
  String get loading {
    return Intl.message(
      'تحميل',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `بحث`
  String get search {
    return Intl.message(
      'بحث',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `الأقسام`
  String get categories {
    return Intl.message(
      'الأقسام',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `السلة`
  String get cart {
    return Intl.message(
      'السلة',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `طلباتي`
  String get myOrders {
    return Intl.message(
      'طلباتي',
      name: 'myOrders',
      desc: '',
      args: [],
    );
  }

  /// `حسابي`
  String get myAccount {
    return Intl.message(
      'حسابي',
      name: 'myAccount',
      desc: '',
      args: [],
    );
  }

  /// `الكل`
  String get all {
    return Intl.message(
      'الكل',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `الوضع الداكن`
  String get darkMode {
    return Intl.message(
      'الوضع الداكن',
      name: 'darkMode',
      desc: '',
      args: [],
    );
  }

  /// `إضافة للسلة`
  String get addToCart {
    return Intl.message(
      'إضافة للسلة',
      name: 'addToCart',
      desc: '',
      args: [],
    );
  }

  /// `أبل باي`
  String get buyByApplePay {
    return Intl.message(
      'أبل باي',
      name: 'buyByApplePay',
      desc: '',
      args: [],
    );
  }

  /// `البطاقة الإئتمانية`
  String get buyByCreditCard {
    return Intl.message(
      'البطاقة الإئتمانية',
      name: 'buyByCreditCard',
      desc: '',
      args: [],
    );
  }

  /// `قبل`
  String get before {
    return Intl.message(
      'قبل',
      name: 'before',
      desc: '',
      args: [],
    );
  }

  /// `الآن`
  String get now {
    return Intl.message(
      'الآن',
      name: 'now',
      desc: '',
      args: [],
    );
  }

  /// `تمت إضافة البطاقة إلى سلتك`
  String get addedToCart {
    return Intl.message(
      'تمت إضافة البطاقة إلى سلتك',
      name: 'addedToCart',
      desc: '',
      args: [],
    );
  }

  /// `الإنتقال إلى السلة`
  String get goToCart {
    return Intl.message(
      'الإنتقال إلى السلة',
      name: 'goToCart',
      desc: '',
      args: [],
    );
  }

  /// `موافق`
  String get ok {
    return Intl.message(
      'موافق',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `إغلاق`
  String get close {
    return Intl.message(
      'إغلاق',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `متابعة التسوق`
  String get continueShopping {
    return Intl.message(
      'متابعة التسوق',
      name: 'continueShopping',
      desc: '',
      args: [],
    );
  }

  /// `إتمام الطلب`
  String get checkout {
    return Intl.message(
      'إتمام الطلب',
      name: 'checkout',
      desc: '',
      args: [],
    );
  }

  /// `رائع`
  String get success {
    return Intl.message(
      'رائع',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `السلة فارغة`
  String get emptyCart {
    return Intl.message(
      'السلة فارغة',
      name: 'emptyCart',
      desc: '',
      args: [],
    );
  }

  /// `المجموع`
  String get subtotal {
    return Intl.message(
      'المجموع',
      name: 'subtotal',
      desc: '',
      args: [],
    );
  }

  /// `الضريبة`
  String get tax {
    return Intl.message(
      'الضريبة',
      name: 'tax',
      desc: '',
      args: [],
    );
  }

  /// `الإجمالي`
  String get total {
    return Intl.message(
      'الإجمالي',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `تأكيد الطلب`
  String get confirmOrder {
    return Intl.message(
      'تأكيد الطلب',
      name: 'confirmOrder',
      desc: '',
      args: [],
    );
  }

  /// `بطاقة مدى / بطاقة ائتمانية`
  String get madaOrCreditCard {
    return Intl.message(
      'بطاقة مدى / بطاقة ائتمانية',
      name: 'madaOrCreditCard',
      desc: '',
      args: [],
    );
  }

  /// `STC Pay`
  String get stcpay {
    return Intl.message(
      'STC Pay',
      name: 'stcpay',
      desc: '',
      args: [],
    );
  }

  /// `التحويل البنكي`
  String get bankWire {
    return Intl.message(
      'التحويل البنكي',
      name: 'bankWire',
      desc: '',
      args: [],
    );
  }

  /// `الرصيد`
  String get balance {
    return Intl.message(
      'الرصيد',
      name: 'balance',
      desc: '',
      args: [],
    );
  }

  /// `أوافق على شروط الاستخدام`
  String get iAcceptOnAgreement {
    return Intl.message(
      'أوافق على شروط الاستخدام',
      name: 'iAcceptOnAgreement',
      desc: '',
      args: [],
    );
  }

  /// `هل لديك كوبون خصم؟`
  String get doYouHaveCoupon {
    return Intl.message(
      'هل لديك كوبون خصم؟',
      name: 'doYouHaveCoupon',
      desc: '',
      args: [],
    );
  }

  /// `انقر هنا لإدخال رمز القسيمة`
  String get pressToEnterCoupon {
    return Intl.message(
      'انقر هنا لإدخال رمز القسيمة',
      name: 'pressToEnterCoupon',
      desc: '',
      args: [],
    );
  }

  /// `حفظ معلومات الدفع إلى الحساب`
  String get savePaymentDetails {
    return Intl.message(
      'حفظ معلومات الدفع إلى الحساب',
      name: 'savePaymentDetails',
      desc: '',
      args: [],
    );
  }

  /// `هل تود إرسال كهدية؟`
  String get sendItAsGift {
    return Intl.message(
      'هل تود إرسال كهدية؟',
      name: 'sendItAsGift',
      desc: '',
      args: [],
    );
  }

  /// `تفاصيل الطلب`
  String get orderDetails {
    return Intl.message(
      'تفاصيل الطلب',
      name: 'orderDetails',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<I18n> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ar', countryCode: 'SA'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<I18n> load(Locale locale) => I18n.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}