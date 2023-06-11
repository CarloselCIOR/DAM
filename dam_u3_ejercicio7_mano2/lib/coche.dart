//Esta es la clase modelo
class Coche{
  String? placa;
  String? marca;
  String? modelo;
  int? anho;
  int? idpropietario;

  Coche({
    this.placa,
    this.marca,
    this.modelo,
    this.anho,
    this.idpropietario
  });

  Map<String, dynamic> toMap(){
    return {
      'placa' : placa,
      'marca' : marca,
      'modelo' : modelo,
      'anho' : anho,
      'idpropietario' : idpropietario,
    };
  }

  @override
  String toString() {
    return 'Coche{placa: $placa, marca: $marca, modelo: $modelo, anho: $anho, idpropietario: $idpropietario}';
  }
}
