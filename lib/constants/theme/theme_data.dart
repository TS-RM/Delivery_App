import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tashil_food_app/constants/theme/fonts/font_app.dart';

Color mainColor = const Color(0xFFc1541b);
const Color onBoardingDocsColor = Color.fromRGBO(144, 152, 177, 1);
const Color onBoardingIndicatorColor = Color.fromRGBO(229, 229, 229, 1);
const Color onBoardingSkipButtonColor = Color.fromRGBO(28, 39, 96, 1);
const Color onBoardingSkipNextColor = Color.fromARGB(247, 186, 108, 19);
const Color authTextFromFieldFillColor = Color.fromRGBO(241, 244, 254, 1);
const Color authTextFromFieldPonderColor = Color.fromRGBO(214, 218, 225, 1);
const Color authTextFromFieldHintTextColor = Color.fromRGBO(194, 189, 189, 1);
Color authLoginWithTextColor = const Color.fromRGBO(28, 39, 96, 1);
const Color authSignUpTextLoginColor = Color.fromRGBO(195, 213, 255, 1);
const Color appBarPreferredSizeColor = Color.fromRGBO(112, 112, 112, 1);
const Color titleForgotPasswordScreen = Color.fromRGBO(137, 139, 154, 1);
const Color authTextFromFieldErrorBorderColor =
    Color.fromRGBO(204, 151, 151, 1);
const Color pinCodeTextFieldColor = Color.fromRGBO(112, 112, 112, 1);
const Color fullColorLogo = Color.fromRGBO(255, 161, 51, .08);
const Color darkGreyClr = Color(0xFF121212);
const Color darkMainColor = Color.fromRGBO(197, 58, 25, 1);
const Color onBoardingHomeScreen = Color.fromARGB(255, 188, 62, 4);
const Color priceColor = Color.fromRGBO(227, 163, 106, 1);
const Color headlineLargeColor = Color.fromRGBO(0, 76, 255, 1);
const Color displaySmallColor = Color.fromRGBO(144, 152, 177, 1);
const Color filterTitlesColor = Color.fromRGBO(28, 39, 96, 1);
const Color dateColor = Color.fromRGBO(39, 174, 96, 1);

class ThemesApp {
  static ThemeData lightTheme() => ThemeData(
        fontFamily: AppFonts.elMessiri,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: mainColor,
        secondaryHeaderColor: Colors.grey.shade100,
        textTheme: TextTheme(
          // headline1: TextStyle(
          //   color: Colors.black,
          // ),
          headlineLarge: const TextStyle(
            color: Colors.black,
          ),
          // headline2: TextStyle(
          //   color: Colors.white.withOpacity(.8),
          // ),
          displaySmall: TextStyle(
            color: Colors.white.withOpacity(.8),
          ),
          // headline3: TextStyle(
          //   color: Colors.white,
          // ),
          headlineMedium: const TextStyle(
            color: Colors.white,
          ),
          // container
          // headline4: TextStyle(
          //   color: Colors.white,
          // ),
          headlineSmall: const TextStyle(
            color: Colors.white,
          ),
          // headline5: TextStyle(
          //   color: Color.fromRGBO(144, 152, 177, 1),
          // ),
          titleLarge: const TextStyle(
            color: Color.fromRGBO(144, 152, 177, 1),
          ),
        ),
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
            systemNavigationBarColor: Colors.white,
            statusBarColor: Colors.white.withOpacity(.8),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black45),
          centerTitle: true,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(mainColor))),
        bottomNavigationBarTheme:
            const BottomNavigationBarThemeData(backgroundColor: Colors.white),
        iconTheme: const IconThemeData(color: Colors.black),
        hintColor: authTextFromFieldHintTextColor,
      );

  static ThemeData darkTheme() => ThemeData(
        fontFamily: AppFonts.elMessiri,
        scaffoldBackgroundColor: const Color(0xFF18172B),
        primaryColor: darkGreyClr,
        secondaryHeaderColor: const Color(0xFF27273c),
        textTheme: TextTheme(
          // headline1: TextStyle(
          //   color: Colors.white,
          // ),
          headlineLarge: const TextStyle(
            color: Colors.white,
          ),
          // headline2: TextStyle(
          //   color: Color(0xFF18172B).withOpacity(.8),
          // ),
          displaySmall: TextStyle(
            color: const Color(0xFF18172B).withOpacity(.8),
          ),
          // headline3: TextStyle(
          //   color: Colors.black,
          // ),
          headlineMedium: const TextStyle(
            color: Colors.black,
          ),

          // headline4: TextStyle(
          //   color: Color(0xFF27273c),
          // ),
          headlineSmall: const TextStyle(
            color: Color(0xFF27273c),
          ),

          // headline5: TextStyle(
          //   color: Color.fromRGBO(144, 152, 177, 1),
          // ),
          titleLarge: const TextStyle(
            color: Color.fromRGBO(144, 152, 177, 1),
          ),
        ),
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            // statusBarBrightness: Brightness.,

            systemNavigationBarColor: const Color(0xFF1F1F30),
            statusBarColor: const Color(0xFF18172B).withOpacity(.8),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarTextStyle: const TextStyle(color: Colors.white),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        cardColor: const Color(0xFF27273c),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(mainColor))),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Color(0xFF1F1F30)),
        iconTheme: const IconThemeData(color: Colors.white),
        hintColor: Colors.white,
      );
}
