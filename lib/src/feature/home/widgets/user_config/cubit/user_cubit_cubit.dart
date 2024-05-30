import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:projeto_sos/src/data/models/user_model.dart';
import 'package:projeto_sos/src/repositories/user/user_repository.dart';
import 'package:projeto_sos/src/services/auth/auth_service.dart';

part 'user_cubit_state.dart';

class UserCubitCubit extends Cubit<UserCubitState> {
  UserRepository _repository;
  AuthService _service;

  UserCubitCubit({required UserRepository repository, required AuthService service})
      : _repository = repository,
        _service = service,
        super(UserCubitInitial());

  Future<void> save(UserModel user) async {
    final userRepository = await _repository.update(user: user);
    if (userRepository != null) {
      _service.user = userRepository;
    }
  }
}
