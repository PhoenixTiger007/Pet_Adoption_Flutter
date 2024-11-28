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
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Sub Total`
  String get subTotal {
    return Intl.message(
      'Sub Total',
      name: 'subTotal',
      desc: '',
      args: [],
    );
  }

  /// `Estimating Tax`
  String get estimatingTax {
    return Intl.message(
      'Estimating Tax',
      name: 'estimatingTax',
      desc: '',
      args: [],
    );
  }

  /// `Total Price`
  String get total {
    return Intl.message(
      'Total Price',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get payment {
    return Intl.message(
      'Payment',
      name: 'payment',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get addressTitle {
    return Intl.message(
      'Address',
      name: 'addressTitle',
      desc: '',
      args: [],
    );
  }

  /// `Checkout`
  String get checkout {
    return Intl.message(
      'Checkout',
      name: 'checkout',
      desc: '',
      args: [],
    );
  }

  /// `City/District*`
  String get cityDistrict {
    return Intl.message(
      'City/District*',
      name: 'cityDistrict',
      desc: '',
      args: [],
    );
  }

  /// `New Card`
  String get newCard {
    return Intl.message(
      'New Card',
      name: 'newCard',
      desc: '',
      args: [],
    );
  }

  /// `Card Number*`
  String get cardNumber {
    return Intl.message(
      'Card Number*',
      name: 'cardNumber',
      desc: '',
      args: [],
    );
  }

  /// `You may also like`
  String get youMayAlsoLike {
    return Intl.message(
      'You may also like',
      name: 'youMayAlsoLike',
      desc: '',
      args: [],
    );
  }

  /// `Card Holder Name*`
  String get cardHolderName {
    return Intl.message(
      'Card Holder Name*',
      name: 'cardHolderName',
      desc: '',
      args: [],
    );
  }

  /// `New Address`
  String get newAddress {
    return Intl.message(
      'New Address',
      name: 'newAddress',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Payment Methods`
  String get paymentMethods {
    return Intl.message(
      'Payment Methods',
      name: 'paymentMethods',
      desc: '',
      args: [],
    );
  }

  /// `Your Name`
  String get yourName {
    return Intl.message(
      'Your Name',
      name: 'yourName',
      desc: '',
      args: [],
    );
  }

  /// `Your Email`
  String get yourEmail {
    return Intl.message(
      'Your Email',
      name: 'yourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phoneNumber {
    return Intl.message(
      'Phone number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continueText {
    return Intl.message(
      'Continue',
      name: 'continueText',
      desc: '',
      args: [],
    );
  }

  /// `House/Apartment`
  String get houseApartment {
    return Intl.message(
      'House/Apartment',
      name: 'houseApartment',
      desc: '',
      args: [],
    );
  }

  /// `Agency/Company`
  String get agencyCompany {
    return Intl.message(
      'Agency/Company',
      name: 'agencyCompany',
      desc: '',
      args: [],
    );
  }

  /// `Zip*`
  String get zip {
    return Intl.message(
      'Zip*',
      name: 'zip',
      desc: '',
      args: [],
    );
  }

  /// `Save Cards`
  String get savedCards {
    return Intl.message(
      'Save Cards',
      name: 'savedCards',
      desc: '',
      args: [],
    );
  }

  /// `Exp. Date*`
  String get expDateHint {
    return Intl.message(
      'Exp. Date*',
      name: 'expDateHint',
      desc: '',
      args: [],
    );
  }

  /// `CVV`
  String get cvv {
    return Intl.message(
      'CVV',
      name: 'cvv',
      desc: '',
      args: [],
    );
  }

  /// `CVV*`
  String get cvvHint {
    return Intl.message(
      'CVV*',
      name: 'cvvHint',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profiles`
  String get editProfiles {
    return Intl.message(
      'Edit Profiles',
      name: 'editProfiles',
      desc: '',
      args: [],
    );
  }

  /// `Favourites`
  String get favourite {
    return Intl.message(
      'Favourites',
      name: 'favourite',
      desc: '',
      args: [],
    );
  }

  /// `My Favourites`
  String get myFavourite {
    return Intl.message(
      'My Favourites',
      name: 'myFavourite',
      desc: '',
      args: [],
    );
  }

  /// `Shipping Address`
  String get shippingAddress {
    return Intl.message(
      'Shipping Address',
      name: 'shippingAddress',
      desc: '',
      args: [],
    );
  }

  /// `My Saved Cards`
  String get mySavedCards {
    return Intl.message(
      'My Saved Cards',
      name: 'mySavedCards',
      desc: '',
      args: [],
    );
  }

  /// `Gift Cards & Vouchers`
  String get giftCard {
    return Intl.message(
      'Gift Cards & Vouchers',
      name: 'giftCard',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Review`
  String get review {
    return Intl.message(
      'Review',
      name: 'review',
      desc: '',
      args: [],
    );
  }

  /// `About us`
  String get aboutUs {
    return Intl.message(
      'About us',
      name: 'aboutUs',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message(
      'Cart',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `All Reviews`
  String get allReviews {
    return Intl.message(
      'All Reviews',
      name: 'allReviews',
      desc: '',
      args: [],
    );
  }

  /// `Write Reviews`
  String get writeReviewPage {
    return Intl.message(
      'Write Reviews',
      name: 'writeReviewPage',
      desc: '',
      args: [],
    );
  }

  /// `Write your review`
  String get writeYourReview {
    return Intl.message(
      'Write your review',
      name: 'writeYourReview',
      desc: '',
      args: [],
    );
  }

  /// `My Vouchers`
  String get myVouchers {
    return Intl.message(
      'My Vouchers',
      name: 'myVouchers',
      desc: '',
      args: [],
    );
  }

  /// `My Order`
  String get myOrder {
    return Intl.message(
      'My Order',
      name: 'myOrder',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get history {
    return Intl.message(
      'History',
      name: 'history',
      desc: '',
      args: [],
    );
  }

  /// `Minimum characters:250`
  String get minimumCharacter {
    return Intl.message(
      'Minimum characters:250',
      name: 'minimumCharacter',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get emailAddressHint {
    return Intl.message(
      'Email Address',
      name: 'emailAddressHint',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastName {
    return Intl.message(
      'Last Name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message(
      'First Name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `User Information`
  String get userInformation {
    return Intl.message(
      'User Information',
      name: 'userInformation',
      desc: '',
      args: [],
    );
  }

  /// `You have an already account?`
  String get youHaveAnAlreadyAccount {
    return Intl.message(
      'You have an already account?',
      name: 'youHaveAnAlreadyAccount',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
