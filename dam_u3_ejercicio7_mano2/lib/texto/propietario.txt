//Esta es la clase modelo
class Propietario{
  int? idpropietario;
  String? nombre;
  String? telefono;

  Propietario({
    this.idpropietario,
    this.nombre,
    this.telefono,
  });

  Map<String, dynamic> toMap(){
    return {
      'idpropietario' : idpropietario,
      'nombre' : nombre,
      'telefono' : telefono,
    };
  }

  @override
  String toString() {
    return 'Propietario{idpropietario: $idpropietario, nombre: $nombre, telefono: $telefono}';
  }
}
