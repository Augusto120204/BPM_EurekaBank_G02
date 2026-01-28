-- eurekabank.Cliente definition

CREATE TABLE `Cliente` (
  `chr_cliecodigo` char(5) NOT NULL,
  `vch_cliepaterno` varchar(25) NOT NULL,
  `vch_cliematerno` varchar(25) NOT NULL,
  `vch_clienombre` varchar(30) NOT NULL,
  `chr_cliedni` char(8) NOT NULL,
  `vch_clieciudad` varchar(30) NOT NULL,
  `vch_cliedireccion` varchar(50) NOT NULL,
  `vch_clietelefono` varchar(20) DEFAULT NULL,
  `vch_clieemail` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`chr_cliecodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- eurekabank.Contador definition

CREATE TABLE `Contador` (
  `vch_conttabla` varchar(30) NOT NULL,
  `int_contitem` int NOT NULL,
  `int_contlongitud` int NOT NULL,
  PRIMARY KEY (`vch_conttabla`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- eurekabank.Credenciales definition

CREATE TABLE `Credenciales` (
  `id_credencial` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(30) NOT NULL,
  `contrasena` varchar(50) NOT NULL,
  PRIMARY KEY (`id_credencial`),
  UNIQUE KEY `U_Credenciales_usuario` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- eurekabank.Empleado definition

CREATE TABLE `Empleado` (
  `chr_emplcodigo` char(4) NOT NULL,
  `vch_emplpaterno` varchar(25) NOT NULL,
  `vch_emplmaterno` varchar(25) NOT NULL,
  `vch_emplnombre` varchar(30) NOT NULL,
  `vch_emplciudad` varchar(30) NOT NULL,
  `vch_empldireccion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`chr_emplcodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- eurekabank.Modulo definition

CREATE TABLE `Modulo` (
  `int_moducodigo` int NOT NULL,
  `vch_modunombre` varchar(50) DEFAULT NULL,
  `vch_moduestado` varchar(15) NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`int_moducodigo`),
  CONSTRAINT `Modulo_chk_1` CHECK ((`vch_moduestado` in (_utf8mb4'ACTIVO',_utf8mb4'ANULADO',_utf8mb4'CANCELADO')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- eurekabank.Moneda definition

CREATE TABLE `Moneda` (
  `chr_monecodigo` char(2) NOT NULL,
  `vch_monedescripcion` varchar(20) NOT NULL,
  PRIMARY KEY (`chr_monecodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- eurekabank.Parametro definition

CREATE TABLE `Parametro` (
  `chr_paracodigo` char(3) NOT NULL,
  `vch_paradescripcion` varchar(50) NOT NULL,
  `vch_paravalor` varchar(70) NOT NULL,
  `vch_paraestado` varchar(15) NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`chr_paracodigo`),
  CONSTRAINT `chk_parametro_vch_paraestado` CHECK ((`vch_paraestado` in (_utf8mb4'ACTIVO',_utf8mb4'ANULADO',_utf8mb4'CANCELADO')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- eurekabank.Sucursal definition

CREATE TABLE `Sucursal` (
  `chr_sucucodigo` char(3) NOT NULL,
  `vch_sucunombre` varchar(50) NOT NULL,
  `vch_sucuciudad` varchar(30) NOT NULL,
  `vch_sucudireccion` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `int_sucucontcuenta` int NOT NULL,
  PRIMARY KEY (`chr_sucucodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- eurekabank.TipoMovimiento definition

CREATE TABLE `TipoMovimiento` (
  `chr_tipocodigo` char(3) NOT NULL,
  `vch_tipodescripcion` varchar(40) NOT NULL,
  `vch_tipoaccion` varchar(10) NOT NULL,
  `vch_tipoestado` varchar(15) NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`chr_tipocodigo`),
  CONSTRAINT `chk_tipomovimiento_vch_tipoaccion` CHECK ((`vch_tipoaccion` in (_utf8mb4'INGRESO',_utf8mb4'SALIDA'))),
  CONSTRAINT `chk_tipomovimiento_vch_tipoestado` CHECK ((`vch_tipoestado` in (_utf8mb4'ACTIVO',_utf8mb4'ANULADO',_utf8mb4'CANCELADO')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- eurekabank.Asignado definition

CREATE TABLE `Asignado` (
  `chr_asigcodigo` char(6) NOT NULL,
  `chr_sucucodigo` char(3) NOT NULL,
  `chr_emplcodigo` char(4) NOT NULL,
  `dtt_asigfechaalta` date NOT NULL,
  `dtt_asigfechabaja` date DEFAULT NULL,
  PRIMARY KEY (`chr_asigcodigo`),
  KEY `idx_asignado01` (`chr_emplcodigo`),
  KEY `idx_asignado02` (`chr_sucucodigo`),
  CONSTRAINT `fk_asignado_empleado` FOREIGN KEY (`chr_emplcodigo`) REFERENCES `Empleado` (`chr_emplcodigo`),
  CONSTRAINT `fk_asignado_sucursal` FOREIGN KEY (`chr_sucucodigo`) REFERENCES `Sucursal` (`chr_sucucodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- eurekabank.CargoMantenimiento definition

CREATE TABLE `CargoMantenimiento` (
  `chr_monecodigo` char(2) NOT NULL,
  `dec_cargMontoMaximo` decimal(12,2) NOT NULL,
  `dec_cargImporte` decimal(12,2) NOT NULL,
  PRIMARY KEY (`chr_monecodigo`),
  KEY `idx_cargomantenimiento01` (`chr_monecodigo`),
  CONSTRAINT `fk_cargomantenimiento_moneda` FOREIGN KEY (`chr_monecodigo`) REFERENCES `Moneda` (`chr_monecodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- eurekabank.CostoMovimiento definition

CREATE TABLE `CostoMovimiento` (
  `chr_monecodigo` char(2) NOT NULL,
  `dec_costimporte` decimal(12,2) NOT NULL,
  PRIMARY KEY (`chr_monecodigo`),
  KEY `idx_costomovimiento` (`chr_monecodigo`),
  CONSTRAINT `fk_costomovimiento_moneda` FOREIGN KEY (`chr_monecodigo`) REFERENCES `Moneda` (`chr_monecodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- eurekabank.Cuenta definition

CREATE TABLE `Cuenta` (
  `chr_cuencodigo` char(8) NOT NULL,
  `chr_monecodigo` char(2) NOT NULL,
  `chr_sucucodigo` char(3) NOT NULL,
  `chr_emplcreacuenta` char(4) NOT NULL,
  `chr_cliecodigo` char(5) NOT NULL,
  `dec_cuensaldo` decimal(12,2) NOT NULL,
  `dtt_cuenfechacreacion` date NOT NULL,
  `vch_cuenestado` varchar(15) NOT NULL DEFAULT 'ACTIVO',
  `int_cuencontmov` int NOT NULL,
  `chr_cuenclave` char(6) NOT NULL,
  PRIMARY KEY (`chr_cuencodigo`),
  KEY `idx_cuenta01` (`chr_cliecodigo`),
  KEY `idx_cuenta02` (`chr_emplcreacuenta`),
  KEY `idx_cuenta03` (`chr_sucucodigo`),
  KEY `idx_cuenta04` (`chr_monecodigo`),
  CONSTRAINT `fk_cuenta_cliente` FOREIGN KEY (`chr_cliecodigo`) REFERENCES `Cliente` (`chr_cliecodigo`),
  CONSTRAINT `fk_cuenta_moneda` FOREIGN KEY (`chr_monecodigo`) REFERENCES `Moneda` (`chr_monecodigo`),
  CONSTRAINT `fk_cuenta_sucursal` FOREIGN KEY (`chr_sucucodigo`) REFERENCES `Sucursal` (`chr_sucucodigo`),
  CONSTRAINT `fk_cuente_empleado` FOREIGN KEY (`chr_emplcreacuenta`) REFERENCES `Empleado` (`chr_emplcodigo`),
  CONSTRAINT `chk_cuenta_chr_cuenestado` CHECK ((`vch_cuenestado` in (_utf8mb4'ACTIVO',_utf8mb4'ANULADO',_utf8mb4'CANCELADO')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- eurekabank.InteresMensual definition

CREATE TABLE `InteresMensual` (
  `chr_monecodigo` char(2) NOT NULL,
  `dec_inteimporte` decimal(12,2) NOT NULL,
  PRIMARY KEY (`chr_monecodigo`),
  KEY `idx_interesmensual01` (`chr_monecodigo`),
  CONSTRAINT `fk_interesmensual_moneda` FOREIGN KEY (`chr_monecodigo`) REFERENCES `Moneda` (`chr_monecodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- eurekabank.LOGSESSION definition

CREATE TABLE `LOGSESSION` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `chr_emplcodigo` char(4) NOT NULL,
  `fec_ingreso` datetime NOT NULL,
  `fec_salida` datetime DEFAULT NULL,
  `ip` varchar(20) NOT NULL DEFAULT 'NONE',
  `hostname` varchar(100) NOT NULL DEFAULT 'NONE',
  PRIMARY KEY (`ID`),
  KEY `fk_log_session_empleado` (`chr_emplcodigo`),
  CONSTRAINT `fk_log_session_empleado` FOREIGN KEY (`chr_emplcodigo`) REFERENCES `Empleado` (`chr_emplcodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- eurekabank.Movimiento definition

CREATE TABLE `Movimiento` (
  `chr_cuencodigo` char(8) NOT NULL,
  `int_movinumero` int NOT NULL,
  `dtt_movifecha` date NOT NULL,
  `chr_emplcodigo` char(4) NOT NULL,
  `chr_tipocodigo` char(3) NOT NULL,
  `dec_moviimporte` decimal(12,2) NOT NULL,
  `chr_cuenreferencia` char(8) DEFAULT NULL,
  PRIMARY KEY (`chr_cuencodigo`,`int_movinumero`),
  KEY `idx_movimiento01` (`chr_tipocodigo`),
  KEY `idx_movimiento02` (`chr_emplcodigo`),
  KEY `idx_movimiento03` (`chr_cuencodigo`),
  CONSTRAINT `fk_movimiento_cuenta` FOREIGN KEY (`chr_cuencodigo`) REFERENCES `Cuenta` (`chr_cuencodigo`),
  CONSTRAINT `fk_movimiento_empleado` FOREIGN KEY (`chr_emplcodigo`) REFERENCES `Empleado` (`chr_emplcodigo`),
  CONSTRAINT `fk_movimiento_tipomovimiento` FOREIGN KEY (`chr_tipocodigo`) REFERENCES `TipoMovimiento` (`chr_tipocodigo`),
  CONSTRAINT `chk_Movimiento_importe4` CHECK ((`dec_moviimporte` >= 0.0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- eurekabank.Usuario definition

CREATE TABLE `Usuario` (
  `chr_emplcodigo` char(4) NOT NULL,
  `vch_emplusuario` varchar(20) NOT NULL,
  `vch_emplclave` varchar(50) NOT NULL,
  `vch_emplestado` varchar(15) DEFAULT 'ACTIVO',
  PRIMARY KEY (`chr_emplcodigo`),
  UNIQUE KEY `U_Usuario_vch_emplusuario` (`vch_emplusuario`),
  CONSTRAINT `FK_Usuario_Empleado` FOREIGN KEY (`chr_emplcodigo`) REFERENCES `Empleado` (`chr_emplcodigo`),
  CONSTRAINT `Usuario_chk_1` CHECK ((`vch_emplestado` in (_utf8mb4'ACTIVO',_utf8mb4'ANULADO',_utf8mb4'CANCELADO')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- eurekabank.Permiso definition

CREATE TABLE `Permiso` (
  `chr_emplcodigo` char(4) NOT NULL,
  `int_moducodigo` int NOT NULL,
  `vch_permestado` varchar(15) NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`chr_emplcodigo`,`int_moducodigo`),
  KEY `FK_Permiso_Modulo` (`int_moducodigo`),
  CONSTRAINT `FK_Permiso_Modulo` FOREIGN KEY (`int_moducodigo`) REFERENCES `Modulo` (`int_moducodigo`),
  CONSTRAINT `FK_Permiso_Usuario` FOREIGN KEY (`chr_emplcodigo`) REFERENCES `Usuario` (`chr_emplcodigo`),
  CONSTRAINT `Permiso_chk_1` CHECK ((`vch_permestado` in (_utf8mb4'ACTIVO',_utf8mb4'ANULADO',_utf8mb4'CANCELADO')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;