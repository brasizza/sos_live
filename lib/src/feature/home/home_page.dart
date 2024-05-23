import 'package:flutter/material.dart';
import 'package:projeto_sos/src/feature/home/widgets/alarm_button.dart';
import 'package:projeto_sos/src/feature/home/widgets/cubit/sos_cubit.dart';
import 'package:projeto_sos/src/feature/home/widgets/map_button.dart';
import 'package:projeto_sos/src/feature/home/widgets/sos_button.dart';
import 'package:projeto_sos/src/feature/home/widgets/torch_button.dart';
import 'package:projeto_sos/src/feature/home/widgets/user_config/user_module.dart';

class HomePage extends StatelessWidget {
  final SosCubit controller;
  const HomePage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          Expanded(child: SosButton(controller: controller)),
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
    );
  }
}
