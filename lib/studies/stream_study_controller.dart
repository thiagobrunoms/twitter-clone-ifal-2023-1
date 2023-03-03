import 'dart:async';

class StreamStudyController {
  StreamController<int> _numberController = StreamController<int>.broadcast();

  Stream<int> get numberStream => _numberController.stream;

  Stream<int> get evenNumberStream => _numberController.stream.where(isEven);

  Stream<int> get oddNumberStream => _numberController.stream.where(isOdd); 

  Stream<String> get messageStream => _numberController.stream.map<String>(toMessage); 


  void addNumber(int number) {
    _numberController.sink.add(number);
  }

  bool isEven(int number) {
    return number % 2 == 0;
  }

  bool isOdd(int number) {
    return number % 2 != 0;
  }

  String toMessage(int number) {
    return "Mensagem transformada: $number";
  }

  void dispose() {
    _numberController.close();
  }

}