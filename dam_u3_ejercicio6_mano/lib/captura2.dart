import 'conyugue.dart';
import 'package:flutter/material.dart';
import 'basededatos.dart';

class Capturar2 extends StatefulWidget {
  const Capturar2({Key? key}) : super(key: key);

  @override
  State<Capturar2> createState() => _Capturar2State();
}

class _Capturar2State extends State<Capturar2> {
  final idconyugueController = TextEditingController();
  final nombreController = TextEditingController();
  final telefonoController = TextEditingController();
  final idtrabajadorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Captura Conyugue")),
      body: ListView(
        padding: EdgeInsets.all(30),
        children: [
          //TextField(
          //  decoration: InputDecoration(labelText: "ID"),
          //  controller: idtrabajadorController, autofocus: true,
          //),

          TextField(
            decoration: InputDecoration(labelText: "NOMBRE"),
            controller: nombreController, autofocus: true,
          ),

          TextField(
            decoration: InputDecoration(labelText: "TELEFONO"),
            controller: telefonoController, autofocus: false,
          ),

          TextField(
            decoration: InputDecoration(labelText: "IDTRABAJADOR"),
            controller: idtrabajadorController, autofocus: false,
          ),



          FilledButton(onPressed: (){
            Conyugue est = Conyugue(
                nombre: nombreController.text,
                telefono: telefonoController.text,
                idtrabajador: int.parse(idtrabajadorController.text),
            );

            DB.insertarConyugue(est).then((value){
              if(value>0){
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("SE INSERTÓ!"))
                );
              }
              Navigator.pop(context);
              //idtrabajadorController.text = "";
              nombreController.text = "";
              telefonoController.text = "";
              idtrabajadorController.text = "";
            });
          }, child: const Text("INSERTAR"))
        ],
      ),
    );
  }
}
