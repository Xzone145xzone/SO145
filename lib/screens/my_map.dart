import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyMap extends StatefulWidget {
  @override
  _MyMapState createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  //explicit
  static const LatLng ssruLatLng = const LatLng(13.775947, 100.508310);
  CameraPosition camaraPosition = CameraPosition(
    target: ssruLatLng,
    zoom: 16.0,
  );

  // Method
  Set<Marker> myMarker() {
    return <Marker>[
      Marker(
        position: ssruLatLng,
        markerId: MarkerId('idSSRU'),
      ),
    ].toSet();
  }

  Widget showMap() {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: camaraPosition,
      onMapCreated: (GoogleMapController googleMapController) {},
      markers: myMarker(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return showMap();
  }
}
