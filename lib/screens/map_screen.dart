import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../providers/event_provider.dart';
import '../services/location_service.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;
  Set<Marker> markers = {};
  Position? _currentPosition;

  static const CameraPosition _defaultLocation = CameraPosition(
    target: LatLng(41.9961, 21.4316),
    zoom: 14.0,
  );

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition();
      setState(() {
        _currentPosition = position;
        _addMarker(position.latitude, position.longitude, "Current Location");
      });
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  void _addMarker(double lat, double lng, String title) {
    markers.add(
      Marker(
        markerId: MarkerId(title),
        position: LatLng(lat, lng),
        infoWindow: InfoWindow(title: title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exam Locations')),
      body: GoogleMap(
        initialCameraPosition: _defaultLocation,
        onMapCreated: (GoogleMapController controller) {
          setState(() {
            mapController = controller;
          });
        },
        markers: markers,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );
  }
}