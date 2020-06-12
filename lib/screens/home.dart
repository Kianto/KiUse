import 'package:flutter/material.dart';
import 'package:kiuse/utils/constant.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;

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

      bottomNavigationBar: BottomAppBar(
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


}
