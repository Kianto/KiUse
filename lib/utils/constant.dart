import 'package:flutter/material.dart';
class Constants{

  static final String appName = "DEMO";

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
  static final String email = "Email";
  static final String password = "Password";
  static final String rePassword = "Re-password";

  static final String name = "Name";

  static String msg_NoInternet = "No Internet";
  static String msg_ServerError = "Error from Server, try later";
  static String msg_Failure = "Request failed";


  static String validate_NotEmpty = "This cannot be empty";



  // Colors for theme
  static Color lightPrimary = Color(0xfffcfcff);
  static Color darkPrimary = Colors.black;
  static Color lightAccent = Colors.deepPurpleAccent;
  static Color darkAccent = Colors.deepPurpleAccent[400];
  static Color lightBG = Color(0xfffcfcff);
  static Color darkBG = Colors.black;
  static Color ratingBG = Colors.cyan[600];

  static ThemeData lightTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,

    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    accentColor: lightAccent,
    cursorColor: lightAccent,
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

  static ThemeData darkTheme = ThemeData(
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