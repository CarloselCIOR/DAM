import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'archivo.dart';

class Ejercicio2 extends StatefulWidget {
  const Ejercicio2({Key? key}) : super(key: key);

  @override
  State<Ejercicio2> createState() => _Ejercicio2State();
}

class _Ejercicio2State extends State<Ejercicio2> {
  int _indice = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ejercicio 2"), centerTitle: true,
        actions: [
          IconButton(
              onPressed: (){
                SystemNavigator.pop();
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),

      body: cambiarPantalla(),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                child: Column(
                  children: [
                    CircleAvatar(child: const Text("CO"), radius: 40,),
                    SizedBox(height: 10,),
                    const Text("Carlos Orozco", style: TextStyle(fontSize: 20, color: Colors.white))
                  ],
                ),
              decoration: BoxDecoration(color: Colors.black54),
            ),
            _item("Configurar aplicacion", Icons.how_to_vote_outlined, 1),
            _item("Añadir", Icons.add_a_photo, 2),
            _item("Acerca de", Icons.abc, 3),
            Divider(color: Colors.black54),
            _item("Estadisticas", Icons.add_chart, 4),
            _item("Banco", Icons.account_balance_sharp, 5),
            _item("Root", Icons.adb, 6)

          ],
        ),
      ),
    );
  }

  Widget _item(String texto, IconData icono, int index) {
    return InkWell(
      onTap: (){
        setState(() {
          _indice = index;
        });

        Navigator.pop(context);
      },
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            Expanded(child: Icon(icono)),
            Expanded(child: Text(texto), flex: 3)
          ],
        ),
      ),
    );
  }

  cambiarPantalla() {
    switch(_indice){
      case 1:{
        return Archivo();
      }break;
      case 2:{
        return anadir_foto();
      }break;
      case 3:{
        return acercaDe();
      }break;
      case 4:{
        return estadisticas();
      }break;
      case 5:{
        return banco();
      }break;
      default:{
        return ;
      }
    }
  }

  Widget acercaDe() {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 100,),
          CircleAvatar(child: const Text("DAM"),),
          Text("(C) Instituto Tecnologico de Tepic")
        ],
      ),
    );
  }

  Widget anadir_foto() {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 100,),
          ElevatedButton(onPressed: (){
            showDialog(
                context: context,
                builder: (BuildContext){
                  return AlertDialog(
                    title: Text("Fotografia"),
                    content: Text("Destape su camara por favor"),
                    actions: [
                      TextButton(onPressed: (){
                        Navigator.pop(context);
                      }, child: Text("Cerrar"))
                    ],
                  );
                }
            );
          }, child: Text("Tomar foto"))
        ],
      ),
    );
  }

  Widget estadisticas() {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 100,),
          Image.network("http://www.bartolomecossio.com/MATEMATICAS/estadistica_grafico_poligono.gif"),
          ElevatedButton(onPressed: (){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Recargando estadisticas..."))
            );
          }, child: Text("Recargar"))
        ],
      ),
    );
  }

  Widget banco() {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 100,),
          TextField(decoration: InputDecoration(labelText: "Monto:", border: OutlineInputBorder()),),
          ElevatedButton(onPressed: (){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Monto insuficiente, deposite antes."))
            );
          }, child: Text("Retirar"))
        ],
      )
    );
  }
}
