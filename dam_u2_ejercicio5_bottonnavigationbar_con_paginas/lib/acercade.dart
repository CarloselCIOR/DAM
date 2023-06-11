import 'package:flutter/material.dart';

class AcercaDe extends StatefulWidget {
  const AcercaDe({Key? key}) : super(key: key);

  @override
  State<AcercaDe> createState() => _AcercaDeState();
}

class _AcercaDeState extends State<AcercaDe> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(60),
      children: [
        Image.asset("lib/logo.png", width: 200, height: 200,),
        Text("(C) RESERVADOS \n CARLOS OROZCO", style: TextStyle(color: Colors.red, fontSize: 30),),
        Text("INSTITUTO TECNOLOGICO DE TEPIC", style: TextStyle(color: Colors.blue, fontSize: 15),),
      ],
    );
  }
}
