//Esta es la clase modelo
class Estudiante{
  String id;
  String nombre;
  String carrera;

  Estudiante({required this.id, required this.nombre, required this.carrera});

  Map<String, dynamic> toMap(){
    return {
      'id' : id,
      'nombre' : nombre,
      'carrera' : carrera
    };
  }
}