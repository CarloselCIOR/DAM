import 'package:dam_u3_ejercicio4_sqlite/estudiante.dart';
import 'package:flutter/material.dart';
import 'basededatos.dart';

class Capturar extends StatefulWidget {
  const Capturar({Key? key}) : super(key: key);

  @override
  State<Capturar> createState() => _CapturarState();
}

class _CapturarState extends State<Capturar> {
  final idController = TextEditingController();
  final nombreController = TextEditingController();
  final carreraController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Captura")),
      body: ListView(
        padding: EdgeInsets.all(30),
        children: [
          TextField(
            decoration: InputDecoration(labelText: "ID"),
            controller: idController, autofocus: true,
          ),

          TextField(
            decoration: InputDecoration(labelText: "NOMBRE"),
            controller: nombreController, autofocus: false,
          ),

          TextField(
            decoration: InputDecoration(labelText: "CARRERA"),
            controller: carreraController, autofocus: false,
          ),

          FilledButton(onPressed: (){
            Estudiante est = Estudiante(
                id: idController.text,
                nombre: nombreController.text,
                carrera: carreraController.text
            );

            DB.insertar(est).then((value){
              if(value>0){
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("SE INSERTÓ!"))
                );
              }
              idController.text = "";
              nombreController.text = "";
              carreraController.text = "";
            });
          }, child: const Text("INSERTAR"))
        ],
      ),
    );
  }
}
