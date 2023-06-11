import 'package:flutter/material.dart';

class Consulta extends StatefulWidget {
  const Consulta({Key? key}) : super(key: key);

  @override
  State<Consulta> createState() => _ConsultaState();
}

class _ConsultaState extends State<Consulta> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(255, 235, 182, 100),
      child: ListView(
        padding: EdgeInsets.all(60),
        children: [
          TextField(decoration: InputDecoration(labelText: "Mensaje: ", prefixIcon: Icon(Icons.message_rounded)), ),
          SizedBox(height: 30),
          OutlinedButton(onPressed: (){}, child: Text("Agregar")),
          SizedBox(height: 80),
          Text("MENSAJES:", style: TextStyle(fontSize: 25, color: Colors.red),),
          Text("-------------", style: TextStyle(fontSize: 25, color: Colors.red),),
        ],
      ),
    );
  }
}
