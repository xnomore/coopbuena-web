<?php

// Controlador.php

require_once 'Modelo.php';

class Controlador {
    private $modelo;

    public function __construct() {
        $this->modelo = new Modelo();
    }

    public function crearProducto($nombre, $descripcion, $precio) {
        $this->modelo->crearProducto($nombre, $descripcion, $precio);
    }

    public function obtenerProducto($id) {
        return $this->modelo->leerProducto($id);
    }

    public function actualizarProducto($id, $nombre, $descripcion, $precio) {
        $this->modelo->editarProducto($id, $nombre, $descripcion, $precio);
    }

    public function eliminarProducto($id) {
        $this->modelo->eliminarProducto($id);
    }

    public function buscarProducto($nombre) {
        return $this->modelo->buscarProducto($nombre);
    }
}
