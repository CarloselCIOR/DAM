import 'package:dam_u3_ejercicio4_sqlite/basededatos.dart';
import 'package:dam_u3_ejercicio4_sqlite/capturar.dart';
import 'package:flutter/material.dart';
import 'estudiante.dart';

class Programa extends StatefulWidget {
  const Programa({Key? key}) : super(key: key);

  @override
  State<Programa> createState() => _ProgramaState();
}

class _ProgramaState extends State<Programa> {
  List<Estudiante> todosEstudiantes = [];

  @override
  void initState(){
    //TODO: implement initState
    super.initState();
    actualizarLista();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SQLITE"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: todosEstudiantes.length,

        itemBuilder: (itemBuilder, index){
          return InkWell(
            onTap: (){
              mostrarAlerta(index);
            },
            child: ListTile(
              title: Text(todosEstudiantes[index].nombre),
              subtitle: Text(todosEstudiantes[index].carrera),
              trailing: Text(todosEstudiantes[index].id),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (builder)=>Capturar())).then((value) => actualizarLista());
      },
        child: Icon(Icons.add),
      ),
    );
  }

  void actualizarLista() async {
    List<Estudiante> temporal = await DB.consultarTodos();
    setState(() {
      todosEstudiantes = temporal;
    });
  }

  void mostrarAlerta(int index) {
    showDialog(context: context, builder: (builder){
      return AlertDialog(
        title: Text("ATENCIÓN"),
        content: Text("¿QUE DESEA HACER CON ${todosEstudiantes[index].nombre}?"),
        actions: [
          TextButton(onPressed: (){
            _mostrarModal(index);
            //PONERLO EN UN MODAL showModalBottomSheet(context: context, builder: builder)
          }, child: const Text("ACTUALIZAR")),
          TextButton(onPressed: (){
            DB.eliminar(todosEstudiantes[index].id).then((value) => actualizarLista());
            Navigator.pop(context);
          }, child: const Text("ELIMINAR")),
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: const Text("NADA")),
        ],
      );
    });
  }


  void _mostrarModal(int index) {
    final idcontroller = TextEditingController();
    final nombrecontroller = TextEditingController();
    final carreracontroller = TextEditingController();


    idcontroller.text = todosEstudiantes[index].id;
    nombrecontroller.text = todosEstudiantes[index].nombre;
    carreracontroller.text = todosEstudiantes[index].carrera;

    showModalBottomSheet(
        elevation: 5,
        context: context,
        isScrollControlled: true,
        builder: (builder){
          return Container(
            padding: EdgeInsets.only(
                top: 15,
                left: 30,
                right: 30,
                bottom: MediaQuery.of(context).viewInsets.bottom+50
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(controller: nombrecontroller),
                SizedBox(height: 10,),
                TextField(controller: carreracontroller),
                SizedBox(height: 10,),
                FilledButton(onPressed: (){
                  todosEstudiantes[index].nombre = nombrecontroller.text;
                  todosEstudiantes[index].carrera = carreracontroller.text;
                  DB.actualizar(todosEstudiantes[index]).then((value) => actualizarLista());
                  Navigator.pop(context);
                  Navigator.pop(context);
                }, child: Text("Guardar Cambios")),
              ],
            ),
          );
        });
  }

}
