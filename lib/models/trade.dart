import 'package:kiuse/models/entity.dart';

import 'item.dart';

class Trade extends Entity {
  Trade({
    String id,
    this.ownerId,
    this.ownerName,
    this.item,
    this.takerId,
    this.takerName,
    this.isSuccessful = true,
    this.isExchanged = true,
  }) : super(id);

  Item item;
  String takerId;
  String takerName;
  String ownerId;
  String ownerName;

  bool isExchanged;
  bool isSuccessful;

  int get point => item.totalPoint;

}