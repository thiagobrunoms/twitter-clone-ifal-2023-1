import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class RxDartStreamStudyController {
  BehaviorSubject<int> _numberBehaviorSubject = BehaviorSubject<int>();
  BehaviorSubject<String> _textBehaviorSubject = BehaviorSubject<String>();

  Stream<int> get numberStream => _numberBehaviorSubject.stream;
  Stream<String> get textStream => _textBehaviorSubject.stream;

  void addNumber(int number) {
    _numberBehaviorSubject.add(number);
  }

  void addText(String text) {
    _textBehaviorSubject.add(text);
  }

  Stream<String> get combinedStream => CombineLatestStream([numberStream, textStream], (values) {
    int number = values[0] as int;
    String text = values[1] as String;

    return 'Stream combinada $number com $text';
  });
  
}