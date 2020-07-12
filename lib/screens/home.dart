import 'package:flutter/material.dart';
import 'package:kiuse/models/user.dart';
import 'package:kiuse/themes/light_color.dart';
import 'package:kiuse/themes/theme.dart';
import 'package:kiuse/widgets/bottom_bar/bottom_navigation_bar.dart';
import 'package:kiuse/widgets/title_text.dart';

import 'account.dart';
import 'exchange.dart';
import 'map.dart';
import 'recycle.dart';
import 'reward.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, @required this.user}) : super (key: key);

  final User user;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget bodyScreen;

  @override
  void initState() {
    super.initState();

    bodyScreen = AccountScreen(user: widget.user);
  }

  Widget _appBar() {
    return Container(
      padding: AppTheme.padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _title(),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(13)),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Color(0xfff8f8f8),
                    blurRadius: 10,
                    spreadRadius: 10
                  ),
                ],
              ),
              child: Image.asset(
                widget.user.avatar,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _icon(IconData icon, {Color color = LightColor.iconColor}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(13)),
        color: Theme.of(context).backgroundColor,
        boxShadow: AppTheme.shadow,
      ),
      child: Icon(
        icon,
        color: color,
      ),
    );
  }

  Widget _title() {
    return Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.local_florist,
              color: Theme.of(context).accentColor.withRed(0),
              size: 36,
            ),
            SizedBox(width: 16),
            TitleText(
              text: '${widget.user.point}',
              fontSize: 27,
              fontWeight: FontWeight.w700,
            ),

          ],
        ));
  }

  void onBottomIconPressed(int index) {
    switch (index) {
      case 0:
        if (bodyScreen is! AccountScreen) {
          setState(() {
            bodyScreen = AccountScreen(user: widget.user);
          });
        }
        break;
      case 1:
        if (bodyScreen is! RewardScreen) {
          setState(() {
            bodyScreen = RewardScreen(user: widget.user);
          });
        }
        break;
      case 2:
        if (bodyScreen is! RecycleScreen) {
          setState(() {
            bodyScreen = RecycleScreen();
          });
        }
        break;
      case 3:
        if (bodyScreen is! MapScreen) {
          setState(() {
            bodyScreen = MapScreen();
          });
        }
        break;
      case 4:
        if (bodyScreen is! ExchangeScreen) {
          setState(() {
            bodyScreen = ExchangeScreen(user: widget.user,);
          });
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              child: Container(
                height: AppTheme.fullHeight(context) - 50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xfffbfbfb),
                      Color(0xfff7f7f7),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _appBar(),
                    Expanded(
                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        switchInCurve: Curves.easeInToLinear,
                        switchOutCurve: Curves.easeOutBack,
                        child: bodyScreen,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Custombottom_bar(
                icons: [
                  Icons.account_circle,
                  Icons.card_giftcard,
                  Icons.autorenew,
                  Icons.map,
                  Icons.group_work,
                ],
                onIconPresedCallback: onBottomIconPressed,
              ),

            )
          ],
        ),
      ),
    );
  }

/*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.appName),
        backgroundColor: Colors.blueGrey,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            color: Colors.white,
            onPressed: () {},
          ),
          SizedBox(width: 8),
        ],
      ),

      drawer: Drawer(
        child: Column(
            children: [
              Container(
                width: double.infinity,
                color: Colors.blueGrey,
                child: DrawerHeader(
                  child: Center(
                      child: Text(Constants.appName, style: Theme.of(context).textTheme.headline5)
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.account_circle),
                      title: Text("Personal"),
                    ),
                    ListTile(
                      leading: Icon(Icons.map),
                      title: Text("Map"),
                    ),
                    ListTile(
                      leading: Icon(Icons.card_giftcard),
                      title: Text("Reward"),
                    ),
                    ListTile(
                      leading: Icon(Icons.group_work),
                      title: Text("Real map"),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.reply),
                title: Text("Sign out"),
              ),
            ]
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '1000',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),

      bottom_bar: BottomAppBar(
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(width: 8),
            IconButton(
              icon: Icon(Icons.account_circle),
              color: Colors.white,
              onPressed: () {},
            ),
            SizedBox(width: 8),
            IconButton(
              icon: Icon(Icons.map),
              color: Colors.white,
              onPressed: () {},
            ),
            SizedBox(width: 8),
            IconButton(
              icon: Icon(Icons.card_giftcard),
              color: Colors.white,
              onPressed: () {},
            ),
            SizedBox(width: 8),
            IconButton(
              icon: Icon(Icons.group_work),
              color: Colors.white,
              onPressed: () {},
            ),
          ],
        ),
        shape: CircularNotchedRectangle(),
        color: Colors.blueGrey,
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        onPressed: () {},
        child: Icon(Icons.autorenew),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
*/

}
