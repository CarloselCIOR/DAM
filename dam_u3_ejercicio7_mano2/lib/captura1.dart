import 'package:dam_u3_ejercicio7_mano2/propietario.dart';
import 'package:flutter/material.dart';
import 'basededatos.dart';

class Capturar extends StatefulWidget {
  const Capturar({Key? key}) : super(key: key);

  @override
  State<Capturar> createState() => _CapturarState();
}
//   int? idpropietario;
//   String? nombre;
//   String? telefono;

class _CapturarState extends State<Capturar> {
  final idPropietarioController = TextEditingController();
  final nombreController = TextEditingController();
  final telefonoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Captura Propietario")),
      body: ListView(
        padding: EdgeInsets.all(30),
        children: [
          //TextField(
          //  decoration: InputDecoration(labelText: "ID"),
          // controller: idtrabajadorController, autofocus: true,
          //),

          TextField(
            decoration: InputDecoration(labelText: "NOMBRE"),
            controller: nombreController, autofocus: true,
          ),

          TextField(
            decoration: InputDecoration(labelText: "TELEFONO"),
            controller: telefonoController, autofocus: false,
          ),

          FilledButton(onPressed: (){
            Propietario propietario = Propietario(
                nombre: nombreController.text,
                telefono: telefonoController.text,
            );

            DB.insertarPropietario(propietario).then((value){
              if(value>0){
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("SE INSERTÓ!"))
                );
              }
              Navigator.pop(context);
              //idtrabajadorController.text = "";
              nombreController.text = "";
              telefonoController.text = "";
            });
          }, child: const Text("INSERTAR"))
        ],
      ),
    );
  }
}
