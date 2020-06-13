import 'package:kiuse/collectors/category_collector.dart';
import 'package:kiuse/collectors/collector.dart';
import 'package:kiuse/models/entity.dart';
import 'package:kiuse/models/item.dart';

class ItemCollector extends Collector {
  @override
  List<Entity> getList() {
    return [
      Item(
        id: '9001',
        ownerId: '0674501',
        quantity: 50,
        category: CategoryCollector().getList().first,
        description: 'Have a lot of blank papers.',
      ),
      Item(
        id: '9087',
        ownerId: '0674501',
        quantity: 89,
        category: CategoryCollector().getList().last,
        description: 'Some usable.',
      ),
      Item(
        id: '9099',
        ownerId: '0674501',
        quantity: 36,
        category: CategoryCollector().getById('030'),
        description: 'Some usable.',
      ),
      Item(
        id: '9588',
        ownerId: '0804768',
        quantity: 80,
        category: CategoryCollector().getById('176'),
        description: 'Some usable.',
      ),
      Item(
        id: '9230',
        ownerId: '0804768',
        quantity: 43,
        category: CategoryCollector().getList().last,
        description: 'Some usable.',
      ),
      Item(
        id: '9050',
        ownerId: '0804768',
        quantity: 70,
        category: CategoryCollector().getList().first,
        description: 'Some usable.',
      ),
    ];
  }

  @override
  List<Entity> getListBy(String key, dynamic value) {
    if (null == key || null == value) return getList();

    var res = <Entity>[];

    for (var item in getList()) {
      if (key == 'category') {
        Item it = item;
        if (it.category.id == value.toString()) {
          res.add(item);
        }

      } else if (value == item.toJson()[key]) {
        res.add(item);
      }
    }

    return res;
  }

}