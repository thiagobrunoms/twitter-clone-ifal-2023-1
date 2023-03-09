import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:twitter_clone_ifal_2023/modules/mobx_studies/counter_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:twitter_clone_ifal_2023/modules/mobx_studies/name_controller.dart';

class CounterPage extends StatefulWidget {

  CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  CounterController counterController = CounterController();
  NameController nameController = NameController();
  TextStyle myStyle = const TextStyle(fontSize: 25);
  List<ReactionDisposer> meusDisposers = [];
  late ReactionDisposer whenDisposer;

  @override
  void initState() {

    // whenDisposer = when((p0) => counterController.counter == 10, () {
    //   print('IGUAL A 10!!! NÃO VOLTA MAIS!!!');
    // });

    var autorunCounterDisposer = autorun((p0) => print('AUTORUN: ${counterController.counter}'));
    meusDisposers.add(autorunCounterDisposer);

    var counterDisposer = reaction<int>((_) => counterController.counter, processReturn);
    meusDisposers.add(counterDisposer);

    super.initState();
  }

  @override
  void dispose() {
    print('disposing o meu disposer!!!');
    for (var eachDisposer in meusDisposers) {
      eachDisposer();
    }

    super.dispose();
  }

  void processReturn(int meuContador) {
    print('contador scaffold $meuContador');
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Counter $meuContador')));
    // whenDisposer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Observer(
          builder: (context) {
            if (counterController.counterListObsercable.isEmpty) {
              return Text('Não há elemento na lista', style: myStyle,);
            }
            
            return ListView.builder(
              itemCount: counterController.counterListObsercable.length, //para 10 elementos
              itemBuilder: (context, index) { //A função itemBuilder é executada 10x 
                int element = counterController.counterListObsercable[index];
                return Text('counter: $element', style: myStyle,);
              }
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          counterController.increment();
          int currentCounter = counterController.counter;
          nameController.updateName('UFAL Changed $currentCounter');
        }
      ),
    );
  }

  Widget buildWithStreamBuilder() {
    return StreamBuilder(
      stream: null, //counter stream 1,
      builder: (context, snapshot) {
        return StreamBuilder(
          stream: null, //name stream 2
          builder: (context, snapshot) {
            return StreamBuilder<Object>(
              stream: null,
              builder: (context, snapshot) {
                return Row(
                  children: const [
                    Text("counter"),
                    Text("name"),
                    Text("outra"),
                  ],
                );
              }
            );
          },
        );
      },
    );
  }

  Widget buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Contador: ${counterController.counter}", style: myStyle,),
        Text("Name: ${nameController.name}", style: myStyle,),
        Text('Counter d: ${counterController.doubleCounter}', style: myStyle,),
        Text('Counter even?: ${counterController.isEven}', style: myStyle,),
        Text('Counter odd?: ${counterController.isOdd}', style: myStyle,),
        Text('Counter times?: ${counterController.counterTimesCounter2}', style: myStyle,),
      ],
    );
  }
}