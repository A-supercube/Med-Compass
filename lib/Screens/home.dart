import 'package:flutter/material.dart';
import 'package:location/location.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Location location = Location();
  late LocationData locationData;

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    
    locationData = await location.getLocation();
    setState(() {
      // Trigger a rebuild with the updated locationData
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: locationData != null
            ? Column(
                children: [
                  Text('Longitude: ${locationData.longitude}'),
                  Text('Latitude: ${locationData.latitude}'),

                ],
              )
            : 
      ),
    );
  }
}
