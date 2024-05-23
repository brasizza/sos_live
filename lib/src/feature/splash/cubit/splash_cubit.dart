import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:projeto_sos/src/services/auth_service.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final AuthService service;
  SplashCubit({required this.service}) : super(SplashInitial());

  Future<void> login() async {
    if (await service.login()) {
      emit(SplashLoggedState());
    } else {
      emit(SplashErrorState(erro: 'Falha'));
    }
  }
}
