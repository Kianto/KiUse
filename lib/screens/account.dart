import 'package:flutter/material.dart';
import 'package:kiuse/models/user.dart';
import 'package:kiuse/utils/constant.dart';

class AccountScreen extends StatefulWidget {
  AccountScreen({Key key, @required this.user}) : super(key: key);

  final User user;

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {

  final formKey = GlobalKey<FormState>();

  User get user => widget.user;
  
  bool isOnEditingInfo = false;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: _buildListInfo(),
    );
  }

  Widget _buildListInfo() {
    Widget listInfo = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildHeaderInfo(),
        Divider(),
        SizedBox(height: 16.0),

        Padding(
          padding: EdgeInsets.all(5.0),
          child: Text(
            Constants.title_AccountInfo.toUpperCase(),
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        isOnEditingInfo
            ? _buildItemEditor(
          title: Constants.name,
          validateWarn: Constants.validate_NotEmpty,
          initVal: user.name,
          onSaved: (val) => user.name = val,
          hasTrail: true,
          icon: Icon(Icons.assignment_ind),
        )
            : _buildItemInfo(Constants.name, user.name, true),
        SizedBox(height: isOnEditingInfo ? 12.0 : 0),

        isOnEditingInfo
            ? _buildItemEditor(
          title: Constants.email,
          validateWarn: Constants.validate_NotEmpty,
          initVal: user.email,
          onSaved: (val) => user.email = val,
          hasTrail: false,
          icon: Icon(Icons.email),
        )
            : _buildItemInfo(Constants.email, user.email, false),
        SizedBox(height: isOnEditingInfo ? 12.0 : 0),

        isOnEditingInfo
            ? _buildItemEditor(
          title: Constants.phone,
          validateWarn: Constants.validate_NotEmpty,
          initVal: user.phone,
          onSaved: (val) => user.phone = val,
          hasTrail: false,
          icon: Icon(Icons.phone),
        )
            : _buildItemInfo(Constants.phone, user.phone, false),
        SizedBox(height: isOnEditingInfo ? 12.0 : 0),

        isOnEditingInfo
            ? _buildItemEditor(
          title: Constants.address,
          validateWarn: Constants.validate_NotEmpty,
          initVal: user.address,
          onSaved: (val) => user.address = val,
          hasTrail: false,
          icon: Icon(Icons.add_location),
        )
            : _buildItemInfo(Constants.address, user.address, false),
        SizedBox(height: isOnEditingInfo ? 12.0 : 0),

        Divider(color: Theme.of(context).accentColor),
        SizedBox(height: 16.0),
      ],
    );

    return Form(
      key: formKey,
      child: Theme(
          data: Theme.of(context).copyWith(primaryColor: Colors.green,),
          child: listInfo
      ),
    );
  }

  ListTile _buildItemInfo(String title, String content, bool hasTrail) {
    return ListTile(
      title: Text(title,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w700,
        ),
      ),

      subtitle: Text(content),

      trailing: hasTrail ? IconButton(
        icon: Icon(Icons.edit, size: 20.0),
        onPressed: () => _onEditChange(true),
        tooltip: Constants.edit,
      ) : null,
    );
  }

  Widget _buildItemEditor({
    String title,
    Icon icon,
    String validateWarn,
    String initVal,
    bool hasTrail,
    Function(String) onSaved,
  }) {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextFormField(
            style: TextStyle(fontSize: 16),
            decoration: InputDecoration(
              icon: icon,
              labelText: title,
              labelStyle: TextStyle(fontSize: 16),
            ),
            validator: (val) => val.trim().isEmpty
                ? validateWarn
                : null,
            initialValue: initVal,
            onSaved: onSaved,
          ),
        ),

        hasTrail ? IconButton(
          icon: Icon(Icons.cancel, size: 20.0, color: Colors.red),
          onPressed: () => _onEditChange(false),
          tooltip: Constants.cancel,
        ) : SizedBox(),
        hasTrail ? IconButton(
          icon: Icon(Icons.save, size: 20.0, color: Colors.lightBlueAccent),
          onPressed: _onSubmitUpdateInfo,
          tooltip: Constants.save,
        ) : SizedBox(),
      ],
    );
  }

  void _onSubmitUpdateInfo() async {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();

      _onEditChange(false);
    }
  }

  void _onEditChange(bool turnOn) {
    setState(() {
      isOnEditingInfo = turnOn;
    });
  }

  Widget _buildHeaderInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(10.0, 5.0, 1.0, 0.0),
          child: Image.asset(
            user.avatar,
            width: 100.0,
            height: 100.0,
            fit: BoxFit.cover,
          ),
        ),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    user.name,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Point: ${user.point}',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () => _logout(),
                    child: Text(
                      Constants.logout,
                      style: TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).accentColor.withRed(0),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),

            ],
          ),
          flex: 3,
        ),
      ],
    );
  }



  void _logout() {

  }

}
    