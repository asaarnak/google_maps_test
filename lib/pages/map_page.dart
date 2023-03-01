import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_test/navigation/navigator_state_pop.dart';
import 'package:google_maps_test/navigation/pages.dart';

class MapPage extends StatelessWidget {
  const MapPage({
    super.key,
  });

  static MaterialPage page() {
    return const MaterialPage(
      name: Pages.mapPath,
      key: ValueKey(Pages.mapPath),
      child: MapPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          const GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(40.730610, -73.935242),
              zoom: 16,
            ),
          ),
          FilledButton(
            onPressed: getOnTapBack(context: context),
            child: const Text('Home'),
          ),
        ],
      ),
    );
  }
}
