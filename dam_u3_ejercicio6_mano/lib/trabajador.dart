//Esta es la clase modelo
class Trabajador{
  int? idtrabajador;
  String? nombre;
  String? domicilio;
  String? puesto;
  double? sueldo;

  Trabajador({
    this.idtrabajador,
    this.nombre,
    this.domicilio,
    this.puesto,
    this.sueldo
  });

  Map<String, dynamic> toMap(){
    return {
      'idtrabajador' : idtrabajador,
      'nombre' : nombre,
      'domicilio' : domicilio,
      'puesto' : puesto,
      'sueldo' : sueldo,
    };
  }

  @override
  String toString() {
    return 'Trabajador{idtrabajador: $idtrabajador, nombre: $nombre, domicilio: $domicilio, puesto: $puesto, sueldo: $sueldo}';
  }
}
