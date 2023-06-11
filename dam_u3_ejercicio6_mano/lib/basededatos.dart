import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'trabajador.dart';
import 'conyugue.dart';

class DB {
  static Future<Database> _abrirBase() async {
    return openDatabase(join(await getDatabasesPath(), 'ejercicio3.db'),
        onCreate: (db, version) async {
          await db.execute('''
            CREATE TABLE trabajador (
              idtrabajador INTEGER PRIMARY KEY AUTOINCREMENT,
              nombre TEXT,
              domicilio TEXT,
              puesto TEXT,
              sueldo REAL
            )
          ''');

          await db.execute('''
            CREATE TABLE conyugue (
              idconyugue INTEGER PRIMARY KEY AUTOINCREMENT,
              nombre TEXT,
              telefono TEXT,
              idtrabajador INTEGER,
              FOREIGN KEY (idtrabajador) REFERENCES trabajador(idtrabajador)
            )
          ''');
        }, version: 1);
  }

  static Future<int> insertarTrabajador(Trabajador t) async {
    Database base = await _abrirBase();
    return base.insert("trabajador", t.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Trabajador>> consultaTodosTrabajadores() async {
    Database base = await _abrirBase();
    final List<Map<String, dynamic>> mapaTrabajadores = await base.query("trabajador");

    return List.generate(mapaTrabajadores.length,
            (index) => Trabajador(
          idtrabajador: mapaTrabajadores[index]['idtrabajador'],
          nombre: mapaTrabajadores[index]['nombre'],
          domicilio: mapaTrabajadores[index]['domicilio'],
          puesto: mapaTrabajadores[index]['puesto'],
          sueldo: mapaTrabajadores[index]['sueldo'],
        ));
  }

  static Future<int> eliminarTrabajador(int id) async {
    Database base = await _abrirBase();
    return base.delete("trabajador", where: "idtrabajador = ?", whereArgs: [id]);
  }

  static Future<int> actualizarTrabajador(Trabajador t) async {
    Database base = await _abrirBase();
    return base.update("trabajador", t.toMap(),
        where: "idtrabajador = ?", whereArgs: [t.idtrabajador]);
  }

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  static Future<int> insertarConyugue(Conyugue c) async {
    Database base = await _abrirBase();
    return base.insert("conyugue", c.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Conyugue>> consultaTodosConyugues() async {
    Database base = await _abrirBase();
    final List<Map<String, dynamic>> mapaConyugues = await base.query("conyugue");

    return List.generate(mapaConyugues.length,
            (index) => Conyugue(
          idconyugue: mapaConyugues[index]['idconyugue'],
          nombre: mapaConyugues[index]['nombre'],
          telefono: mapaConyugues[index]['telefono'],
          idtrabajador: mapaConyugues[index]['idtrabajador'],
        ));
  }

  static Future<int> eliminarConyugue(int id) async {
    Database base = await _abrirBase();
    return base.delete("conyugue", where: "idconyugue = ?", whereArgs: [id]);
  }

  static Future<int> actualizarConyugue(Conyugue c) async {
    Database base = await _abrirBase();
    return base.update("conyugue", c.toMap(),
        where: "idconyugue = ?", whereArgs: [c.idconyugue]);
  }


}