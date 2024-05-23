import 'package:asyncstate/asyncstate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:projeto_sos/src/data/models/integrante_model.dart';
import 'package:projeto_sos/src/data/models/user_model.dart';
import 'package:projeto_sos/src/feature/home/widgets/user_config/cubit/user_cubit_cubit.dart';

class UserConfig extends StatefulWidget {
  final UserModel user;
  const UserConfig({super.key, required this.user});

  @override
  State<UserConfig> createState() => _UserConfigState();
}

class _UserConfigState extends State<UserConfig> {
  final nomeEC = TextEditingController();

  @override
  void dispose() {
    nomeEC.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    nomeEC.text = widget.user.name;
  }

  void increment({required IntegranteModel integrante}) {
    setState(() {
      final index = widget.user.integrantes.indexWhere((elemento) => elemento == integrante);
      if (index != -1) {
        widget.user.integrantes[index] = integrante.copyWith(quantidade: integrante.quantidade + 1);
      }
    });
  }

  void decrement({required IntegranteModel integrante}) {
    if (integrante.quantidade > 0) {
      setState(() {
        final index = widget.user.integrantes.indexWhere((elemento) => elemento == integrante);
        if (index != -1) {
          widget.user.integrantes[index] = integrante.copyWith(quantidade: integrante.quantidade - 1);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text('Conte sobe sua familia'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: nomeEC,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            Column(
                children: widget.user.integrantes
                    .map(
                      (integrante) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(integrante.tipo),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    decrement(integrante: integrante);
                                  },
                                  icon: Icon(Icons.remove)),
                              Text(integrante.quantidade.toString()),
                              IconButton(
                                  onPressed: () {
                                    increment(integrante: integrante);
                                  },
                                  icon: Icon(Icons.add)),
                            ],
                          ),
                        ],
                      ),
                    )
                    .toList()),
            ElevatedButton(
                onPressed: () {
                  context.get<UserCubitCubit>().save(widget.user.copyWith(name: nomeEC.text)).asyncLoader();
                },
                child: Text('SALVAR'))
          ],
        ),
      ),
    );
  }
}
