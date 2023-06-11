import 'package:flutter/material.dart';

class Aplicacion4 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Aplicacion4();
  }
}

class _Aplicacion4 extends State<Aplicacion4>{
  int _indice = 0;

  void _cambiarIndice(int indice){
    setState(() {
      _indice = indice;
    });
  }

  final List<Widget> _paginas = [
    Center(child: const Text("Traduccion"),), //posicion0
    ElevatedButton(onPressed: (){}, child: const Text("Presionaste")), //Posicion1
    FilledButton(onPressed: (){}, child: const Text("Organigrama")), //Posicion2
    //Todo esto esta en Posicion3
    ListView(
      padding: EdgeInsets.all(50),
      children: [
        const Text("Password"),
        TextField(decoration: InputDecoration(labelText: "Contraseña"), obscureText: true,),
        ElevatedButton(onPressed: (){}, child: const Text("Validar"))
      ],
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Aplicacion 4"),),
      body: _paginas[_indice],                            //****** Vector de paginas, en el indice
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.g_translate_sharp), label: "Principal", backgroundColor: Colors.blue),
          BottomNavigationBarItem(icon: Icon(Icons.mail), label: "Correo", backgroundColor: Colors.red),
          BottomNavigationBarItem(icon: Icon(Icons.lan), label: "Organicgrama", backgroundColor: Colors.green),
          BottomNavigationBarItem(icon: Icon(Icons.password), label: "Pass", backgroundColor: Colors.orange),
        ],
        currentIndex: _indice,
        onTap: _cambiarIndice,
        iconSize: 30,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
      ),
    );
  }

}