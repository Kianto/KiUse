import 'package:kiuse/models/entity.dart';

class Coupon extends Entity {
  Coupon(String id) : super(id);

  String gift;
  String image;
  int point;
  int discount; // %
  String description;

  String get discountPercent =>
      100 > discount ? '$discount %'
        : 100 == discount ? 'Free'
          : 200 == discount ? 'Mua 1 tặng 1' : 'Chương trình nhận quà tại điểm';


}