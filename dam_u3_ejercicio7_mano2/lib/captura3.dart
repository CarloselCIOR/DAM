import 'servicio.dart';
import 'package:flutter/material.dart';
import 'basededatos.dart';

class Capturar3 extends StatefulWidget {
  const Capturar3({Key? key}) : super(key: key);

  @override
  State<Capturar3> createState() => _Capturar3State();
}

class _Capturar3State extends State<Capturar3> {
  final idServicioController = TextEditingController();
  final fechaController = TextEditingController();
  final placaController = TextEditingController();
  final kmController = TextEditingController();
  final costoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Captura Servicio")),
      body: ListView(
        padding: EdgeInsets.all(30),
        children: [
          //TextField(
          //  decoration: InputDecoration(labelText: "ID SERVICIO"),
          //  controller: idServicioController, autofocus: true,
          //),

          TextField(
            decoration: InputDecoration(labelText: "FECHA"),
            controller: fechaController, autofocus: true,
          ),

          TextField(
            decoration: InputDecoration(labelText: "PLACA"),
            controller: placaController, autofocus: false,
          ),

          TextField(
            decoration: InputDecoration(labelText: "KM"),
            controller: kmController, autofocus: false,
          ),

          TextField(
            decoration: InputDecoration(labelText: "COSTO"),
            controller: costoController, autofocus: false,
          ),



          FilledButton(onPressed: (){
            Servicio servicio = Servicio(
              fecha: fechaController.text,
              placa: placaController.text,
              km: int.parse(kmController.text),
              costo: double.parse(costoController.text),
            );

            DB.insertarServicio(servicio).then((value){
              if(value>0){
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("SE INSERTÓ!"))
                );
              }
              Navigator.pop(context);
              fechaController.text = "";
              placaController.text = "";
              kmController.text = "";
              costoController.text = "";
            });
          }, child: const Text("INSERTAR"))
        ],
      ),
    );
  }
}
