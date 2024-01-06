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
