import 'package:kiuse/models/category.dart';
import 'package:kiuse/models/entity.dart';
import 'package:kiuse/models/user.dart';

class Item extends Entity {
  Item({String id, this.category, this.quantity, this.ownerId, this.description}) : super(id);

  String ownerId;
  Category category;
  int quantity;
  String description;

  String get name => category.name;
  String get icon => category.icon;
  String get image => category.image;

  int get totalPoint => quantity * category.point;
  String get amount => '$quantity ' + category.unit;

  @override
  Map<String, dynamic> toJson() {
    var map = super.toJson();

    map['ownerId'] = ownerId;
    map['quantity'] = quantity;
    map['description'] = description;
    map['category'] = category.toJson();

    return map;
  }

}


