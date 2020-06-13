import 'package:kiuse/models/entity.dart';

class Coupon extends Entity {
  Coupon({String id, this.point, this.discount, this.description, this.gift, this.image}) : super(id);

  String gift;
  String image;
  int point;
  int discount; // %
  String description;

  String get discountPercent =>
      100 > discount ? '$discount %'
        : 100 == discount ? 'Free'
          : 200 == discount ? 'Buy 1 get 1 free' : 'Receive a special gift at KiUse';


}