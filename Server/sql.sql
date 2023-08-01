-- Active: 1667021275653@@127.0.0.1@3306
CREATE DATABASE coopbuena-web;

CREATE TABLE usuarios (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  apellido VARCHAR(50) NOT NULL,
  correo_electronico VARCHAR(100) NOT NULL UNIQUE,
  cedula VARCHAR(13) NOT NULL UNIQUE,
  celular_personal VARCHAR(20) NOT NULL UNIQUE,
  telefono_local VARCHAR(20),
  direccion VARCHAR(100) NOT NULL,
  fecha_nacimiento DATE,
  genero ENUM('masculino', 'femenino'),
  estado_civil ENUM('Solter@', 'Casad@', 'Compromiso', 'Unión libre', 'Divorciad@', 'Viud@'),
  ocupacion ENUM('Emplead@', 'Empresari@', 'Emprendedor(a)', 'Estudiante'),
  usuario VARCHAR(255) NOT NULL UNIQUE,
  contrasena VARCHAR(255) NOT NULL,
  rol ENUM('administrador', 'empleado', 'cliente'),
  fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  ultimo_cambio_contrasena TIMESTAMP NULL DEFAULT NULL,
  ultima_sesion TIMESTAMP NULL DEFAULT NULL,
  agregado_por INT NULL DEFAULT NULL
);

CREATE TABLE cuentas (
  id INT PRIMARY KEY AUTO_INCREMENT,
  numero_cuenta VARCHAR(20) NOT NULL,
  tipo_cuenta ENUM('corriente', 'ahorros') NOT NULL,
  saldo DECIMAL(10, 2) NOT NULL,
  titular INT NOT NULL,
  fecha_apertura DATE NOT NULL,
  estado ENUM('actuva', 'inactiva', 'bloqueada') NOT NULL,
  fecha_cierre DATE,
  FOREIGN KEY (titular) REFERENCES usuarios(id)
);

CREATE TABLE transacciones (
  id INT PRIMARY KEY AUTO_INCREMENT,
  cuenta_origen_id INT,
  cuenta_destino_id INT NOT NULL,
  monto DECIMAL(10, 2) NOT NULL,
  tipo_transaccion ENUM('deposito', 'retiro', 'transferencia', 'pago_compra') NOT NULL,
  fecha_transaccion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  usuario_id INT NOT NULL,
  FOREIGN KEY (cuenta_origen_id) REFERENCES cuentas(id),
  FOREIGN KEY (cuenta_destino_id) REFERENCES cuentas(id),
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

CREATE TABLE prestamos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  usuario_id INT NOT NULL,
  monto DECIMAL(10, 2) NOT NULL,
  tasa_interes DECIMAL(5, 2) NOT NULL,
  plazo_meses INT NOT NULL,
  cuota_mensual DECIMAL(10, 2) NOT NULL,
  fecha_solicitud DATE NOT NULL,
  fecha_aprobacion DATE,
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

CREATE TABLE pagos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  usuario_id INT NOT NULL,
  monto DECIMAL(10, 2) NOT NULL,
  concepto VARCHAR(100) NOT NULL,
  fecha_pago DATE NOT NULL,
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

CREATE TABLE notificaciones (
  id INT PRIMARY KEY AUTO_INCREMENT,
  usuario_id INT NOT NULL,
  mensaje TEXT NOT NULL,
  fecha_envio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  leida BOOLEAN NOT NULL DEFAULT false,
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

CREATE TABLE solicitudes (
  id INT PRIMARY KEY AUTO_INCREMENT,
  usuario_id INT NOT NULL,
  tipo_solicitud ENUM('cambio_cuenta', 'nuevo_prestamo', 'otro') NOT NULL,
  descripcion TEXT NOT NULL,
  interes DECIMAL(2, 2),
  fecha_solicitud DATE NOT NULL,
  estado ENUM('pendiente', 'aprobada', 'rechazada') NOT NULL,
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);
