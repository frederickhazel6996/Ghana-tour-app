import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ExtraMap extends StatefulWidget {
  final double lat;
  final double lon;
  final String extraname;

  const ExtraMap({Key key, this.lat, this.lon, this.extraname})
      : super(key: key);

  @override
  _ExtraMapState createState() => _ExtraMapState();
}

class _ExtraMapState extends State<ExtraMap> {
  Completer<GoogleMapController> _controller = Completer();

  final Set<Marker> _markers = HashSet();

  MapType _currentMapType = MapType.normal;

  onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: onMapCreated,
      initialCameraPosition:
          CameraPosition(target: LatLng(widget.lat, widget.lon), zoom: 12),
      mapType: _currentMapType,
      markers: {
        Marker(
            markerId: MarkerId("V6gsadsa3"),
            position: LatLng(widget.lat, widget.lon),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose))
      },
    );
  }
}
