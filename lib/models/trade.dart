import 'package:kiuse/models/entity.dart';

import 'item.dart';

class Trade extends Entity {
  Trade(String id) : super(id);

  Item item;
  String takerId;
  String ownerId;

  bool isExchanged;
  bool isSuccessful;

  int get point => item.totalPoint;

}