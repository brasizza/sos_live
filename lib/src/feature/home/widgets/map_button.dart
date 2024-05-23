import 'package:flutter/material.dart';
import 'package:projeto_sos/src/feature/home/widgets/map/map_module.dart';

class MapButton extends StatefulWidget {
  const MapButton({super.key});

  @override
  State<MapButton> createState() => _MapButtonState();
}

class _MapButtonState extends State<MapButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      onPressed: () {
        showModalBottomSheet(context: context, builder: (context) => MapModule());
      },
      child: Icon(Icons.flood_outlined),
    );
  }
}
