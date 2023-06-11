import 'package:dam_u3_ejercicio6_mano/basededatos.dart';
import 'package:dam_u3_ejercicio6_mano/captura1.dart';
import 'package:flutter/material.dart';
import 'trabajador.dart';

class Programa extends StatefulWidget {
  const Programa({Key? key}) : super(key: key);

  @override
  State<Programa> createState() => _ProgramaState();
}

class _ProgramaState extends State<Programa> {
  List<Trabajador> todosTrabajador = [];
//  int idtrabajador;
//   String nombre;
//   String domicilio;
//   String puesto;
//   double sueldo;

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
        title: Text("TRABAJADORES"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: todosTrabajador.length,

        itemBuilder: (itemBuilder, index){
          return InkWell(
            onTap: (){
              mostrarAlerta(index);
            },
            child: ListTile(
              title: Text(todosTrabajador[index].nombre.toString()),
              subtitle: Text(todosTrabajador[index].domicilio.toString() + ' - ' + todosTrabajador[index].puesto.toString()),
              trailing: Text("Sueldo: \$" + todosTrabajador[index].sueldo.toString() + ' - ID: '+ todosTrabajador[index].idtrabajador.toString()),
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
    List<Trabajador> temporal = await DB.consultaTodosTrabajadores();
    setState(() {
      todosTrabajador = temporal;
    });
  }

  void mostrarAlerta(int index) {
    showDialog(context: context, builder: (builder){
      return AlertDialog(
        title: Text("ATENCIÓN"),
        content: Text("¿QUE DESEA HACER CON ${todosTrabajador[index].nombre}?"),
        actions: [
          TextButton(onPressed: (){
            _mostrarModal(index);
            //PONERLO EN UN MODAL showModalBottomSheet(context: context, builder: builder)
          }, child: const Text("ACTUALIZAR")),
          TextButton(onPressed: (){
            DB.eliminarTrabajador(todosTrabajador[index].idtrabajador as int).then((value) => actualizarLista());
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
    final idtrabajadorController = TextEditingController();
    final nombrecontroller = TextEditingController();
    final domicilioController = TextEditingController();
    final puestoController = TextEditingController();
    final sueldoController = TextEditingController();


    idtrabajadorController.text = todosTrabajador[index].idtrabajador.toString();
    nombrecontroller.text = todosTrabajador[index].nombre.toString();
    domicilioController.text = todosTrabajador[index].domicilio.toString();
    puestoController.text = todosTrabajador[index].puesto.toString();
    sueldoController.text = todosTrabajador[index].sueldo.toString();

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
                TextField(controller: domicilioController),
                SizedBox(height: 10,),
                TextField(controller: puestoController),
                SizedBox(height: 10,),
                TextField(controller: sueldoController),
                SizedBox(height: 10,),

                FilledButton(onPressed: (){
                  todosTrabajador[index].nombre = nombrecontroller.text;
                  todosTrabajador[index].domicilio = domicilioController.text;
                  todosTrabajador[index].puesto = puestoController.text;
                  todosTrabajador[index].sueldo = double.parse(sueldoController.text);
                  DB.actualizarTrabajador(todosTrabajador[index]).then((value) => actualizarLista());
                  Navigator.pop(context);
                  Navigator.pop(context);
                }, child: Text("Guardar Cambios")),
              ],
            ),
          );
        });
  }

}
