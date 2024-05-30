import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:projeto_sos/src/feature/home/widgets/map/cubit/map_cubit.dart';
import 'package:projeto_sos/src/feature/home/widgets/map/widgets/list_users.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Timer? timer;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(Duration(seconds: 3), (_) {
      print('Timer rodando');
      context.get<MapCubit>().getLocation();
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
    print('Timer cancelado');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MapCubit, MapState>(
        bloc: context.get<MapCubit>(),
        builder: (context, state) {
          if (state is MapInitial) {
            return Container();
          } else if (state is MapLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is MapLoaded) {
            return ListUsers(users: state.users);
          } else if (state is MapEmpty) {
            return Center(
              child: Text(
                'Ufa ninguém para ser resgatado',
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
