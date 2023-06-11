import 'package:flutter/material.dart';

import 'programa1.dart';
import 'programa2.dart';
import 'programa3.dart';

class Aplicacion7 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Aplicacion7();
  }
}

class _Aplicacion7 extends State<Aplicacion7>{
  int _indice = 0;

  void _cambiarIndice(int indice) {
    setState(() {
      _indice = indice;
    });
  }
  final List<Widget> _paginas = [
    Programa(),
    Programa2(),
    Programa3()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Aplicacion 6 SQL")),
      body: _paginas[_indice],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Propietario"),
          BottomNavigationBarItem(icon: Icon(Icons.car_crash_outlined), label: "Coche"),
          BottomNavigationBarItem(icon: Icon(Icons.home_repair_service), label:"Servicio"),
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