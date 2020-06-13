import 'package:kiuse/models/entity.dart';

abstract class Collector {
  List<Entity> getList();

  List<Entity> getListBy(String key, dynamic value) {
    if (null == key) return getList();

    var res = <Entity>[];

    for (var item in getList()) {
//      if (item.toJson()[key] is Entity) {
//        Entity en = item.toJson()[key];
//        if (en.id == value.toString()) {
//          res.add(item);
//        }
//
//      } else
      if (value == item.toJson()[key]) {
        res.add(item);
      }
    }

    return res;
  }


  Entity getById(String id) {
    if (null == id) return getList().first;
    else {
      for (var item in getList()) {
        if (id == item.id) {
          return item;
        }
      }
    }
    return null;
  }



}