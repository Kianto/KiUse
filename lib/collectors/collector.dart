import 'package:kiuse/models/entity.dart';

abstract class Collector {
  List<Entity> getList();
  List<Entity> getListBy(String key, dynamic value);
  Entity getById(String id);



}