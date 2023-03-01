import 'package:flutter/material.dart';
import 'package:google_maps_test/navigation/app_router_manager.dart';
import 'package:google_maps_test/navigation/pages.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  static MaterialPage page() {
    return const MaterialPage(
      name: Pages.homePath,
      key: ValueKey(Pages.homePath),
      child: HomePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            color: Colors.deepPurple,
          ),
          FilledButton(
            child: const Text('Map'),
            onPressed: () {
              context.read<AppRouterManager>().tapOnMap(selected: true);
            },
          ),
        ],
      ),
    );
  }
}
