import 'package:flutter/material.dart';

import '../config_app/appconfig.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Appconfig.srcWidth = MediaQuery.sizeOf(context).width;
    Appconfig.srcHeight = MediaQuery.sizeOf(context).height;

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 3, 26, 128)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Aprovador de documentos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor: const Color.fromARGB(255, 3, 26, 128),

        centerTitle: true,
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert,
                color: Color.fromRGBO(250, 249, 249, 0)),
            tooltip: 'Novo Pedido',
            color: Color.fromRGBO(250, 249, 249, 0),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Novo pedido  para aprovar')));
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
              height: Appconfig.srcHeight / 5,
              width: Appconfig.srcWidth,
              color: const Color.fromARGB(255, 3, 26, 128)),
          const Text('Quantidade de tentativas shared 1 :'),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headlineMedium,
          )
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add_box_rounded),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
