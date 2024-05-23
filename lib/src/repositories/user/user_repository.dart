import 'package:projeto_sos/src/data/models/user_model.dart';

abstract interface class UserRepository {
  Future<UserModel?> login();
  Future<UserModel?> me({required String sessionToken});
  Future<UserModel?> update({required UserModel user});
}
