import 'package:flutter/material.dart';

class Actualizar extends StatefulWidget {
  final String nombre;
  final int indice;
  const Actualizar({Key? key, required this.nombre, required this.indice}) : super(key: key);

  @override
  State<Actualizar> createState() => _ActualizarState();
}

class _ActualizarState extends State<Actualizar> {
  final editarNombre = TextEditingController();

  @override
  void initState() {
    super.initState();
    editarNombre.text = widget.nombre;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ACTUALIZAR"), centerTitle: true,),
      body: ListView(
        padding: EdgeInsets.all(40),
        children: [
          TextField(
            decoration: InputDecoration(
                labelText: "NOMBRE:"
            ),
            controller: editarNombre, autofocus: true,
          ),
          SizedBox(height: 10,),
          FilledButton(onPressed: (){
            String regreso = editarNombre.text + "&" + widget.indice.toString();
            Navigator.pop(context, regreso);
          }, child: const Text("Guardar")),
        ],
      ),
    );
  }
}
