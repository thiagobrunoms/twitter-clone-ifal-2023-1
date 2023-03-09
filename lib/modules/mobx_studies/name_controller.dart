import 'package:mobx/mobx.dart';
part 'name_controller.g.dart';

class NameController = _NameControllerBase with _$NameController;

abstract class _NameControllerBase with Store {

  @observable
  String name = "UFAL";

  @action
  void updateName(String name) {
    this.name = name;
  }
  
}