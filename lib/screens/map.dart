import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kiuse/models/user.dart';
import 'package:kiuse/presenters/user_presenter.dart';
import 'package:kiuse/utils/constant.dart';
import 'package:kiuse/widgets/map_pin_pill.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final double CAMERA_ZOOM = 10;

  GoogleMapController _controller;
  Position _position = Position(latitude: 10.77, longitude: 106.7);
  CameraPosition _currentCameraPosition;
  final Map<String, Marker> _markers = {};

  bool _firstRun = false;

  bool _isPinShow = false;
  PinInformation _currentlySelectedPin = PinInformation(
    image: '',
    name: '',
    categories: [],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildMap(),
    );
  }

  @override
  void initState() {
    _getCurrentLocation();
    _currentCameraPosition = CameraPosition(
      target: LatLng(_position.latitude, _position.longitude),
      zoom: CAMERA_ZOOM,
    );
    super.initState();
  }

  void _getCurrentLocation() async {
    final Position res = await Geolocator().getCurrentPosition().catchError((e) => print(e));
    print(res.toJson());
    _firstRun = true;
    setState(() {
      _position = res;
    });
  }

  void _getDisplayLocations(List<User> users) async {
    print("Getting locations");
    _markers.clear();

    for (final u in users) {
      final marker = Marker(
        markerId: MarkerId(u.id),
        position: LatLng(u.latitude, u.longitude),
        infoWindow: InfoWindow(
          title: u.name,
          snippet: u.phone,
        ),
        onTap: () {
          setState(() {
            _currentlySelectedPin.name = u.name;
            _currentlySelectedPin.image = u.avatar;
            _currentlySelectedPin.categories = u.itemList.map((it) => it.category.name).toList();
            _isPinShow = true;
          });
        },
      );
      _markers[u.id] = marker;
    }
    _markers[Constants.youHere] = _getCurrentMarker();

    if (_firstRun) {
      _controller.animateCamera(
        CameraUpdate.newLatLng(LatLng(_position.latitude, _position.longitude)),
      );
      _firstRun = false;
    }
  }

  Widget _buildMap() {
    _getDisplayLocations(UserPresenter.getItemUserList());

    return Stack(children: <Widget>[
      GoogleMap(
        myLocationEnabled: true,
        compassEnabled: true,
        tiltGesturesEnabled: false,
        mapType: MapType.normal,
        markers: _markers.values.toSet(),
        initialCameraPosition: _currentCameraPosition,
        onMapCreated: (controller) => _controller = controller,
        onTap: (LatLng location) {
          print(location.latitude.toString() +
              "//" +
              location.longitude.toString());
          // May be will find the way here (){...}
          setState(() {
            _isPinShow = false;
          });
        },
      ),
      MapPinPillComponent(
        isShow: _isPinShow,
        currentlySelectedPin: _currentlySelectedPin,
      ),
    ]);
  }

  Marker _getCurrentMarker() {
    return Marker(
      markerId: MarkerId('you'),
      position: LatLng(_position.latitude, _position.longitude),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      infoWindow: InfoWindow(title: Constants.youHere),
      onTap: () => setState(() {
        _isPinShow = false;
      }),
    );
  }
}



    