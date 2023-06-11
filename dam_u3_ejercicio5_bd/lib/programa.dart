import 'package:flutter/material.dart';

import 'persona.dart';

class Programa extends StatefulWidget {
  const Programa({Key? key}) : super(key: key);

  @override
  State<Programa> createState() => _ProgramaState();
}

class _ProgramaState extends State<Programa> {
  List<Persona> todosPersona = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("asd"),
        centerTitle: true,
      ),
      
      body: ListView.builder(
          itemCount: todosPersona.length,

          itemBuilder: (itemBuilder, index){
            InkWell(
                onTap: (){
                  mostrarAlerta(index);
                  },
              child: Center(
                child: ListTile(
                  title: Text(todosPersona[index].nombre),
                  subtitle: Text(todosPersona[index].sueldo as String),
                  trailing: Text(todosPersona[index].edad as String),
                ),
              ),

            );
          }
      ),
    );
  }

  void mostrarAlerta(index) {

  }
}
