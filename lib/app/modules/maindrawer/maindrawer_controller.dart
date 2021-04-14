import 'package:app/app/shared/models/client_model.dart';
import 'package:app/app/shared/stores/auth_store.dart';
import 'package:mobx/mobx.dart';

part 'maindrawer_controller.g.dart';

class MaindrawerController = _MaindrawerControllerBase
    with _$MaindrawerController;

abstract class _MaindrawerControllerBase with Store {
  final AuthStore authStore;

  _MaindrawerControllerBase(this.authStore);
}
