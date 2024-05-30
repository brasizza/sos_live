import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:projeto_sos/src/feature/home/widgets/alarm_button.dart';
import 'package:projeto_sos/src/feature/home/widgets/cubit/sos_cubit.dart';
import 'package:projeto_sos/src/feature/home/widgets/map_button.dart';
import 'package:projeto_sos/src/feature/home/widgets/sos_button.dart';
import 'package:projeto_sos/src/feature/home/widgets/torch_button.dart';
import 'package:projeto_sos/src/feature/home/widgets/user_config/user_module.dart';
import 'package:torch_controller/torch_controller.dart';

class HomePage extends StatefulWidget {
  final SosCubit controller;
  const HomePage({super.key, required this.controller});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Timer? timer;
  bool? backgroundColor;
  TorchController controller = TorchController();

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SosCubit, SosState>(
      bloc: context.get(),
      listener: (context, state) {
        if (state is DistressOffState) {
          context.get<AudioPlayer>().stop();
          setState(() {
            backgroundColor = null;
            print('Timer parado');
          });
          timer?.cancel();
        } else if (state is DistressOnState) {
          context.get<AudioPlayer>().resume();
          timer = Timer.periodic(const Duration(milliseconds: 10), (_) {
            controller.toggle();
            print('Timer iniciado');
            setState(() {
              backgroundColor = switch (backgroundColor) {
                true => false,
                false => true,
                _ => true,
              };
            });
          });
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 50),
        color: switch (backgroundColor) {
          true => Colors.blue.shade900,
          false => Colors.red.shade900,
          _ => Colors.white,
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton.filled(
                onPressed: () {
                  showModalBottomSheet(
                    showDragHandle: true,
                    isScrollControlled: true,
                    constraints: BoxConstraints.expand(height: MediaQuery.sizeOf(context).height * .7),
                    context: context,
                    builder: (_) => const UserModule(),
                  );
                },
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                )),
          ),
          body: Column(
            children: [
              Expanded(child: SosButton(controller: widget.controller)),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AlarmButton(),
                  TorchButton(),
                  MapButton(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
