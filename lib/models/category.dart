import 'package:kiuse/models/entity.dart';

class Category extends Entity {
  Category({String id, this.name, this.point, this.image, this.icon, this.marker, this.unit}) : super(id);

  String name;
  String icon;
  String image;
  String marker;
  String unit;

  int point;

}