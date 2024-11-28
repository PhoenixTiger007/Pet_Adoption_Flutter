import 'package:shared_preferences/shared_preferences.dart';

class PrefData {
  static String packageName = 'hair_salon_';
  static String signIn = '${packageName}signIn';
  static String isIntro = '${packageName}isIntro';
  static String mode = '${packageName}mode';
  static String isPet = '${packageName}isPet';
  static String isAdoptionPet = '${packageName}isAdoptionPet';
  static String isCart = '${packageName}isCart';
  static String isNotification = '${packageName}isNotification';
  static String isOrder = '${packageName}isOrder';
  static String isAddress = '${packageName}iAddress';


  static setIsAddress(bool isFav) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isAddress, isFav);
  }

  static getIsAddress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isAddress) ?? false;
  }

  static setIsOrder(bool isFav) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isOrder, isFav);
  }

  static getIsOrder() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isOrder) ?? false;
  }



  static setIsNotification(bool isFav) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isNotification, isFav);
  }

  static getIsNotification() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isNotification) ?? false;
  }


  static setIsCart(bool isFav) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isCart, isFav);
  }

  static getIsCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isCart) ?? false;
  }

  static setIsAdoptionPet(bool isFav) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isAdoptionPet, isFav);
  }

  static getIsAdoptionPet() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isAdoptionPet) ?? false;
  }


  static setIsPet(bool isFav) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isPet, isFav);
  }

  static getIsPet() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isPet) ?? false;
  }

  static setIsSignIn(bool isFav) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(signIn, isFav);
  }

  static getIsSignIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(signIn) ?? false;
  }

  static setIsIntro(bool isFav) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isIntro, isFav);
  }

  static getIsIntro() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isIntro) ?? true;
  }

  static setNightTheme(bool isFav) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(mode, isFav);
  }

  static getNightTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(mode) ?? false;
  }
}
