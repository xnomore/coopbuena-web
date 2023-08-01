<?php

// Modelo.php

class Modelo {
  private $conexion;

  public function __construct() {
      // Establecer la conexión con la base de datos (puedes utilizar mysqli, PDO, etc.)
      $this->conexion = new mysqli('localhost', 'usuario', 'contraseña', 'basedatos');
      if ($this->conexion->connect_errno) {
          die("Error al conectar con la base de datos: " . $this->conexion->connect_error);
      }
  }

  public function crearProducto($nombre, $descripcion, $precio) {
      // Código para insertar un nuevo producto en la base de datos
      $sql = "INSERT INTO productos (nombre, descripcion, precio) VALUES (?, ?, ?)";
      $stmt = $this->conexion->prepare($sql);
      $stmt->bind_param("sss", $nombre, $descripcion, $precio);
      $stmt->execute();
      $stmt->close();
  }

  public function leerProducto($id) {
      // Código para obtener un producto por su ID desde la base de datos
      $sql = "SELECT * FROM productos WHERE id = ?";
      $stmt = $this->conexion->prepare($sql);
      $stmt->bind_param("i", $id);
      $stmt->execute();
      $resultado = $stmt->get_result()->fetch_assoc();
      $stmt->close();
      return $resultado;
  }

  public function editarProducto($id, $nombre, $descripcion, $precio) {
      // Código para actualizar un producto en la base de datos
      $sql = "UPDATE productos SET nombre = ?, descripcion = ?, precio = ? WHERE id = ?";
      $stmt = $this->conexion->prepare($sql);
      $stmt->bind_param("sssi", $nombre, $descripcion, $precio, $id);
      $stmt->execute();
      $stmt->close();
  }

  public function eliminarProducto($id) {
      // Código para eliminar un producto de la base de datos por su ID
      $sql = "DELETE FROM productos WHERE id = ?";
      $stmt = $this->conexion->prepare($sql);
      $stmt->bind_param("i", $id);
      $stmt->execute();
      $stmt->close();
  }

  public function buscarProducto($nombre) {
      // Código para buscar productos en la base de datos por nombre
      $sql = "SELECT * FROM productos WHERE nombre LIKE ?";
      $stmt = $this->conexion->prepare($sql);
      $nombre = "%" . $nombre . "%";
      $stmt->bind_param("s", $nombre);
      $stmt->execute();
      $resultado = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
      $stmt->close();
      return $resultado;
  }

  public function __destruct() {
      // Cerrar la conexión con la base de datos al destruir el objeto
      $this->conexion->close();
  }
}
