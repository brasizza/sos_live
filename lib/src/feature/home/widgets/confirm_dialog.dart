import 'package:flutter/material.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Deseja realmente ativar o SOS?"),
          const SizedBox(
            height: 30,
          ),
          TweenAnimationBuilder<double>(
            onEnd: () {
              Navigator.of(context).pop(true);
            },
            tween: Tween<double>(begin: 0, end: 5),
            duration: const Duration(seconds: 5),
            builder: (context, value, child) {
              return SizedBox(
                height: 150,
                width: 150,
                child: Stack(
                  fit: StackFit.expand,
                  alignment: Alignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: Colors.red,
                      strokeWidth: 20,
                      value: value / 5,
                    ),
                    Center(
                      child: Text(
                        value.toStringAsFixed(0),
                        style: TextStyle(fontSize: 30),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text('Cancelar'))
      ],
    );
  }
}
