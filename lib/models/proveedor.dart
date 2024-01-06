import 'producto.dart';

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

  Future<void> retornarDetalleProducto() async {
    // Lógica para obtener detalles del producto del proveedor
    String idProducto = "12345";
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentSnapshot productoSnapshot =
        await firestore.collection('productos').doc(idProducto).get();
    // hay que cambiar los nombres y ver si ta bien xD..
    if (productoSnapshot.exists) {
      Map<String, dynamic> data = productoSnapshot.data();
      Producto producto = Producto(
        idProducto: idProducto,
        idCategoria: data['idCategoria'],
        codigo: data['codigo'],
        nombre: data['nombre'],
        fechaCaducidad: data['fechaCaducidad'],
        fechaElavoracion: data['fechaElavoracion'],
        descipcion: data['descipcion'],
        precio: data['precio'],
        cantidad: data['cantidad'],
        dodega: data['dodega'],
        provedor: Proveedor(idProveedor: data['provedor']),
      );

      print("Detalles del producto: ${producto.nombre}");
    } else {
      print("No se encontró el producto con el ID: $idProducto");
    }
  }
}
