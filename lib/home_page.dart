import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  final String faculty;
  const MyHomePage({super.key, required this.title, required this.faculty});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.title} - ${widget.faculty}'),
        centerTitle: true,
        leading: const Icon(Icons.arrow_back),
        actions: [
          IconButton(onPressed: _incrementCounter, icon: const Icon(Icons.add)),
          IconButton(onPressed: _decrementCounter, icon: const Icon(Icons.remove)),
        ],
        elevation: 0,
      ),
      body: Center(
        child: Container(
          width: 150,
          height: 300,
          color: Colors.red[100],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround, //VERTICAL
            crossAxisAlignment: CrossAxisAlignment.center, //HORIZONTAL
            children: [
              Text('Contando: '),
              Text('$_counter')
            ],
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Incrementar valor',
        child: const Icon(Icons.accessible_rounded),
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }
}