import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MyLocation extends StatefulWidget {
  const MyLocation({super.key});

  @override
  State<MyLocation> createState() => _MyLocationState();
}

class _MyLocationState extends State<MyLocation> {
  LocationData? _currentPosition;
  Location location = Location();
  LatLng _initialCameraPosition = LatLng(0.5937, 0.9629);
  GoogleMapController? _controller;
  Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};

  void _onMapCreated(GoogleMapController _cntlr) {
    _controller = _cntlr;
    location.onLocationChanged.listen((newLocation) {
      _controller!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target:
                LatLng(newLocation.latitude ?? 0, newLocation.longitude ?? 0),
            zoom: 15,
          ),
        ),
      );
    });
  }

  void setMarker(
      {required double originLatitude,
      required double originLongitude,
      required double destinationLatitude,
      required double destinationLongitude}) {
    final originMarker = Marker(
      markerId: const MarkerId('originMarker'),
      position: LatLng(originLatitude, originLongitude),
    );

    final destinationMarker = Marker(
      markerId: const MarkerId('destinationMarker'),
      position: LatLng(destinationLatitude, destinationLongitude),
    );

    setState(() {
      _markers[const MarkerId('originMarker')] = originMarker;
      _markers[const MarkerId('destinationMarker')] = destinationMarker;
    });

    _controller!.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(originLatitude, originLongitude),
          zoom: 15,
        ),
      ),
    );
  }

  getLoc() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _currentPosition = await location.getLocation();
    _initialCameraPosition = LatLng(
        _currentPosition!.latitude ?? 0, _currentPosition!.longitude ?? 0);

    location.onLocationChanged.listen((LocationData currentLocation) {
      setState(() {
        _currentPosition = currentLocation;
        _initialCameraPosition = LatLng(
            currentLocation.latitude ?? 0, currentLocation.longitude ?? 0);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getLoc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Driver Assigned'),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _initialCameraPosition,
              zoom: 15,
            ),
            mapType: MapType.normal,
            onMapCreated: _onMapCreated,
            myLocationEnabled: true,
            markers: _markers.values.toSet(),
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: const <Widget>[
                    Material(
                      elevation: 20.0,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter the departure place?',
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.only(left: 15.0, top: 15.0),
                          prefixIcon: IconButton(
                            icon: Icon(Icons.search),
                            iconSize: 30.0,
                            onPressed: null,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
