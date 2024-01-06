class Bodega {
  int capacidadAlmacenamiento;
  String idBodega;
  String nombre;
  Bodeguero responsableBodega;
  String ubicacion;

  Bodega({
    required this.capacidadAlmacenamiento,
    required this.idBodega,
    required this.nombre,
    required this.responsableBodega,
    required this.ubicacion,
  });

  // Métodos de la clase Bodega
  void actualizaStock() {}

  void comprobarExistencias() {}

  void enviarConfirmacion() {}

  void generaReportes(Producto producto) {}

  List<Producto> retornarListaProduc() {
    return [];
  }
}
