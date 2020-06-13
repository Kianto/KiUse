import 'package:flutter/material.dart';
import 'package:kiuse/models/item.dart';
import 'package:kiuse/themes/light_color.dart';
import 'package:kiuse/widgets/title_text.dart';
import 'package:kiuse/widgets/extentions.dart';

class ItemCard extends StatelessWidget {
  final Item item;
  final ValueChanged<Item> onSelected;
  ItemCard({Key key, this.item, this.onSelected}) : super(key: key);

//   @override
//   _ItemCardState createState() => _ItemCardState();
// }

// class _ItemCardState extends State<ItemCard> {
//   Item item;
//   @override
//   void initState() {
//     item = widget.item;
//     super.initState();
//   }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: LightColor.background,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(color: Color(0xfff8f8f8), blurRadius: 15, spreadRadius: 10),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: LightColor.orange.withAlpha(40),
                    ),
                    Image.asset(item.image)
                  ],
                ),
                // SizedBox(height: 5),
//                TitleText(
//                  text: item.name,
//                  fontSize: 14,
//                ),
                TitleText(
                  text: item.amount,
                  fontSize: 12,
                  color: LightColor.orange,
                ),
                TitleText(
                  text: item.totalPoint.toString(),
                  fontSize: 16,
                  color: Theme.of(context).accentColor.withRed(0),
                ),
              ],
            ),
          ],
        ),
      ).ripple(() {
//        Navigator.of(context).pushNamed('/detail');
        onSelected(item);
      }, borderRadius: BorderRadius.all(Radius.circular(20))),
    );
  }
}
