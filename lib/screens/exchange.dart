import 'package:flutter/material.dart';
import 'package:kiuse/collectors/trade_collector.dart';
import 'package:kiuse/models/trade.dart';
import 'package:kiuse/models/user.dart';
import 'package:kiuse/utils/constant.dart';
import 'package:kiuse/widgets/title_text.dart';

class ExchangeScreen extends StatefulWidget {
  ExchangeScreen({Key key, @required this.user}) : super(key: key);

  final User user;

  @override
  _ExchangeScreenState createState() => _ExchangeScreenState();
}

class _ExchangeScreenState extends State<ExchangeScreen> {
  Widget _cartItems() {
    return Column(
      children: TradeCollector().getList().map((x) => _item(x)).toList()
    );
  }

  Widget _item(Trade model) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      height: 80,
      child: Row(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1.2,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    height: 70,
                    width: 70,
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Theme.of(context).focusColor,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  child: Image.asset(model.item.icon, fit: BoxFit.fill,),
                )
              ],
            ),
          ),
          Expanded(
              child: ListTile(
                  title: TitleText(
                    text: model.ownerName,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                  subtitle: TitleText(
                        text: model.item.amount,
                        fontSize: 14,
                  ),
                  trailing: Container(
                    width: 35,
                    height: 35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TitleText(
                      text: '${model.point}',
                      fontSize: 12,
                    ),
                  )
              )
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Constants.padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20),
              Text(
                'Exchange history',
                  style: Theme.of(context).textTheme.headline5,
              ),
              Divider(),
              SizedBox(height: 20),
              _cartItems(),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

}
    