import 'package:kiuse/collectors/item_collector.dart';
import 'package:kiuse/collectors/user_collector.dart';
import 'package:kiuse/models/item.dart';
import 'package:kiuse/models/user.dart';

class UserPresenter {

  static List<User> getItemUserList({String category}) {
    var res = <User>[];

    var temp = UserCollector().getList();
    for (User i in temp) {
       i.itemList = ItemCollector().getListBy('ownerId', i.id).map((e) {
         Item it = e;
         return it;
       }).toList();
    }

    return res;
  }

}