import 'package:kiuse/collectors/collector.dart';
import 'package:kiuse/models/entity.dart';
import 'package:kiuse/models/user.dart';

class UserCollector extends Collector {
  @override
  Entity getById(String id) {
    if (null == id) return getList().first;
    else {
      for (var user in getList()) {
        if (id == user.id) {
          return user;
        }
      }
    }
    return null;
  }

  @override
  List<Entity> getList() {
    return [
      User('00001'),
    ];
  }

  @override
  List<Entity> getListBy(String key, value) {
    var res = <Entity>[];

    for (var user in getList()) {
      if (value == user.toJson()[key]) {
        res.add(user);
      }
    }

    return res;
  }



}