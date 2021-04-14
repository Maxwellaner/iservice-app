import 'package:app/app/shared/models/client_model.dart';
import 'package:app/app/shared/utils/custom_dio/custom_dio.dart';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  var customDio = CustomDio().instance;

  @observable
  Client client;

  @action
  Future login(String email, String password) async {
    try {
      await customDio.post('/login', data: {
        'email': '$email',
        'password': '$password'
      }).then((response) async {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        await preferences.setString(
            'iService@user:token', response.data['token']);
        var data = response.data['client'];
        client = Client(
            id: data['id'],
            name: data['name'],
            birth: data['birth'],
            cpf: data['cpf'],
            email: data['email'],
            phone: data['phone'],
            photoUrl: data['photoUrl']);
      });
      print(client);
      return client;
    } on DioError catch (e) {
      return e.message;
    }
  }
}
