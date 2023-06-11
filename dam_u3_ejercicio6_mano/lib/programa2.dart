import 'package:dam_u3_ejercicio6_mano/basededatos.dart';
import 'package:dam_u3_ejercicio6_mano/captura2.dart';
import 'package:dam_u3_ejercicio6_mano/conyugue.dart';
import 'package:flutter/material.dart';

class Programa2 extends StatefulWidget {
  const Programa2({Key? key}) : super(key: key);

  @override
  State<Programa2> createState() => _Programa2State();
}

class _Programa2State extends State<Programa2> {
  List<Conyugue> todosConyugue = [];
//  int idconyugue;
//   String nombre;
//   String telefono;
//   int idtrabajador;

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
        title: Text("CONYUGUES"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: todosConyugue.length,

        itemBuilder: (itemBuilder, index){
          return InkWell(
            onTap: (){
              mostrarAlerta(index);
            },
            child: ListTile(
              title: Text(todosConyugue[index].nombre.toString() + ' - ID: ' + todosConyugue[index].idconyugue.toString()),
              subtitle: Text('Telefono: ' + todosConyugue[index].telefono.toString()),
              trailing: Text('Conyugue: ' + todosConyugue[index].idtrabajador.toString()),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (builder)=>Capturar2())).then((value) => actualizarLista());
      },
        child: Icon(Icons.add),
      ),
    );
  }

  void actualizarLista() async {
    List<Conyugue> temporal = await DB.consultaTodosConyugues();
    setState(() {
      todosConyugue = temporal;
    });
  }

  void mostrarAlerta(int index) {
    showDialog(context: context, builder: (builder){
      return AlertDialog(
        title: Text("ATENCIÓN"),
        content: Text("¿QUE DESEA HACER CON ${todosConyugue[index].nombre}?"),
        actions: [
          TextButton(onPressed: (){
            _mostrarModal(index);
            //PONERLO EN UN MODAL showModalBottomSheet(context: context, builder: builder)
          }, child: const Text("ACTUALIZAR")),
          TextButton(onPressed: (){
            DB.eliminarConyugue(todosConyugue[index].idtrabajador as int).then((value) => actualizarLista());
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
    final idConyugueController = TextEditingController();
    final nombrecontroller = TextEditingController();
    final telefonoController = TextEditingController();
    final idTrabajadorController = TextEditingController();


    idConyugueController.text = todosConyugue[index].idconyugue.toString();
    nombrecontroller.text = todosConyugue[index].nombre.toString();
    telefonoController.text = todosConyugue[index].telefono.toString();
    idTrabajadorController.text = todosConyugue[index].idtrabajador.toString();

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
                TextField(controller: telefonoController),
                SizedBox(height: 10,),
                TextField(controller: idTrabajadorController),
                SizedBox(height: 10,),

                FilledButton(onPressed: (){
                  todosConyugue[index].nombre = nombrecontroller.text;
                  todosConyugue[index].telefono = telefonoController.text;
                  todosConyugue[index].idtrabajador = int.parse(idTrabajadorController.text);
                  DB.actualizarConyugue(todosConyugue[index]).then((value) => actualizarLista());
                  Navigator.pop(context);
                  Navigator.pop(context);
                }, child: Text("Guardar Cambios")),
              ],
            ),
          );
        });
  }

}
