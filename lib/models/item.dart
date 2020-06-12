import 'package:kiuse/models/category.dart';
import 'package:kiuse/models/entity.dart';

class Item extends Entity {
  Item(String id) : super(id);

  Category category;
  int quantity;

  int get totalPoint => quantity * category.point;

}