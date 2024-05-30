import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:projeto_sos/src/feature/home/widgets/user_config/cubit/user_cubit_cubit.dart';
import 'package:projeto_sos/src/feature/home/widgets/user_config/user_config.dart';
import 'package:projeto_sos/src/services/auth/auth_service.dart';

class UserModule extends FlutterGetItModulePageRouter {
  const UserModule({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton((i) => UserCubitCubit(repository: i(), service: i())),
      ];
  @override
  WidgetBuilder get view => (context) => UserConfig(
        user: context.get<AuthService>().user!,
      );
}
