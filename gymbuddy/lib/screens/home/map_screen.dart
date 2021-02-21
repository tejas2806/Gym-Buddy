import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gymbuddy/models/person.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  final Person person;
  _MapScreenState({this.person});

  Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(
          Marker(markerId: MarkerId('id-1'), position: LatLng(person.latitude, person.longitude))
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Current Location'),
        backgroundColor: Colors.blueAccent,
        elevation: 0.0,
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        markers: _markers,
        initialCameraPosition: CameraPosition(target: LatLng(person.latitude, person.longitude), zoom: 15),
      ),
    );
  }
}
