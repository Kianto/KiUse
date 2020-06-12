import 'dart:html';

import 'package:kiuse/models/entity.dart';

class User extends Entity {
  User(String id) : super(id);

  String name;
  int point;
  String email;
  String phone;
  String address;
  Geolocation location;

}