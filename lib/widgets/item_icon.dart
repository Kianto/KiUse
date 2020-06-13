import 'package:flutter/material.dart';
import 'package:kiuse/models/category.dart';
import 'package:kiuse/themes/light_color.dart';
import 'package:kiuse/themes/theme.dart';
import 'package:kiuse/widgets/title_text.dart';
import 'package:kiuse/widgets/extentions.dart';

class ProductIcon extends StatelessWidget {
  final ValueChanged<Category> onSelected;
  final Category model;
  final bool isSelected;

  ProductIcon({Key key, this.model, this.isSelected, this.onSelected}) : super(key: key);

  Widget build(BuildContext context) {
    return model.id == null
        ? Container(width: 5)
        : Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Container(
              padding: AppTheme.hPadding,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: isSelected
                    ? Theme.of(context).focusColor
                    : Colors.transparent,
                border: Border.all(
                  color: isSelected ? LightColor.orange : LightColor.grey,
                  width: isSelected ? 2 : 1,
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: isSelected ? Theme.of(context).primaryColor : Colors.white,
                    blurRadius: 10,
                    spreadRadius: 5,
                    offset: Offset(5, 5),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  model.icon != null ? Image.asset(model.icon) : SizedBox(),
                  model.name == null
                      ? Container()
                      : Container(
                          child: TitleText(
                            text: model.name,
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        )
                ],
              ),
            ).ripple(
              () {
                onSelected(model);
              },
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          );
  }
}
