import 'package:dam_u3_ejercicio6_mano/trabajador.dart';
import 'package:flutter/material.dart';
import 'basededatos.dart';

class Capturar extends StatefulWidget {
  const Capturar({Key? key}) : super(key: key);

  @override
  State<Capturar> createState() => _CapturarState();
}
//  int idtrabajador;
//   String nombre;
//   String domicilio;
//   String puesto;
//   double sueldo;

class _CapturarState extends State<Capturar> {
  final idtrabajadorController = TextEditingController();
  final nombreController = TextEditingController();
  final domicilioController = TextEditingController();
  final puestoController = TextEditingController();
  final sueldoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Captura Trabajador")),
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
            decoration: InputDecoration(labelText: "DOMICILIO"),
            controller: domicilioController, autofocus: false,
          ),

          TextField(
            decoration: InputDecoration(labelText: "PUESTO"),
            controller: puestoController, autofocus: false,
          ),

          TextField(
            decoration: InputDecoration(labelText: "SUELDO"),
            controller: sueldoController, autofocus: false,
          ),

          FilledButton(onPressed: (){
            Trabajador est = Trabajador(
                nombre: nombreController.text,
                domicilio: domicilioController.text,
                puesto: puestoController.text,
                sueldo: double.parse(sueldoController.text)
            );

            DB.insertarTrabajador(est).then((value){
              if(value>0){
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("SE INSERTÓ!"))
                );
              }
              Navigator.pop(context);
              //idtrabajadorController.text = "";
              nombreController.text = "";
              domicilioController.text = "";
              puestoController.text = "";
              sueldoController.text = "";
            });
          }, child: const Text("INSERTAR"))
        ],
      ),
    );
  }
}
