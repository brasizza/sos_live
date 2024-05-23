import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:projeto_sos/src/feature/splash/cubit/splash_cubit.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.get<SplashCubit>().login();
    });
    return BlocListener<SplashCubit, SplashState>(
      bloc: context.get(),
      listener: (context, state) {
        if (state is SplashErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.erro)));
        }

        if (state is SplashLoggedState) {
          Navigator.of(context).pushReplacementNamed('/home');
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("AJUDA EMERGENCIAL"),
              Image.asset(
                'assets/images/splash_image.png',
                width: 150,
              ),
              CircularProgressIndicator.adaptive()
            ],
          ),
        ),
      ),
    );
  }
}
