import 'package:app/app/shared/utils/custom_dio/custom_dio.dart';
import 'package:app/app/shared/models/client_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  var customDio = CustomDio().instance;

  Future<Client> loginUser(String email, String password) async {
    var client;

    print(email);
    print(password);
    await customDio.post('/login', data: {
      "email": "$email",
      "password": "$password"
    }).then((response) async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.setString('token', response.data['token']);
      print(response.data['client']);
      print(response.data['token']);
      var data = response.data['client'];
      client = Client(
          id: data['id'],
          name: data['name'],
          birth: data['birth'],
          cpf: data['cpf'],
          email: data['email'],
          phone: data['phone']);
      print(data);
      print(client.toJson());
      print(data['name']);
    }).catchError((err) {
      throw Exception("E-mail ou senha inválido.");
    });
    return client;
  }
}
