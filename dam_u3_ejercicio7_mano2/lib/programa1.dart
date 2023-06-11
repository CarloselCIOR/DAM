import 'package:dam_u3_ejercicio7_mano2/basededatos.dart';
import 'package:dam_u3_ejercicio7_mano2/captura1.dart';
import 'package:flutter/material.dart';
import 'propietario.dart';

class Programa extends StatefulWidget {
  const Programa({Key? key}) : super(key: key);

  @override
  State<Programa> createState() => _ProgramaState();
}

class _ProgramaState extends State<Programa> {
  List<Propietario> todosPropietario = [];
//   int? idpropietario;
//   String? nombre;
//   String? telefono;
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
        title: Text("PROPIETARIOS"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: todosPropietario.length,

        itemBuilder: (itemBuilder, index){
          return InkWell(
            onTap: (){
              mostrarAlerta(index);
            },
            child: ListTile(
              title: Text(todosPropietario[index].nombre.toString()),
              subtitle: Text(todosPropietario[index].telefono.toString()),
              trailing: Text(todosPropietario[index].idpropietario.toString()),
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
    List<Propietario> temporal = await DB.consultaTodosPropietario();
    setState(() {
      todosPropietario = temporal;
    });
  }

  void mostrarAlerta(int index) {
    showDialog(context: context, builder: (builder){
      return AlertDialog(
        title: Text("ATENCIÓN"),
        content: Text("¿QUE DESEA HACER CON ${todosPropietario[index].nombre}?"),
        actions: [
          TextButton(onPressed: (){
            _mostrarModal(index);
            //PONERLO EN UN MODAL showModalBottomSheet(context: context, builder: builder)
          }, child: const Text("ACTUALIZAR")),
          TextButton(onPressed: (){
            DB.eliminarPropietario(todosPropietario[index].idpropietario as int).then((value) => actualizarLista());
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
    final idPropietarioController = TextEditingController();
    final nombrecontroller = TextEditingController();
    final telefonoController = TextEditingController();


    idPropietarioController.text = todosPropietario[index].idpropietario.toString();
    nombrecontroller.text = todosPropietario[index].nombre.toString();
    telefonoController.text = todosPropietario[index].telefono.toString();

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
                bottom: MediaQuery.of(context).viewInsets.bottom+400
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(controller: nombrecontroller),
                SizedBox(height: 10,),
                TextField(controller: telefonoController),
                SizedBox(height: 10,),

                FilledButton(onPressed: (){
                  todosPropietario[index].nombre = nombrecontroller.text;
                  todosPropietario[index].telefono = telefonoController.text;
                  DB.actualizarPropietario(todosPropietario[index]).then((value) => actualizarLista());
                  Navigator.pop(context);
                  Navigator.pop(context);
                }, child: Text("Guardar Cambios")),
              ],
            ),
          );
        });
  }

}
