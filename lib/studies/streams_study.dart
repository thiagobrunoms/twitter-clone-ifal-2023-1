import 'dart:async';

import 'package:flutter/material.dart';
import 'package:twitter_clone_ifal_2023/studies/rxdart_stream_study_controller.dart';
import 'package:twitter_clone_ifal_2023/studies/stream_study_controller.dart';

class StreamStudy extends StatefulWidget {
  const StreamStudy({super.key});

  @override
  State<StreamStudy> createState() => _StreamStudyState();
}

class _StreamStudyState extends State<StreamStudy> {
  int value = 0;
  TextStyle style = const TextStyle(fontSize: 20);
  StreamStudyController studyController = StreamStudyController();
  RxDartStreamStudyController rxDartController = RxDartStreamStudyController();
  late StreamSubscription<int> numberStreamSubscription;
  late StreamSubscription<int> evenNumberStreamSubscription;

  @override
  void initState() {
    super.initState();

    numberStreamSubscription = studyController.numberStream.listen((event) { 
      print('NOVO VALOR: $event');
    });

    evenNumberStreamSubscription = studyController.evenNumberStream.listen((event) { 
      print('NOVO VALOR PAR: $event');
    });
  }

  @override
  void dispose() {
    numberStreamSubscription.cancel();
    evenNumberStreamSubscription.cancel();
    studyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // StreamBuilder<int>(
                //   stream: studyController.numberStream,
                //   builder: myBuilder
                // ),
                // StreamBuilder<int>(
                //   stream: studyController.evenNumberStream,
                //   builder: myEvenBuilder
                // ),
                // StreamBuilder<int>(
                //   stream: studyController.oddNumberStream,
                //   builder: myOddBuilder
                // ),
                // StreamBuilder<String>(
                //   stream: studyController.messageStream,
                //   builder: myMessageBuilder
                // ),
                StreamBuilder<int>(
                  stream: rxDartController.numberStream,
                  builder: myBuilder
                ),
                StreamBuilder<String>(
                  stream: rxDartController.textStream,
                  builder: myMessageBuilder
                ),
                StreamBuilder<String>(
                  stream: rxDartController.combinedStream,
                  builder: myCombinedMessageBuilder
                ),
                TextButton(onPressed: () {
                  rxDartController.addText('Texto adicionado!');
                }, child: Text('Adicionar text'))
              ]),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          value = value + 1;
          // studyController.addNumber(value);
          rxDartController.addNumber(value);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget myBuilder(BuildContext context, AsyncSnapshot<int> snapshot) {
    if (snapshot.data != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Number: ${snapshot.data}', style: style)
        ],
      );
    }

    return Text('Não há dados na stream Number', style: style);
  }

  Widget myEvenBuilder(BuildContext context, AsyncSnapshot<int> snapshot) {
    if (snapshot.data != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Even Number: ${snapshot.data}', style: style)
        ],
      );
    }

    return Text('Não há dados na stream EvenNumber', style: style);
  }

  Widget myOddBuilder(BuildContext context, AsyncSnapshot<int> snapshot) {
    if (snapshot.data != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Odd Number: ${snapshot.data}', style: style)
        ],
      );
    }

    return Text('Não há dados na stream OddNumber', style: style);
  }

  Widget myMessageBuilder(BuildContext context, AsyncSnapshot<String> snapshot) {
    if (snapshot.data != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Message: ${snapshot.data}', style: style)
        ],
      );
    }

    return Text('Não há dados na stream messageStream', style: style);
  }

  Widget myCombinedMessageBuilder(BuildContext context, AsyncSnapshot<String> snapshot) {
    if (snapshot.data != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${snapshot.data}', style: style)
        ],
      );
    }

    return Text('Não há dados na stream combined', style: style);
  }
}