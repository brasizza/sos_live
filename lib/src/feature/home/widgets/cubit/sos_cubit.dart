import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:projeto_sos/src/repositories/location/location_repository.dart';
import 'package:projeto_sos/src/services/auth/auth_service.dart';
import 'package:projeto_sos/src/services/locator/locator_serivce.dart';

part 'sos_state.dart';

class SosCubit extends Cubit<SosState> {
  final LocationRepository _repository;
  final AuthService _authService;
  final LocatorSerivce _locatorSerivce;
  SosCubit({
    required LocationRepository repository,
    required AuthService authService,
    required LocatorSerivce locatorSerivce,
  })  : _repository = repository,
        _authService = authService,
        _locatorSerivce = locatorSerivce,
        super(SosInitial());

  Future<bool> acionarSos() async {
    await _repository.distressOn(
      latitude: _locatorSerivce.position!.latitude,
      longitude: _locatorSerivce.position!.longitude,
      sessionToken: _authService.user!.sessionToken,
    );
    emit(DistressOnState());
    return true;
  }

  Future<void> desligarSos() async {
    await _repository.distressOff(sessionToken: _authService.user!.sessionToken);

    emit(DistressOffState());
  }
}
