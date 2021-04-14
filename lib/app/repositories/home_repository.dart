import 'package:app/app/shared/models/category_model.dart';
import 'package:app/app/shared/utils/custom_dio/custom_dio.dart';

class HomeRepository {
  Future<List<Category>> getAll() async {
    var dio = CustomDio.authentication().instance;
    List<Category> categories = [];
    await dio.get('http://10.0.2.2:3333/categories').then((response) async {
      for (var json in (response.data as List)) {
        Category category = Category(
            id: json['id'], name: json['name'], photoUrl: json['photoUrl']);
        categories.add(category);
      }
    }).catchError((error) => print(error));
    print(categories);
    return categories;
  }
}
