import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kiuse/collectors/category_collector.dart';
import 'package:kiuse/collectors/item_collector.dart';
import 'package:kiuse/models/category.dart';
import 'file:///C:/Users/Kien/Workspace/mobile_projects/kiuse/lib/screens/item_detail.dart';
import 'package:kiuse/themes/light_color.dart';
import 'package:kiuse/themes/theme.dart';
import 'package:kiuse/widgets/item_card.dart';
import 'package:kiuse/widgets/item_icon.dart';

class RecycleScreen extends StatefulWidget {
  @override
  _RecycleScreenState createState() => _RecycleScreenState();
}

class _RecycleScreenState extends State<RecycleScreen> {

  String selectingCategory;

  Widget _icon(IconData icon, {Color color = LightColor.iconColor}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(13)),
          color: Theme.of(context).backgroundColor,
          boxShadow: AppTheme.shadow),
      child: Icon(
        icon,
        color: color,
      ),
    );
  }

  Widget _categoryWidget() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: AppTheme.fullWidth(context),
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
         ProductIcon(
              model: Category(id: '315', name: 'All'),
              onSelected: (model) {
                setState(() {
                  selectingCategory = null;
                });
              },
              isSelected: selectingCategory == null
          )
        ]..addAll(
            CategoryCollector().getList().map((category) => ProductIcon(
              model: category,
              onSelected: (model) {
                setState(() {
                  selectingCategory = model.id;
                });
              },
              isSelected: selectingCategory == category.id
            ))
                .toList()
        ),

      ),
    );
  }

  Widget _itemWidget() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: AppTheme.fullWidth(context),
      height: AppTheme.fullWidth(context),
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 5 / 2,
            mainAxisSpacing: 30,
            crossAxisSpacing: 20
        ),
        padding: EdgeInsets.only(left: 20),
        scrollDirection: Axis.horizontal,
        children: ItemCollector().getListBy('category', selectingCategory)
            .map(
              (item) => ItemCard(
              item: item,
              onSelected: (item) => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context){
                    return ProductDetailPage(item: item);
                  },
                ),
              )
          ),
        )
            .toList(),
      ),
    );
  }

  Widget _search() {
    return Container(
      margin: AppTheme.padding,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: LightColor.lightGrey.withAlpha(100),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search Products",
                    hintStyle: TextStyle(fontSize: 12),
                    contentPadding:
                    EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 5),
                    prefixIcon: Icon(Icons.search, color: Colors.black54)),
              ),
            ),
          ),
          SizedBox(width: 20),
          _icon(Icons.filter_list, color: Colors.black54)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        dragStartBehavior: DragStartBehavior.down,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
//            _search(),
            _categoryWidget(),
            _itemWidget(),
          ],
        ),
      ),
    );
  }

}
    