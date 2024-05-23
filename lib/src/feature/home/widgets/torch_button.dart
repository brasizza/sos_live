import 'package:flutter/material.dart';
import 'package:torch_controller/torch_controller.dart';

class TorchButton extends StatefulWidget {
  const TorchButton({super.key});

  @override
  State<TorchButton> createState() => _TorchButtonState();
}

class _TorchButtonState extends State<TorchButton> {
  final TorchController controller = TorchController();
  bool active = false;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      backgroundColor: (active) ? Colors.yellow : Colors.black,
      heroTag: 'torch_button',
      onPressed: () {
        setState(() {
          active = !active;
          controller.toggle();
        });
      },
      child: Icon(
        Icons.lightbulb,
        color: (active) ? Colors.black : Colors.white,
      ),
    );
  }
}
