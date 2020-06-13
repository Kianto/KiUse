import 'package:kiuse/collectors/collector.dart';
import 'package:kiuse/models/category.dart';
import 'package:kiuse/models/entity.dart';

class CategoryCollector extends Collector {

  @override
  List<Entity> getList() {
    return [
      Category(
        id: '098',
        name: 'paper',
        icon: 'assets/images/ca_paper.png',
        image: 'assets/images/re_paper.png',
        point: 3,
        unit: 'kg',
        marker: 'assets/images/marker.png'
      ),
      Category(
          id: '030',
          name: 'glass',
          icon: 'assets/images/ca_glass.png',
          image: 'assets/images/re_glass.png',
          point: 4,
          unit: 'kg',
          marker: 'assets/images/marker.png'
      ),
      Category(
          id: '176',
          name: 'plastic',
          icon: 'assets/images/ca_plastic.png',
          image: 'assets/images/re_plastic.png',
          point: 6,
          unit: 'kg',
          marker: 'assets/images/marker.png'
      ),
      Category(
          id: '540',
          name: 'metal',
          icon: 'assets/images/ca_metal.png',
          image: 'assets/images/re_metal.png',
          point: 8,
          unit: 'kg',
          marker: 'assets/images/marker.png'
      ),
    ];
  }

}