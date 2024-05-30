import 'package:flutter/material.dart';
import 'package:projeto_sos/src/data/models/user_model.dart';

class DetailUser extends StatelessWidget {
  final UserModel user;
  const DetailUser({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(user.name),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: user.integrantes.map((integrante) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(integrante.tipo),
              Text(integrante.quantidade.toString()),
            ],
          );
        }).toList(),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Fechar'),
        ),
      ],
    );
  }
}
