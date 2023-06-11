import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Dog {
  int id;
  String name;
  int age;

  Dog({this.id, this.name, this.age});

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'age': age};
  }

  static Dog fromMap(Map<String, dynamic> map) {
    return Dog(id: map['id'], name: map['name'], age: map['age']);
  }
}

class DogDatabase {
  static final DogDatabase instance = DogDatabase._init();

  static Database _database;

  DogDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDB('dogs.db');
    return _database;
  }

  Future<Database> _initDB(String filePath) async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $tableDogs (
  ${DogFields.id} $idType,
  ${DogFields.name} $textType,
  ${DogFields.age} $integerType
)
''');
  }

  Future<Dog> create(Dog dog) async {
    final db = await instance.database;

    final id = await db.insert(tableDogs, dog.toMap());
    return dog.copy(id: id);
  }

  Future<Dog> read(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableDogs,
      columns: DogFields.values,
      where: '${DogFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Dog.fromMap(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Dog>> readAll() async {
    final db = await instance.database;

    final orderBy = '${DogFields.age} ASC';
    final result = await db.query(tableDogs, orderBy: orderBy);

    return result.map((json) => Dog.fromMap(json)).toList();
  }

  Future<void> update(Dog dog) async {
    final db = await instance.database;

    await db.update(
      tableDogs,
      dog.toMap(),
      where: '${DogFields.id} = ?',
      whereArgs: [dog.id],
    );
  }

  Future<void> delete(int id) async {
    final db = await instance.database;

    await db.delete(
      tableDogs,
      where: '${DogFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}

class DogFields {
  static final List<String> values = [id, name, age];

  static final String id = 'id';
  static final String name = 'name';
  static final String age = 'age';
}

final String tableDogs = 'dogs';