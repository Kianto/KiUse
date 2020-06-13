import 'package:flutter/material.dart';

abstract class Constants{

  static final String appName = "KiUse";

  static final String title_AuthPhone = "Auth by Phone";
  static final String title_LoginEmail = "Auth by Email";
  static final String title_Register = "Register";
  static final String title_Forgot = "Forgot Password";
  static final String title_AccountInfo ="Profile";


  static final String sendOTP = "Send OTP";
  static final String enterOTP = "Enter OTP";


  static final String cancel = "Cancel";
  static final String login = "Login";
  static final String register = "Register";
  static final String resetPassword = "Reset";
  static final String save = "Save";
  static final String edit = "Edit";
  static final String logout = "Logout";


  static final String phoneNumber = "Phone Number";
  static final String password = "Password";
  static final String rePassword = "Re-password";

  static final String name = "Name";
  static final String email = "Email";
  static final String phone = "Phone";
  static final String address = "Address";

  static final String youHere = "You're here";

  static final String validate_NotEmpty = "This cannot be empty";


  static final double padding = 20;


  // Colors for theme
  static final Color lightPrimary = Color(0xffF4F4FA);
  static final Color darkPrimary = Colors.black;
  static final Color lightAccent = Color(0xffC9E289);
  static final Color lightImageBG = Color(0xffB6D2E2);
  static final Color darkAccent = Color(0xffFBC9A9);
  static final Color lightBG = Color(0xffE5E7F1);
  static final Color darkBG = Colors.black;

  static final ThemeData lightTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,

    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    accentColor: lightAccent,
    cursorColor: lightAccent,
    focusColor: lightImageBG,
    scaffoldBackgroundColor: lightBG,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        headline6: TextStyle(
          color: darkBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
//      iconTheme: IconThemeData(
//        color: lightAccent,
//      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,

    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    accentColor: darkAccent,
    scaffoldBackgroundColor: darkBG,
    cursorColor: darkAccent,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        headline6: TextStyle(
          color: lightBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
//      iconTheme: IconThemeData(
//        color: darkAccent,
//      ),
    ),
  );


}