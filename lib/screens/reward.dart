import 'package:flutter/material.dart';
import 'package:kiuse/collectors/coupon_collector.dart';
import 'package:kiuse/models/coupon.dart';
import 'package:kiuse/models/user.dart';
import 'package:kiuse/themes/light_color.dart';
import 'package:kiuse/utils/constant.dart';
import 'package:kiuse/widgets/title_text.dart';

class RewardScreen extends StatefulWidget {
  RewardScreen({Key key, @required this.user}) : super(key: key);

  final User user;

  @override
  _RewardScreenState createState() => _RewardScreenState();
}

class _RewardScreenState extends State<RewardScreen> {

  Widget _buildCoupons() {
    return Column(children: CouponCollector().getList().map((x) => _buildItemCoupon(x)).toList());
  }

  Widget _buildItemCoupon(Coupon model) {
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
                  child: Image.asset(model.image, fit: BoxFit.fill,),
                )
              ],
            ),
          ),
          Expanded(
            child: ListTile(
                title: TitleText(
                  text: model.gift,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
                subtitle: Row(
                  children: <Widget>[
                    TitleText(
                      text: '\$ ',
                      color: LightColor.red,
                      fontSize: 12,
                    ),
                    TitleText(
                      text: model.discountPercent,
                      fontSize: 14,
                    ),
                  ],
                ),
                trailing: Container(
                  width: 35,
                  height: 35,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: widget.user.point < model.point
                      ? Theme.of(context).focusColor
                      : Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: widget.user.point < model.point
                      ? null
                      : [
                      BoxShadow(
                        color: Theme.of(context).accentColor,
                        blurRadius: 25.0, // soften the shadow
                        spreadRadius: 2.0, // extend the shadow
                        offset: Offset(
                          -5.0, // Move to left 5  horizontally
                          -5.0, // Move to top 5 vertically
                        ),
                      )
                    ],
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
            children: <Widget>[
              SizedBox(height: 20),
              _buildCoupons(),
              Divider(
                thickness: 1,
                height: 70,
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
    