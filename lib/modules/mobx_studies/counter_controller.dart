import 'package:mobx/mobx.dart';
part 'counter_controller.g.dart';

class CounterController = _CounterControllerBase with _$CounterController;

abstract class _CounterControllerBase with Store {
  
  @observable
  int counter = 0;

  @observable
  int counter2 = 1;

  @observable
  ObservableList<int> counterListObsercable = ObservableList<int>();

  @observable
  ObservableMap<String, dynamic> myMap = ObservableMap();

  @action
  void increment() {
    counter = counter + 1;
    counterListObsercable.add(counter);
  }

  @action
  void increment2() {
    counter2 = counter2 + 1;
  }

  @computed
  int get doubleCounter => counter * 2;

  @computed
  int get counterTimesCounter2 => counter * counter2;

  @computed
  bool get isOdd => counter % 2 == 0;

  @computed
  bool get isEven => counter % 2 != 0;

}