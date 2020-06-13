import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kiuse/models/entity.dart';
import 'package:kiuse/models/item.dart';

class User extends Entity {
  User({
    String id,
    this.name,
    this.point,
    this.address,
    this.email,
    this.location,
    this.phone,
    this.avatar,
    this.itemList,
  }) : super(id);

  String name;
  String avatar;
  String email;
  String phone;
  String address;
  LatLng location;

  int point;
  List<Item> itemList;

  double get latitude => location.latitude;
  double get longitude => location.longitude;

}

