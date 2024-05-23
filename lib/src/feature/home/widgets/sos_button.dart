import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:projeto_sos/src/feature/home/widgets/confirm_dialog.dart';
import 'package:projeto_sos/src/feature/home/widgets/cubit/sos_cubit.dart';
import 'package:pulsator/pulsator.dart';

class SosButton extends StatefulWidget {
  final SosCubit _controller;
  const SosButton({super.key, required SosCubit controller}) : _controller = controller;

  @override
  State<SosButton> createState() => _SosButtonState();
}

class _SosButtonState extends State<SosButton> with TickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SosCubit, SosState>(
      bloc: context.get(),
      builder: (context, state) {
        if (state is DistressOnState) {
          _controller?.forward();
        } else {
          _controller?.stop();
          _controller?.reset();
        }
        return Pulsator(
          onCreated: (controller) {
            _controller = controller;
          },
          style: const PulseStyle(color: Colors.red),
          count: (state is DistressOnState) ? 10 : 1,
          autoStart: false,
          child: SizedBox(
            width: 150,
            height: 150,
            child: RawMaterialButton(
              fillColor: Colors.red,
              shape: const CircleBorder(),
              onPressed: () async {
                if (state is DistressOnState) {
                  widget._controller.desligarSos();
                } else {
                  final response = await showDialog(context: context, builder: (_) => ConfirmDialog(), barrierDismissible: false);
                  if (response == true) {
                    widget._controller.acionarSos();
                  }
                }
              },
              child: const Text(
                'SOS',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
