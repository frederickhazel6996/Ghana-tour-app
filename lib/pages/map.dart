import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ghana_tour/extras/resource.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GhanaMap extends StatefulWidget {
  GhanaMap({Key key}) : super(key: key);

  @override
  _GhanaMapState createState() => _GhanaMapState();
}

class _GhanaMapState extends State<GhanaMap> {
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(7.9527706, -1.0307118);
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;

  onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: AppBar(
            backgroundColor: ghanaExtra,
            elevation: 0,
          ),
        ),
        body: GoogleMap(
          onMapCreated: onMapCreated,
          initialCameraPosition: CameraPosition(target: _center, zoom: 7),
          mapType: _currentMapType,
          markers: _markers,
          onCameraMove: onCameraMove,
        ));
  }
}
