import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MaterialApp(title: 'Maps demo', home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Marker> allMarkers = [];
  

  @override
  void initState() {
    allMarkers.add(
      Marker(
        markerId: const MarkerId('Erhvervsakademi Aarhus'),
        infoWindow: const InfoWindow(title: 'ErhvervsAkademi Aarhus'),
        draggable: false,
        position: const LatLng(56.119657, 10.158651),
        onTap: () {},
      ),
    );
    allMarkers.add(Marker(
      markerId: const MarkerId('Erhvervsakademi'),
      draggable: false,
      position: const LatLng(52.119657, 11.158651),
      onTap: () {},
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.hybrid,
      initialCameraPosition: const CameraPosition(
        target: LatLng(46.119657, 5.158651),
        zoom: 17,
      ),
      markers: Set.from(allMarkers),
    );
  }
}
