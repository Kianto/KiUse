import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kiuse/screens/home.dart';
import 'package:kiuse/screens/splash.dart';
import 'package:kiuse/utils/constant.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme: Constants.lightTheme,
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => HomeScreen(),

      },
    );
  }
}
