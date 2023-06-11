import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //QUITAR ETIQUETA DE DEBUG
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange, //appBar
        canvasColor: Colors.green,     //Body
      ),

      home: Scaffold(
        appBar: AppBar(
          title: const Text("Programa 1"),
          centerTitle: true,
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.exit_to_app)),
            IconButton(onPressed: null, icon: Icon(Icons.account_balance))
          ],
        ),

        body: Center(
          child: ElevatedButton(onPressed: (){
            print("Hola como estás?");
          }, child: const Text("Presioname")),
        ),
      ),
    );
  }
}
