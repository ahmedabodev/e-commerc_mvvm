import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const Color bluishClr = Color(0xFF4e5ae8);
const Color orangeClr = Color(0xCFFF8746);
const Color pinkClr = Color(0xFFff4667);
const Color white = Colors.white;
const primaryClr = bluishClr;
const Color darkGreyClr = Color(0xFF121212);
const Color darkHeaderClr = Color(0xFF424242);
class ThemeController extends ChangeNotifier {

  bool isDarkMode = true;
 void change(value){
   isDarkMode = value;
   notifyListeners();
 }
  void toggleDarkMode() {
    isDarkMode = !isDarkMode;
    if (isDarkMode) {
      // Get.changeTheme(Themes.dark);
    } else {
      // Get.changeTheme(Themes.light);
    }
    notifyListeners();
  }
}

class Themes {
  static final light = ThemeData(
    textTheme: const TextTheme(
      bodyText1: TextStyle(
            color:Colors.white,
        ),

    ),
useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light, seedColor:Colors.white,

    ),
    primarySwatch: Colors.deepOrange,
    appBarTheme: const AppBarTheme(
        titleSpacing: 20,
        backgroundColor:Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.blue,
          // navigation bar color
          statusBarColor: Colors.black, // status bar color
        ),
        titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold)),
    bottomNavigationBarTheme:  const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,

      unselectedItemColor: Colors.blueGrey,
      elevation: 20,
      backgroundColor:Color(0xffD6E4E5),
    ),

    primaryColor: primaryClr,
    scaffoldBackgroundColor:Color(0xffD6E4E5),
    backgroundColor: const Color(0xffD6E4E5),
    // brightness: Brightness.light,
    cardColor: const Color(0xffD1D9D9),

  );
  static final dark = ThemeData(
    useMaterial3: true,
colorScheme: ColorScheme.fromSeed(
  brightness: Brightness.dark, seedColor:Colors.white,

),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        color:Color(0xff33294a),
      ),


    ),
    primarySwatch: Colors.deepOrange,
    appBarTheme: const AppBarTheme(
        titleSpacing: 20,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xff333739),
          statusBarBrightness: Brightness.light,
        ),
        backgroundColor:
        Color(0xff1B2430),
        elevation: 0.0,
        titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(color: Colors.white)),
    bottomNavigationBarTheme:  BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor:  Colors.white,
      unselectedItemColor: Colors.grey,
      elevation: 20,
      backgroundColor:
      const Color(0xff011341).withOpacity(0.3),
    ),
    scaffoldBackgroundColor:
    const Color(0xff1B2430),
    cardColor: const Color(0xff182747),
    primaryColor: darkGreyClr,

    backgroundColor: darkGreyClr,

  );





}



