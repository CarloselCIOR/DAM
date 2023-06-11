import 'package:flutter/material.dart';

import 'inicio.dart';
import 'consulta.dart';
import 'acercade.dart';


class Aplicacion5 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return _Aplicacion5();
  }
}

class _Aplicacion5 extends State<Aplicacion5>{
  int _indice = 0;

  void _cambiarIndice(int indice) {
    setState(() {
      _indice = indice;
    });
  }
  final List<Widget> _paginas = [
    Inicio(),
    Consulta(),
    AcercaDe(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Aplicacion 5")),
      body: _paginas[_indice],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(icon: Icon(Icons.message_rounded), label: "Consulta"),
          BottomNavigationBarItem(icon: Icon(Icons.account_box_outlined), label: "Acerca de...")
        ],
        showUnselectedLabels: false,
        iconSize: 30,
        backgroundColor: Colors.blueGrey,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white38,
        currentIndex: _indice,
        onTap: _cambiarIndice,
      ),
    );
  }
}