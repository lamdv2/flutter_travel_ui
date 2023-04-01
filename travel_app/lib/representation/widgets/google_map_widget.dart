import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends StatelessWidget {
  const GoogleMapWidget({Key? key}) : super(key: key);

  static const String routeName = '/google_map_widget';

  @override
  Widget build(BuildContext context) {
    GoogleMapController? controller;

    return SizedBox(
      height: 200,
      child: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(16.0321926, 108.2198714),
          zoom: 12,
        ),
        // mapType: MapType.hybrid,
        onMapCreated: (GoogleMapController controller) {
          controller = controller;
        },
      ),
    );
  }
}
