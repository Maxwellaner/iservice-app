import 'package:app/app/repositories/home_repository.dart';
import 'package:app/app/shared/models/category_model.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final HomeRepository _homeRepository;
  @observable
  List<Category> categories;

  _HomeControllerBase(this._homeRepository);

  @action
  getCategories() async {
    categories = await this._homeRepository.getAll();
  }
}
