class Bodeguero {
  String apellido;
  String cedula;
  String celular;
  String correo;
  String idBodeguero;
  String nombre;
  int edad;

  Bodeguero({
    required this.apellido,
    required this.cedula,
    required this.celular,
    required this.correo,
    required this.idBodeguero,
    required this.nombre,
    required this.edad,
  });

  void consultaExistencias(String nombre) {}

  void generaReportes(Producto producto) {}

  void modificarDetalle(String nombre) {}

  void seleccionaProducto(String nombre) {}

  void verificarEstado() {}

  void verificarExistencias() {}
}
