import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kiuse/collectors/collector.dart';
import 'package:kiuse/models/entity.dart';
import 'package:kiuse/models/user.dart';

class UserCollector extends Collector {

  @override
  List<Entity> getList() {
    return [
      User(
        id: '00001',
        name: 'John Valask',
        phone: '0807060504',
        address: '34 Heaven Street, Sky City',
        email: 'john@email.com',
        point: 90,
        avatar: 'assets/images/user1.png',
        location: LatLng(10.1, 106),
      ),
      User(
        id: '0674501',
        name: 'Emin Polva',
        phone: '0838746554',
        address: '98/2 Poleany Street, Kantasy City',
        email: 'emipo@email.com',
        point: 130,
        avatar: 'assets/images/user2.png',
        location: LatLng(10.7, 106.5),
      ),
      User(
        id: '0804768',
        name: 'Helmy Falcon',
        phone: '0538755553',
        address: '125 Kylvan Noti Street, Kantasy City',
        email: 'helmfa@email.com',
        point: 15,
        avatar: 'assets/images/user3.png',
        location: LatLng(10.78, 106.674),
      ),
    ];
  }

  static User getSingletonUser() {
    if (null == _user) {
      _user = UserCollector().getList().first;
    }
    return _user;
  }

  static User _user;


}