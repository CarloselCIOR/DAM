import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  TextEditingController controlador = TextEditingController(text: "Abrazos y balazos");

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(60),
      children: [
        const Text("Bienvenidos", style: TextStyle(fontSize: 30, color: Colors.red),),
        SizedBox(height: 60,),
        TextField(decoration: InputDecoration(labelText: "Mensaje"), controller: controlador,),
        SizedBox(height: 60,),
        ElevatedButton(onPressed: (){}, child: const Text("Editar"))
      ],
    );
  }
}



