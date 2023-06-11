//Esta es la clase modelo

class Persona{
  int id; //INT, Primary key, Autoincrement
  String nombre; //TEXT
  double sueldo; //DECIMAL
  int edad; //INT

  Persona({required this.id, required this.nombre, required this.sueldo, required this.edad});

  Map<String, dynamic> toMap(){
    return {
      'id' : id,
      'nombre' : nombre,
      'sueldo' : sueldo,
      'edad' : edad,
    };
  }
}