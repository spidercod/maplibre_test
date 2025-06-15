import 'package:flutter/material.dart';
import 'package:maplibre_gl/maplibre_gl.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key); // Accept and pass the key

  @override
  State<MapScreen> createState() => MapScreenState(); // Public State class
}

class MapScreenState extends State<MapScreen> { // Made public
  MapLibreMapController? mapController;

  @override
  void initState() {
    super.initState();
  }

  void _onMapCreated(MapLibreMapController controller) {
    mapController = controller;
  }

  void _onStyleLoaded() {
    // You can add a log or print statement here to confirm style loading
    print('Style loaded');
  }

  // Public method to animate camera
  void animateToLocation(LatLng target) {
    mapController?.animateCamera(
      CameraUpdate.newLatLngZoom(target, 14.0), // Zoom level can be adjusted
    );
  }

  @override
  Widget build(BuildContext context) {
    // The Scaffold and AppBar were part of the example, but for a screen
    // that's embedded in another Scaffold (like in main.dart), it might
    // not need its own Scaffold/AppBar.
    // For now, keeping it as is, but this could be refactored.
    return Scaffold(
      appBar: AppBar(
        title: const Text('MapLibre GL'),
      ),
      body: MapLibreMap(
        styleString: 'https://map.witel.ir/styles/bright/style.json',
        initialCameraPosition: const CameraPosition(
          target: LatLng(35.6892, 51.3890), // Default to Tehran, Iran
          zoom: 12.0,
        ),
        onMapCreated: _onMapCreated,
        onStyleLoadedCallback: _onStyleLoaded,
      ),
    );
  }
}
