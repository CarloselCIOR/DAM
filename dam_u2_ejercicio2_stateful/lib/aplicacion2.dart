import 'package:flutter/material.dart';

class Aplicacion2 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Aplicacion2();
  }
}

class _Aplicacion2 extends State<Aplicacion2>{
  final nombre = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Proyecto 2"),
        actions: [
          IconButton(onPressed: (){
            nombre.text = "";
          }, icon: Icon(Icons.recycling))
        ],
      ),
      body: Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          const Text(
            "Bienvenidos",
            style: TextStyle(
                fontSize: 35,
                color: Colors.red,
                fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 50,),
          Padding(
            padding: EdgeInsets.all(30),
            child: TextField(
              controller: nombre,
              decoration: InputDecoration(
                labelText: "Nombre:",
                prefixIcon: Icon(Icons.account_circle), //Investigar cual icono se pone adentro del nombre
                border: OutlineInputBorder()
              ),
            ),
          ),

          ElevatedButton(onPressed: (){
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Hola como estas")));
          }, child: Icon(Icons.dark_mode)),

          OutlinedButton(onPressed: (){
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Hola " + nombre.text + ", saludos" + "\nHola 2 ${nombre.text}, saludos")));
          }, child: Icon(Icons.account_balance)),

          TextButton(onPressed: (){}, child: Icon(Icons.exit_to_app))
        ],
      ),
    );
  }

}