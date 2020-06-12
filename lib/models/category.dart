import 'package:kiuse/models/entity.dart';

class Category extends Entity {
  Category(String id) : super(id);

  String name;
  String icon;
  String marker;
  String unit;

  int point;

}