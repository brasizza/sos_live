import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:projeto_sos/src/repositories/location/location_repository.dart';
import 'package:projeto_sos/src/repositories/location/location_repository_impl.dart';
import 'package:projeto_sos/src/services/auth_service.dart';

part 'sos_state.dart';

class SosCubit extends Cubit<SosState> {
  final LocationRepository _repository;
  final AuthService _authService;
  SosCubit({required LocationRepository repository, required AuthService authService})
      : _repository = repository,
        _authService = authService,
        super(SosInitial());

  Future<bool> acionarSos() async {
    await _repository.distressOn(latitude: 0, longitude: 0, sessionToken: _authService.user!.sessionToken);
    emit(DistressOnState());
    return true;
  }

  Future<void> desligarSos() async {
    await _repository.distressOff(sessionToken: _authService.user!.sessionToken);

    emit(DistressOffState());
  }
}
