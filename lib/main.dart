import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kiuse/collectors/user_collector.dart';
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
        '/home': (context) => HomeScreen(user: UserCollector.getSingletonUser()),

      },
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:kiuse/config/route.dart';
import 'package:kiuse/pages/mainPage.dart';
import 'package:kiuse/pages/item_detail.dart';
import 'package:kiuse/widgets/customRoute.dart';
import 'package:google_fonts/google_fonts.dart';

import 'src/themes/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce ',
      theme: AppTheme.lightTheme.copyWith(
        textTheme: GoogleFonts.muliTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: Routes.getRoute(),
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name.contains('detail')) {
          return CustomRoute<bool>(
              builder: (BuildContext context) => ProductDetailPage());
        } else {
          return CustomRoute<bool>(
              builder: (BuildContext context) => MainPage());
        }
      },
      initialRoute: "MainPage",
    );
  }
}

*/
