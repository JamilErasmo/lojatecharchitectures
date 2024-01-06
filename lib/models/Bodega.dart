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

class Producto {
  Bodega bodega;
  double cantidad;
  String codigo;
  String descripcion;
  DateTime fechaCaducidad;
  DateTime fechaElaboracion;
  String idProducto;
  String nombre;
  double precio;
  Proveedor proveedor;

  Producto({
    required this.bodega,
    required this.cantidad,
    required this.codigo,
    required this.descripcion,
    required this.fechaCaducidad,
    required this.fechaElaboracion,
    required this.idProducto,
    required this.nombre,
    required this.precio,
    required this.proveedor,
  });

  // Métodos de la clase Producto
  void actualizarDetalle(String nombre) {}

  String retornaEstado(String nombre) {
    return "";
  }

  Map<String, dynamic> retornarDatos() {
    return {};
  }
}

class Proveedor {
  String celular;
  String correo;
  String idProveedor;
  String nombre;
  String nombreContacto;

  Proveedor({
    required this.celular,
    required this.correo,
    required this.idProveedor,
    required this.nombre,
    required this.nombreContacto,
  });
}

class Medicamento {
  String contradicciones;
  String indicaciones;
  String tipoMedicamento;

  Medicamento({
    required this.contradicciones,
    required this.indicaciones,
    required this.tipoMedicamento,
  });
}

class InsumoMedico {
  int registroSanitario;
  String tipoInsumoM;

  InsumoMedico({
    required this.registroSanitario,
    required this.tipoInsumoM,
  });
}

class Dispositivo {
  String dispositivoCalidad;
  String tipoDispositivo;

  Dispositivo({
    required this.dispositivoCalidad,
    required this.tipoDispositivo,
  });
}
