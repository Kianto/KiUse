import 'package:kiuse/collectors/category_collector.dart';
import 'package:kiuse/collectors/collector.dart';
import 'package:kiuse/collectors/user_collector.dart';
import 'package:kiuse/models/entity.dart';
import 'package:kiuse/models/item.dart';
import 'package:kiuse/models/trade.dart';
import 'package:kiuse/models/user.dart';

class TradeCollector extends Collector {
  @override
  List<Entity> getList() {
    return [
      Trade(
        id: '01',
        takerId: UserCollector.getSingletonUser().id,
        takerName: UserCollector.getSingletonUser().name,
        ownerId: UserCollector().getList().last.id,
        ownerName: (UserCollector().getList().last as User).name,
        item: Item(
          id: '315',
          quantity: 5,
          category: CategoryCollector().getList().last,
        )
      ),
      Trade(
          id: '02',
          takerId: UserCollector.getSingletonUser().id,
          takerName: UserCollector.getSingletonUser().name,
          ownerId: UserCollector().getList().last.id,
          ownerName: (UserCollector().getList().last as User).name,
          item: Item(
            id: '315',
            quantity: 2,
            category: CategoryCollector().getList().elementAt(1),
          )
      ),
    ];
  }

}