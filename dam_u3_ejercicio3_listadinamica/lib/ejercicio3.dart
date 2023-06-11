import 'package:dam_u3_ejercicio3_listadinamica/actualizar.dart';
import 'package:flutter/material.dart';
import 'actualizar.dart';

class ListaDinamica extends StatefulWidget {
  const ListaDinamica({Key? key}) : super(key: key);

  @override
  State<ListaDinamica> createState() => _ListaDinamicaState();
}

class _ListaDinamicaState extends State<ListaDinamica> {
    List<String> estudiantes = [
      "Alan Barocio",
      "Paul Razon",
      "Edwin Montoya",
      "Andres Ramos",
      "Carlos Ochoa"
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ejercicio 3 Lista Dinamica"), centerTitle: true,),
      body: ListView.builder(
          itemCount: estudiantes.length,
          itemBuilder: (contexto, indice){
            return InkWell(
              onTap: (){
                alertaActualizar(indice);
              },
              child: ListTile(
                title: Text(estudiantes[indice]),
                trailing: FilledButton(onPressed: (){
                  alertaBorrado(indice);
                },
                child: Icon(Icons.delete),
                ),
              ),
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          agregarNombre();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void agregarNombre() {
    final nuevoestudiante = TextEditingController();
    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (builder){
          return Container(
            padding: EdgeInsets.only(
              top: 15,
              left: 30,
              right: 30,
              bottom: MediaQuery.of(context).viewInsets.bottom+50 //Fijarlo a la parte superior del teclado cuando sale
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: "Nuevo nombre"),
                  controller: nuevoestudiante,
                  autofocus: true,
                ),
                SizedBox(height: 10,),
                ElevatedButton(onPressed: (){
                  String nombre = nuevoestudiante.text;
                  if(nombre.isEmpty) return;
                  setState(() {
                    estudiantes.add(nombre);
                  });
                  Navigator.pop(context);
                }, child: const Text("Agregar")),

              ],
            ),
          );
    });
  }

  void alertaActualizar(int indice){
    showDialog(context: context, builder: (builder){
      return AlertDialog(
        title: const Text("ATENCIÓN"),
        content: Text("¿Desea EDITAR ${estudiantes[indice]}"),
        actions: [
          OutlinedButton(onPressed: (){
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(
                builder: (builder)=>Actualizar(nombre: estudiantes[indice], indice: indice,)
            )).then((value) {
              List<String> datos = value.toString().split("&");
              int indice = int.parse(datos[1]);

              setState(() {
                estudiantes[indice] = datos[0];
              });
            });
          }, child: const Text("SI")),

          OutlinedButton(onPressed: (){
            Navigator.pop(context);
          }, child: const Text("NO")),
        ],
      );
    });
  }

  void alertaBorrado(int indice) {
    showDialog(context: context, builder: (builder){
      return AlertDialog(
        title: Text("ATENCION"),
        content: Text("¿Borrar a ${estudiantes[indice]}?"),
        actions: [
          TextButton(onPressed: (){
            setState(() {
              estudiantes.remove(estudiantes[indice]);
            });
            Navigator.pop(context);
          }, child: Text("SI")),
          TextButton(onPressed: (){Navigator.pop(context);}, child: Text("NO"))
        ],
      );
    });
  }
}
