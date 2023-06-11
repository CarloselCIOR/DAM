//Esta es la clase modelo
class Servicio{
  int? idservicio;
  String? fecha;
  String? placa;
  int? km;
  double? costo;

  Servicio({
    this.idservicio,
    this.fecha,
    this.placa,
    this.km,
    this.costo
  });

  Map<String, dynamic> toMap(){
    return {
      'idservicio' : idservicio,
      'fecha' : fecha,
      'placa' : placa,
      'km' : km,
      'costo' : costo,
    };
  }

  @override
  String toString() {
    return 'Servicio{idservicio: $idservicio, fecha: $fecha, placa: $placa, km: $km, costo: $costo}';
  }
}
