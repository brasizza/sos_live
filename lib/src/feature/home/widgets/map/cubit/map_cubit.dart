import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:projeto_sos/src/repositories/location/location_repository.dart';
import 'package:projeto_sos/src/services/auth_service.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  final LocationRepository _repository;
  final AuthService _service;
  MapCubit({required LocationRepository repository, required AuthService service})
      : _repository = repository,
        _service = service,
        super(MapInitial());

  Future<void> nearby() async {
    final response = await _repository.neaby(sessionToken: _service.user!.sessionToken);
  }
}
