import 'package:firebase/firebase.dart' as fb;
import 'bodeguero.dart';
import 'producto.dart';

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

  Future<List<Producto>> retornarListaProducto() async {
    List<Producto> listaProductos = [];
    try {
      fb.DatabaseReference ref =
          fb.database().ref('bodegas/$idBodega/productos');
      fb.DataSnapshot snapshot = await ref.once('value');
      Map<dynamic, dynamic> data = snapshot.val();

      data.forEach((key, value) {
        Producto producto = Producto(); // Instancia del producto
        // Lógica para asignar valores al producto desde 'value'
        listaProductos.add(producto);
      });
    } catch (e) {
      print('Error al obtener la lista de productos: $e');
    }
    return listaProductos;
  }

  // Suponiendo una lista de productos asociados a la bodega
  List<Producto> listaProductos = [];

  void comprobarExistencias(Producto producto) {
    bool existe =
        listaProductos.any((p) => p.idProducto == producto.idProducto);
    if (existe) {
      print('El producto ${producto.nombre} existe en la bodega.');
    } else {
      print('El producto ${producto.nombre} no está en la bodega.');
    }
  }

  double retornarStock() {
    double stockTotal = 0;
    for (Producto producto in listaProductos) {
      stockTotal += producto.cantidad;
    }
    return stockTotal;
  }

  void actualizaStock(Producto producto, double nuevaCantidad) {
    Producto productoEnBodega = listaProductos.firstWhere(
      (p) => p.idProducto == producto.idProducto,
      orElse: () =>
          Producto(bodega: this), // Instancia de Producto si no existe
    );

    productoEnBodega.cantidad = nuevaCantidad;
    // Podrías también actualizar esta información en la base de datos
  }

  void generaReportes(Producto producto) {
    // Supongamos que se genera un reporte en un formato específico para un producto
    print('Generando reporte para ${producto.nombre}');
    print('Descripción: ${producto.descripcion}');
    print('Cantidad en stock: ${producto.cantidad}');
    // Otros detalles relevantes del producto para el reporte
  }

  void enviarConfirmacion() {
    // Supongamos que aquí se envía una confirmación al responsable de la bodega
    print(
        'Enviando confirmación al responsable ${responsableBodega.nombre}...');
    // Código para enviar la confirmación al responsable (correo electrónico, notificación, etc.)
  }
}
