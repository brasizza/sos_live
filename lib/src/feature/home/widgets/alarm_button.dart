import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class AlarmButton extends StatefulWidget {
  const AlarmButton({super.key});

  @override
  State<AlarmButton> createState() => _AlarmButtonState();
}

class _AlarmButtonState extends State<AlarmButton> {
  bool enable = false;

  AudioPlayer? audioPlayer;

  @override
  void initState() {
    audioPlayer = context.get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      heroTag: 'alarm_button',
      shape: const CircleBorder(),
      backgroundColor: Colors.green,
      onPressed: () {
        setState(() {
          enable = !enable;
          if (enable) {
            audioPlayer?.resume();
          } else {
            audioPlayer?.stop();
          }
        });
      },
      child: Icon((enable) ? Icons.volume_off : Icons.volume_up),
    );
  }
}
