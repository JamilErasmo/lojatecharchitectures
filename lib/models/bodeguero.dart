import 'producto.dart';
import 'package:firebase/firebase.dart' as fb;

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

  final fb.DatabaseReference _db = fb.database().ref('bodegueros');

  Future<void> consultaExistencias(String nombre) async {
    try {
      fb.DatabaseReference productoRef = _db.child('productos').child(nombre);
      fb.DataSnapshot snapshot = await productoRef.once('value');
      // Lógica para consultar existencias de un producto específico
      // Acceder a snapshot.val() para obtener los datos del producto
      print('Consultando existencias del producto $nombre...');
    } catch (e) {
      print('Error al consultar existencias: $e');
    }
  }

  Future<void> buscarProducto() async {
    try {
      fb.DatabaseReference productosRef = _db.child('productos');
      fb.DataSnapshot snapshot = await productosRef.once('value');
      // Lógica para buscar productos en la base de datos
      // Acceder a snapshot.val() para obtener la lista de productos
      print('Buscando productos...');
    } catch (e) {
      print('Error al buscar productos: $e');
    }
  }

  Future<void> buscarBodeda() async {
    try {
      fb.DatabaseReference bodegasRef = _db.child('bodegas');
      fb.DataSnapshot snapshot = await bodegasRef.once('value');
      // Lógica para buscar bodegas en la base de datos
      // Acceder a snapshot.val() para obtener la lista de bodegas
      print('Buscando bodegas...');
    } catch (e) {
      print('Error al buscar bodegas: $e');
    }
  }

  Future<void> ingresarCatidadRetirar(String producto, double cantidad) async {
    try {
      fb.DatabaseReference productoRef = _db.child('productos').child(producto);
      await productoRef.update({'cantidad': cantidad});
      print('Cantidad actualizada del producto $producto.');
    } catch (e) {
      print('Error al ingresar cantidad a retirar: $e');
    }
  }

  Future<void> asignarBodega(String producto, String bodega) async {
    try {
      fb.DatabaseReference productoRef = _db.child('productos').child(producto);
      await productoRef.update({'bodega': bodega});
      print('Bodega asignada al producto $producto.');
    } catch (e) {
      print('Error al asignar bodega: $e');
    }
  }

  Future<void> revizarEstadoProducto(String producto) async {
    try {
      fb.DatabaseReference productoRef = _db.child('productos').child(producto);
      fb.DataSnapshot snapshot = await productoRef.once('value');
      // Lógica para revisar el estado de un producto específico
      // Acceder a snapshot.val() para obtener los datos del producto
      print('Revisando estado del producto $producto...');
    } catch (e) {
      print('Error al revisar estado del producto: $e');
    }
  }

  Future<void> generarOrdenSalida(List<Producto> productos) async {
    try {
      fb.DatabaseReference ordenSalidaRef = _db.child('ordenes_salida');
      for (Producto producto in productos) {
        ordenSalidaRef.push().set({
          'producto': producto.nombre,
          'cantidad': producto.cantidad,
          // Otros detalles de la orden de salida que desees almacenar
        });
      }
      print('Orden de salida generada para los productos.');
    } catch (e) {
      print('Error al generar la orden de salida: $e');
    }
  }

  Future<void> guardarProducto(Producto producto) async {
    try {
      fb.DatabaseReference productoRef =
          _db.child('productos').child(producto.nombre);
      await productoRef.set({
        'cantidad': producto.cantidad,
        'descripcion': producto.descripcion,
        // Otros detalles del producto que desees guardar
      });
      print('Producto guardado en la base de datos.');
    } catch (e) {
      print('Error al guardar el producto: $e');
    }
  }

  Future<void> generaReportes(Producto producto) async {
    try {
      fb.DatabaseReference productoRef =
          _db.child('productos').child(producto.nombre);
      fb.DataSnapshot snapshot = await productoRef.once('value');
      // Lógica para generar reportes del producto
      // Acceder a snapshot.val() para obtener los datos del producto
      print('Generando reportes para el producto ${producto.nombre}');
    } catch (e) {
      print('Error al generar reportes: $e');
    }
  }

  Future<void> modificarDetalle(String nombre) async {
    try {
      fb.DatabaseReference productoRef = _db.child('productos').child(nombre);
      // Lógica para modificar detalles del producto
      await productoRef.update({'detalle': 'nuevo detalle'});
      print('Detalles del producto $nombre modificados.');
    } catch (e) {
      print('Error al modificar detalles: $e');
    }
  }

  Future<void> seleccionaProducto(String nombre) async {
    try {
      fb.DatabaseReference productoRef = _db.child('productos').child(nombre);
      fb.DataSnapshot snapshot = await productoRef.once('value');
      // Lógica para seleccionar un producto
      // Acceder a snapshot.val() para obtener los datos del producto
      print('Seleccionando el producto $nombre...');
    } catch (e) {
      print('Error al seleccionar producto: $e');
    }
  }

  Future<void> verificarEstado() async {
    try {
      fb.DatabaseReference productosRef = _db.child('productos');
      fb.DataSnapshot snapshot = await productosRef.once('value');
      // Lógica para verificar el estado
      // Acceder a snapshot.val() para obtener los datos y verificar el estado
      print('Verificando estado...');
    } catch (e) {
      print('Error al verificar estado: $e');
    }
  }

  Future<void> verificarExistencias() async {
    try {
      fb.DatabaseReference productosRef = _db.child('productos');
      fb.DataSnapshot snapshot = await productosRef.once('value');
      // Lógica para verificar existencias de productos
      // Acceder a snapshot.val() para obtener los datos y verificar existencias
      print('Verificando existencias...');
    } catch (e) {
      print('Error al verificar existencias: $e');
    }
  }
}
