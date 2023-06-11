import 'package:flutter/material.dart';
class Archivo extends StatefulWidget {
  const Archivo({Key? key}) : super(key: key);

  @override
  State<Archivo> createState() => _ArchivoState();
}

class _ArchivoState extends State<Archivo> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: Column(
            children: [
              SizedBox(height: 100,),
              Text("Configuracion pantalla"),
              ElevatedButton(onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("La pantalla ya está configurada"))
                );
              }, child: Text("Configurar"))
            ],
          ),
        )
      ],
    );
  }
}
