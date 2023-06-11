import 'package:dam_u3_ejercicio4_sqlite/estudiante.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

//Controlador

class DB{
  static Future<Database> _abrirBase() async{
    return openDatabase(
        join(await getDatabasesPath(), "poto.db"),
        onCreate: (db, version){
          return db.execute(("CREATE TABLE ESTUDIANTE(ID TEXT PRIMARY KEY, NOMBRE TEXT, CARRERA TEXT)"));
        },
        version: 1
    );
  }

  static Future<int> insertar(Estudiante e) async{
    Database base = await _abrirBase();
    return base.insert(
        'ESTUDIANTE', e.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Estudiante>> consultarTodos() async{
    Database base = await _abrirBase();
    final List<Map<String, dynamic>> mapaEstudiantes = await base.query("ESTUDIANTE");

    return List.generate(mapaEstudiantes.length, (index) => Estudiante(
        id: mapaEstudiantes[index]['ID'],
        nombre: mapaEstudiantes[index]['NOMBRE'],
        carrera: mapaEstudiantes[index]['CARRERA']
      )
    );
  }

  static Future<int> eliminar(String id) async{
    Database base = await _abrirBase();
    return base.delete("ESTUDIANTE", where: "ID = ?", whereArgs: [id]);
  }

  static Future<int> actualizar(Estudiante e) async{
    Database base = await _abrirBase();
    return base.update("ESTUDIANTE", e.toMap(), where: "ID = ?", whereArgs: [e.id]);
  }
}
