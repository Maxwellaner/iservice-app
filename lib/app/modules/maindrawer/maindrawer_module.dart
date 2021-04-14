import 'package:app/app/shared/stores/auth_store.dart';

import 'maindrawer_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'maindrawer_page.dart';

class MaindrawerModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MaindrawerController(i.get<AuthStore>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => MaindrawerPage()),
      ];

  static Inject get to => Inject<MaindrawerModule>.of();
}
