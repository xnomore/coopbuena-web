<?php

/*
// index.php (o cualquier otro nombre)

require_once 'Controlador.php';

$controlador = new Controlador();

// Crear un nuevo producto
$controlador->crearProducto("Producto 1", "Descripción del producto 1", 19.99);

// Leer un producto por su ID
$producto = $controlador->obtenerProducto(1);
print_r($producto);

// Editar un producto
$controlador->actualizarProducto(1, "Producto 1 (editado)", "Nueva descripción", 24.99);

// Buscar productos por nombre
$productosEncontrados = $controlador->buscarProducto("Producto");
print_r($productosEncontrados);

// Eliminar un producto
$controlador->eliminarProducto(1);

*/

class Index
{
  //private $parameter;

  public function __construct()
  {
    if (isset($_GET['param'])) {
      $p = $_GET['param'];
      //echo "Valor del parámetro: " . $p;

      $this->router($p);
    } else {
      echo "No hay parametro";
    }
  }

  public function router($functionToCall)
  {
    switch ($functionToCall) {
      case "login":
        echo "Seleccionaste la opción login";
        break;
      case "register":
        echo "Seleccionaste la opción register";
        break;
      case "createUser":
        echo "Seleccionaste la opción createUser";
        break;
      default:
        echo "Opción no válida... Volver o algo así";
        break;
    }
  }
}


$app = new Index();
