import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:projeto_sos/src/feature/home/widgets/map/cubit/map_cubit.dart';
import 'package:projeto_sos/src/feature/home/widgets/map/map_page.dart';

class MapModule extends FlutterGetItModulePageRouter {
  @override
  // TODO: implement bindings
  List<Bind<Object>> get bindings => [
        Bind.singleton((i) => MapCubit(repository: i(), service: i())..nearby()),
      ];
  @override
  // TODO: implement view
  WidgetBuilder get view => (context) => MapPage();
}
