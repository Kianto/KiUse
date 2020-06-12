///
/// abstract model class for all model data containers to follow
///

abstract class Entity {

  Entity(this.id);

  Entity.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];

    this.isDelete = json['isDelete'];
    this.createTime = json['createTime'];
    this.updateTime = json['updateTime'];
  }

  String id;

  bool isDelete;
  DateTime createTime;
  DateTime updateTime;


  Map<String, dynamic> toJson() {
    final res = Map<String, dynamic>();

    isDelete ??= false;
    createTime ??= DateTime.now();
    updateTime = DateTime.now();

    res['isDelete'] = isDelete;
    res['createTime'] = createTime;
    res['updateTime'] = updateTime;

    return res;
  }

}