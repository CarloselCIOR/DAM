import 'coche.dart';
import 'package:flutter/material.dart';
import 'basededatos.dart';

class Capturar2 extends StatefulWidget {
  const Capturar2({Key? key}) : super(key: key);

  @override
  State<Capturar2> createState() => _Capturar2State();
}

class _Capturar2State extends State<Capturar2> {
  final placaController = TextEditingController();
  final marcaController = TextEditingController();
  final modeloController = TextEditingController();
  final anhoController = TextEditingController();
  final idpropietarioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Captura Coche")),
      body: ListView(
        padding: EdgeInsets.all(30),
        children: [
          TextField(
            decoration: InputDecoration(labelText: "PLACA"),
            controller: placaController, autofocus: true,
          ),

          TextField(
            decoration: InputDecoration(labelText: "MARCA"),
            controller: marcaController, autofocus: false,
          ),

          TextField(
            decoration: InputDecoration(labelText: "MODELO"),
            controller: modeloController, autofocus: false,
          ),

          TextField(
            decoration: InputDecoration(labelText: "AÑO"),
            controller: anhoController, autofocus: false,
          ),

          TextField(
            decoration: InputDecoration(labelText: "ID PROPIETARIO"),
            controller: idpropietarioController, autofocus: false,
          ),



          FilledButton(onPressed: (){
            Coche coche = Coche(
              placa: placaController.text,
              marca: marcaController.text,
              modelo: modeloController.text,
              anho: int.parse(anhoController.text),
              idpropietario: int.parse(idpropietarioController.text),
            );

            DB.insertarCoche(coche).then((value){
              if(value>0){
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("SE INSERTÓ!"))
                );
              }
              Navigator.pop(context);
              placaController.text = "";
              marcaController.text = "";
              modeloController.text = "";
              anhoController.text = "";
              idpropietarioController.text = "";
            });
          }, child: const Text("INSERTAR"))
        ],
      ),
    );
  }
}
