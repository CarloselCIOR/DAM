//Esta es la clase modelo
class Conyugue{
  int? idconyugue;
  String? nombre;
  String? telefono;
  int? idtrabajador;


  Conyugue({
    this.idconyugue,
    this.nombre,
    this.telefono,
    this.idtrabajador
  });

  Map<String, dynamic> toMap(){
    return {
      'idconyugue' : idconyugue,
      'nombre' : nombre,
      'telefono' : telefono,
      'idtrabajador' : idtrabajador
    };
  }

  @override
  String toString() {
    return 'Conyugue{idconyugue: $idconyugue, nombre: $nombre, telefono: $telefono, idtrabajador: $idtrabajador}';
  }
}