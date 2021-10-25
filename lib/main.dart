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

  late GoogleMapController _mapController;
  late BitmapDescriptor _markerIcon;

  _onMapCreated(GoogleMapController controller) {
    _mapController = controller;

    setState(() {
      allMarkers.add(Marker(
        markerId: const MarkerId('Erhvervsakademi Aarhus'),
        infoWindow: const InfoWindow(
            title: 'ErhvervsAkademi Aarhus',
            snippet: 'Et godt sted at blive undervist i Mobile'),
        draggable: false,
        icon: _markerIcon,
        position: const LatLng(56.119657, 10.158651),
        onTap: () {},
      ));
    });
  }

  @override
  void initState() {
    super.initState();
    _setMarkerIcon();
  }

  _setMarkerIcon() async {
    _markerIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), 'assets/rocket.png');
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      mapType: MapType.hybrid,
      initialCameraPosition: const CameraPosition(
        target: LatLng(56.119657, 10.158651),
        zoom: 16,
      ),
      markers: Set.from(allMarkers),
    );
  }
}
