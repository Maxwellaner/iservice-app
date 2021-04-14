import 'package:app/app/modules/home/home_module.dart';
import 'package:app/app/modules/login/login_module.dart';
import 'package:app/app/shared/stores/auth_store.dart';
import 'package:app/app/shared/utils/custom_dio/custom_dio.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:app/app/app_widget.dart';
import 'modules/maindrawer/maindrawer_controller.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => CustomDio()),
        Bind((i) => AuthStore()),
        Bind((i) => MaindrawerController(i.get())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: LoginModule()),
        Router('/home', module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
