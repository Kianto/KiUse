import 'package:kiuse/collectors/collector.dart';
import 'package:kiuse/models/coupon.dart';
import 'package:kiuse/models/entity.dart';

class CouponCollector extends Collector {
  @override
  List<Entity> getList() {
    return [
      Coupon(
        id: '01',
        image: 'assets/images/gift_tea.png',
        point: 20,
        discount: 20,
        gift: 'Flower Tea',
        description: 'Valid for all kind of tea of the store.',
      ),
      Coupon(
        id: '02',
        image: 'assets/images/gift_tree.png',
        point: 50,
        discount: 100,
        gift: 'Little Tree',
        description: 'You can take 1 from 5 kind of small plant to grow.',
      ),
      Coupon(
        id: '03',
        image: 'assets/images/gift_jacket.png',
        point: 140,
        discount: 50,
        gift: 'Safe World Jacket',
        description: 'Valid for all jackets from KiNature brand.',
      ),
      Coupon(
        id: '04',
        image: 'assets/images/gift_milk_tea.png',
        point: 60,
        discount: 80,
        gift: 'Milk Tea',
        description: 'Valid for all kind of milk tea of the store.',
      ),
      Coupon(
        id: '05',
        image: 'assets/images/gift_hat.png',
        point: 20,
        discount: 200,
        gift: 'Natural Legend Hat',
        description: 'Valid for all hats from KiNature brand.',
      ),
    ];
  }

}