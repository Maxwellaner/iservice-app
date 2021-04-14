import 'package:app/app/shared/auth/repositories/auth_repository.dart';
import 'package:app/app/shared/models/client_model.dart';
import 'package:app/app/shared/stores/auth_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  String email;
  String password;
  final AuthStore authStore;

  _LoginControllerBase(this.authStore);

  @action
  setEmail(String email) => this.email = email;

  @action
  setPassword(String password) => this.password = password;

  @action
  loginUser() async {
    try {
      await authStore.login(email, password);
      Modular.to.pushReplacementNamed('/home');
    } catch (err) {
      throw Exception(err.message);
    }
  }
}
