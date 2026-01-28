-- eurekabank.dbo.Cliente definition

-- Drop table

-- DROP TABLE eurekabank.dbo.Cliente;

CREATE TABLE eurekabank.dbo.Cliente (
	chr_cliecodigo nchar(5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	vch_cliepaterno nvarchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	vch_cliematerno nvarchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	vch_clienombre nvarchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	chr_cliedni nchar(8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	vch_clieciudad nvarchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	vch_cliedireccion nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	vch_clietelefono nvarchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	vch_clieemail nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK_Cliente PRIMARY KEY (chr_cliecodigo)
);


-- eurekabank.dbo.Contador definition

-- Drop table

-- DROP TABLE eurekabank.dbo.Contador;

CREATE TABLE eurekabank.dbo.Contador (
	vch_conttabla nvarchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	int_contitem int NOT NULL,
	int_contlongitud int NOT NULL,
	CONSTRAINT PK_Contador PRIMARY KEY (vch_conttabla)
);


-- eurekabank.dbo.Credenciales definition

-- Drop table

-- DROP TABLE eurekabank.dbo.Credenciales;

CREATE TABLE eurekabank.dbo.Credenciales (
	id_credencial int IDENTITY(1,1) NOT NULL,
	usuario nvarchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	contrasena nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT PK_Credenciales PRIMARY KEY (id_credencial),
	CONSTRAINT U_Credenciales_usuario UNIQUE (usuario)
);


-- eurekabank.dbo.Empleado definition

-- Drop table

-- DROP TABLE eurekabank.dbo.Empleado;

CREATE TABLE eurekabank.dbo.Empleado (
	chr_emplcodigo nchar(4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	vch_emplpaterno nvarchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	vch_emplmaterno nvarchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	vch_emplnombre nvarchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	vch_emplciudad nvarchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	vch_empldireccion nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK_Empleado PRIMARY KEY (chr_emplcodigo)
);


-- eurekabank.dbo.Modulo definition

-- Drop table

-- DROP TABLE eurekabank.dbo.Modulo;

CREATE TABLE eurekabank.dbo.Modulo (
	int_moducodigo int NOT NULL,
	vch_modunombre nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	vch_moduestado nvarchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT 'ACTIVO' NOT NULL,
	CONSTRAINT PK_Modulo PRIMARY KEY (int_moducodigo)
);
ALTER TABLE eurekabank.dbo.Modulo WITH NOCHECK ADD CONSTRAINT chk_Modulo_vch_moduestado CHECK (([vch_moduestado]='CANCELADO' OR [vch_moduestado]='ANULADO' OR [vch_moduestado]='ACTIVO'));


-- eurekabank.dbo.Moneda definition

-- Drop table

-- DROP TABLE eurekabank.dbo.Moneda;

CREATE TABLE eurekabank.dbo.Moneda (
	chr_monecodigo nchar(2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	vch_monedescripcion nvarchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT PK_Moneda PRIMARY KEY (chr_monecodigo)
);


-- eurekabank.dbo.Parametro definition

-- Drop table

-- DROP TABLE eurekabank.dbo.Parametro;

CREATE TABLE eurekabank.dbo.Parametro (
	chr_paracodigo nchar(3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	vch_paradescripcion nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	vch_paravalor nvarchar(70) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	vch_paraestado nvarchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT 'ACTIVO' NOT NULL,
	CONSTRAINT PK_Parametro PRIMARY KEY (chr_paracodigo)
);
ALTER TABLE eurekabank.dbo.Parametro WITH NOCHECK ADD CONSTRAINT chk_parametro_vch_paraestado CHECK (([vch_paraestado]='CANCELADO' OR [vch_paraestado]='ANULADO' OR [vch_paraestado]='ACTIVO'));


-- eurekabank.dbo.Sucursal definition

-- Drop table

-- DROP TABLE eurekabank.dbo.Sucursal;

CREATE TABLE eurekabank.dbo.Sucursal (
	chr_sucucodigo nchar(3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	vch_sucunombre nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	vch_sucuciudad nvarchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	vch_sucudireccion nvarchar(1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	int_sucucontcuenta int NOT NULL,
	CONSTRAINT PK_Sucursal PRIMARY KEY (chr_sucucodigo)
);


-- eurekabank.dbo.TipoMovimiento definition

-- Drop table

-- DROP TABLE eurekabank.dbo.TipoMovimiento;

CREATE TABLE eurekabank.dbo.TipoMovimiento (
	chr_tipocodigo nchar(3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	vch_tipodescripcion nvarchar(40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	vch_tipoaccion nvarchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	vch_tipoestado nvarchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT 'ACTIVO' NOT NULL,
	CONSTRAINT PK_TipoMovimiento PRIMARY KEY (chr_tipocodigo)
);
ALTER TABLE eurekabank.dbo.TipoMovimiento WITH NOCHECK ADD CONSTRAINT chk_tipomovimiento_vch_tipoaccion CHECK (([vch_tipoaccion]='SALIDA' OR [vch_tipoaccion]='INGRESO'));
ALTER TABLE eurekabank.dbo.TipoMovimiento WITH NOCHECK ADD CONSTRAINT chk_tipomovimiento_vch_tipoestado CHECK (([vch_tipoestado]='CANCELADO' OR [vch_tipoestado]='ANULADO' OR [vch_tipoestado]='ACTIVO'));


-- eurekabank.dbo.Asignado definition

-- Drop table

-- DROP TABLE eurekabank.dbo.Asignado;

CREATE TABLE eurekabank.dbo.Asignado (
	chr_asigcodigo nchar(6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	chr_sucucodigo nchar(3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	chr_emplcodigo nchar(4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	dtt_asigfechaalta date NOT NULL,
	dtt_asigfechabaja date NULL,
	CONSTRAINT PK_Asignado PRIMARY KEY (chr_asigcodigo),
	CONSTRAINT fk_asignado_empleado FOREIGN KEY (chr_emplcodigo) REFERENCES eurekabank.dbo.Empleado(chr_emplcodigo),
	CONSTRAINT fk_asignado_sucursal FOREIGN KEY (chr_sucucodigo) REFERENCES eurekabank.dbo.Sucursal(chr_sucucodigo)
);
 CREATE NONCLUSTERED INDEX idx_asignado01 ON dbo.Asignado (  chr_emplcodigo ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
 CREATE NONCLUSTERED INDEX idx_asignado02 ON dbo.Asignado (  chr_sucucodigo ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- eurekabank.dbo.CargoMantenimiento definition

-- Drop table

-- DROP TABLE eurekabank.dbo.CargoMantenimiento;

CREATE TABLE eurekabank.dbo.CargoMantenimiento (
	chr_monecodigo nchar(2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	dec_cargMontoMaximo decimal(12,2) NOT NULL,
	dec_cargImporte decimal(12,2) NOT NULL,
	CONSTRAINT PK_CargoMantenimiento PRIMARY KEY (chr_monecodigo),
	CONSTRAINT fk_cargomantenimiento_moneda FOREIGN KEY (chr_monecodigo) REFERENCES eurekabank.dbo.Moneda(chr_monecodigo)
);
 CREATE NONCLUSTERED INDEX idx_cargomantenimiento01 ON dbo.CargoMantenimiento (  chr_monecodigo ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- eurekabank.dbo.CostoMovimiento definition

-- Drop table

-- DROP TABLE eurekabank.dbo.CostoMovimiento;

CREATE TABLE eurekabank.dbo.CostoMovimiento (
	chr_monecodigo nchar(2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	dec_costimporte decimal(12,2) NOT NULL,
	CONSTRAINT PK_CostoMovimiento PRIMARY KEY (chr_monecodigo),
	CONSTRAINT fk_costomovimiento_moneda FOREIGN KEY (chr_monecodigo) REFERENCES eurekabank.dbo.Moneda(chr_monecodigo)
);
 CREATE NONCLUSTERED INDEX idx_costomovimiento ON dbo.CostoMovimiento (  chr_monecodigo ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- eurekabank.dbo.Cuenta definition

-- Drop table

-- DROP TABLE eurekabank.dbo.Cuenta;

CREATE TABLE eurekabank.dbo.Cuenta (
	chr_cuencodigo nchar(8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	chr_monecodigo nchar(2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	chr_sucucodigo nchar(3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	chr_emplcreacuenta nchar(4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	chr_cliecodigo nchar(5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	dec_cuensaldo decimal(12,2) NOT NULL,
	dtt_cuenfechacreacion date NOT NULL,
	vch_cuenestado nvarchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT 'ACTIVO' NOT NULL,
	int_cuencontmov int NOT NULL,
	chr_cuenclave nchar(6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT PK_Cuenta PRIMARY KEY (chr_cuencodigo),
	CONSTRAINT fk_cuenta_cliente FOREIGN KEY (chr_cliecodigo) REFERENCES eurekabank.dbo.Cliente(chr_cliecodigo),
	CONSTRAINT fk_cuenta_moneda FOREIGN KEY (chr_monecodigo) REFERENCES eurekabank.dbo.Moneda(chr_monecodigo),
	CONSTRAINT fk_cuenta_sucursal FOREIGN KEY (chr_sucucodigo) REFERENCES eurekabank.dbo.Sucursal(chr_sucucodigo),
	CONSTRAINT fk_cuente_empleado FOREIGN KEY (chr_emplcreacuenta) REFERENCES eurekabank.dbo.Empleado(chr_emplcodigo)
);
 CREATE NONCLUSTERED INDEX idx_cuenta01 ON dbo.Cuenta (  chr_cliecodigo ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
 CREATE NONCLUSTERED INDEX idx_cuenta02 ON dbo.Cuenta (  chr_emplcreacuenta ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
 CREATE NONCLUSTERED INDEX idx_cuenta03 ON dbo.Cuenta (  chr_sucucodigo ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
 CREATE NONCLUSTERED INDEX idx_cuenta04 ON dbo.Cuenta (  chr_monecodigo ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
ALTER TABLE eurekabank.dbo.Cuenta WITH NOCHECK ADD CONSTRAINT chk_cuenta_chr_cuenestado CHECK (([vch_cuenestado]='CANCELADO' OR [vch_cuenestado]='ANULADO' OR [vch_cuenestado]='ACTIVO'));


-- eurekabank.dbo.InteresMensual definition

-- Drop table

-- DROP TABLE eurekabank.dbo.InteresMensual;

CREATE TABLE eurekabank.dbo.InteresMensual (
	chr_monecodigo nchar(2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	dec_inteimporte decimal(12,2) NOT NULL,
	CONSTRAINT PK_InteresMensual PRIMARY KEY (chr_monecodigo),
	CONSTRAINT fk_interesmensual_moneda FOREIGN KEY (chr_monecodigo) REFERENCES eurekabank.dbo.Moneda(chr_monecodigo)
);
 CREATE NONCLUSTERED INDEX idx_interesmensual01 ON dbo.InteresMensual (  chr_monecodigo ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- eurekabank.dbo.LOGSESSION definition

-- Drop table

-- DROP TABLE eurekabank.dbo.LOGSESSION;

CREATE TABLE eurekabank.dbo.LOGSESSION (
	ID int IDENTITY(1,1) NOT NULL,
	chr_emplcodigo nchar(4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	fec_ingreso datetime NOT NULL,
	fec_salida datetime NULL,
	ip nvarchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT 'NONE' NOT NULL,
	hostname nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT 'NONE' NOT NULL,
	CONSTRAINT PK_LOGSESSION PRIMARY KEY (ID),
	CONSTRAINT fk_log_session_empleado FOREIGN KEY (chr_emplcodigo) REFERENCES eurekabank.dbo.Empleado(chr_emplcodigo)
);
 CREATE NONCLUSTERED INDEX idx_LOGSESSION_emplcodigo ON dbo.LOGSESSION (  chr_emplcodigo ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- eurekabank.dbo.Movimiento definition

-- Drop table

-- DROP TABLE eurekabank.dbo.Movimiento;

CREATE TABLE eurekabank.dbo.Movimiento (
	chr_cuencodigo nchar(8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	int_movinumero int NOT NULL,
	dtt_movifecha date NOT NULL,
	chr_emplcodigo nchar(4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	chr_tipocodigo nchar(3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	dec_moviimporte decimal(12,2) NOT NULL,
	chr_cuenreferencia nchar(8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK_Movimiento PRIMARY KEY (chr_cuencodigo,int_movinumero),
	CONSTRAINT fk_movimiento_cuenta FOREIGN KEY (chr_cuencodigo) REFERENCES eurekabank.dbo.Cuenta(chr_cuencodigo),
	CONSTRAINT fk_movimiento_empleado FOREIGN KEY (chr_emplcodigo) REFERENCES eurekabank.dbo.Empleado(chr_emplcodigo),
	CONSTRAINT fk_movimiento_tipomovimiento FOREIGN KEY (chr_tipocodigo) REFERENCES eurekabank.dbo.TipoMovimiento(chr_tipocodigo)
);
 CREATE NONCLUSTERED INDEX idx_movimiento01 ON dbo.Movimiento (  chr_tipocodigo ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
 CREATE NONCLUSTERED INDEX idx_movimiento02 ON dbo.Movimiento (  chr_emplcodigo ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
 CREATE NONCLUSTERED INDEX idx_movimiento03 ON dbo.Movimiento (  chr_cuencodigo ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
ALTER TABLE eurekabank.dbo.Movimiento WITH NOCHECK ADD CONSTRAINT chk_Movimiento_importe4 CHECK (([dec_moviimporte]>=(0.0)));


-- eurekabank.dbo.Usuario definition

-- Drop table

-- DROP TABLE eurekabank.dbo.Usuario;

CREATE TABLE eurekabank.dbo.Usuario (
	chr_emplcodigo nchar(4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	vch_emplusuario nvarchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	vch_emplclave nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	vch_emplestado nvarchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT 'ACTIVO' NULL,
	CONSTRAINT PK_Usuario PRIMARY KEY (chr_emplcodigo),
	CONSTRAINT U_Usuario_vch_emplusuario UNIQUE (vch_emplusuario),
	CONSTRAINT FK_Usuario_Empleado FOREIGN KEY (chr_emplcodigo) REFERENCES eurekabank.dbo.Empleado(chr_emplcodigo)
);
ALTER TABLE eurekabank.dbo.Usuario WITH NOCHECK ADD CONSTRAINT chk_Usuario_vch_emplestado CHECK (([vch_emplestado]='CANCELADO' OR [vch_emplestado]='ANULADO' OR [vch_emplestado]='ACTIVO'));


-- eurekabank.dbo.Permiso definition

-- Drop table

-- DROP TABLE eurekabank.dbo.Permiso;

CREATE TABLE eurekabank.dbo.Permiso (
	chr_emplcodigo nchar(4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	int_moducodigo int NOT NULL,
	vch_permestado nvarchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT 'ACTIVO' NOT NULL,
	CONSTRAINT PK_Permiso PRIMARY KEY (chr_emplcodigo,int_moducodigo),
	CONSTRAINT FK_Permiso_Modulo FOREIGN KEY (int_moducodigo) REFERENCES eurekabank.dbo.Modulo(int_moducodigo),
	CONSTRAINT FK_Permiso_Usuario FOREIGN KEY (chr_emplcodigo) REFERENCES eurekabank.dbo.Usuario(chr_emplcodigo)
);
 CREATE NONCLUSTERED INDEX FK_Permiso_Modulo_idx ON dbo.Permiso (  int_moducodigo ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
ALTER TABLE eurekabank.dbo.Permiso WITH NOCHECK ADD CONSTRAINT chk_Permiso_vch_permestado CHECK (([vch_permestado]='CANCELADO' OR [vch_permestado]='ANULADO' OR [vch_permestado]='ACTIVO'));