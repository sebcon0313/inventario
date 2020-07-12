create database inventario;
use inventario;

create table proveedores(
	idProveedor int not null primary key auto_increment,
    nombre varchar (100),
    nit int not null,
    direccion varchar (100),
    numeroCel int not null,
    fax int not null,
    correroElectronico varchar(45) not null,
    idDepartamento int not null,
    idMunicipio int not null,
    idZona int not null,
    foreign key(idDepartamento) references departamentos(idDepartamento),
    foreign key(idMunicipio) references municipios(idMunicipio),
    foreign key(idZona) references zonas(idZona)
);
-- INSERTAR
DELIMITER $$
create procedure sp_InsertarProveedores(v_nombre varchar (100),v_nit int,v_direccion varchar (100),v_numeroCel int,v_fax int,
v_correroElectronico varchar (45),v_idDepartamento int,v_idMunicipio int,v_idZona int)
begin

insert into proveedores (nombre,nit,direccion,numeroCel,fax,correroElectronico,idDepartamento,idMunicipio,idZona)
	values(v_nombre,v_nit,v_direccion,v_numeroCel,v_fax,v_correroElectronico,v_idDepartamento,v_idMunicipio,v_idZona);
    
end $$

call sp_InsertarProveedores('allan chavez',1234-5,'4av zona 10',3400-0087,798,'tuto@gmail.com',1,1,1);
call sp_InsertarProveedores('hector lopez',0914-9,'10av zona 1',5708-0007,018,'juan@gmail.com',2,1,2);
call sp_InsertarProveedores('oto tiul',9834-6,'3av zona 11',5456-0896,138,'0909@gmail.com',3,2,1);

select * from proveedores;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create table Clientes(
	idCliente int not null primary key auto_increment,
	nombre varchar (100),
    nit int not null,
    direccion varchar (100),
    numeroCel int not null,
    fax int not null,
    correroElectronico varchar (100),
	limiteCredito double,
    idDepartamento int not null,
    idMunicipio int not null,
    idZona int not null,
	foreign key(idDepartamento) references departamentos(idDepartamento),
    foreign key(idMunicipio) references municipios(idMunicipio),
    foreign key(idZona) references zonas(idZona)
);
  -- INSERTAR  
    DELIMITER $$
create procedure sp_InsertarClientes(v_nombre varchar (100),v_nit int,v_direccion varchar (100),v_numeroCel int,v_fax int,
v_correroElectronico varchar (100),v_idDepartamento int,v_idMunicipio int,v_idZona int,v_limiteCredito double)
begin

insert into clientes (nombre,nit,direccion,numeroCel,fax,correroElectronico,idDepartamento,idMunicipio,idZona,limiteCredito)
	values(v_Nombre,v_nit,v_direccion,v_numeroCel,v_fax,v_correroElectronico,v_idDepartamento,v_idMunicipio,v_idZona,v_limiteCredito);
    
end $$

call sp_InsertarClientes('juan',1342-2,'4av zona 10',5100-4589,234451,'hola@gmail.com',1,2,1,200);
call sp_InsertarClientes('pedra',3453-1,'5av zona 1',5045-0990,876543,'juan@gmail.com',2,1,1,2000);
call sp_InsertarClientes('maria',5487-9,'16av zona 11',5680-9078,13245,'pegre@gmail.com',1,3,2,900);


select * from clientes;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create table departamentos(
	idDepartamento int not null primary key auto_increment,
    departamento varchar (100)
);
-- INSERTAR
    DELIMITER $$
create procedure sp_InsertarDepartamento(v_departamento varchar (100))
begin

insert into departamentos (departamento)
	values(v_departamento);
    
end $$

call sp_InsertarDepartamento('guatemala');
call sp_InsertarDepartamento('peten');
call sp_InsertarDepartamento('san rosa');

select * from departamentos;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create table municipios(
	idMunicipio int not null primary key auto_increment,
	municipio varchar(100)
);
-- INSERTAR
    DELIMITER $$
create procedure sp_InsertarMunicipio(v_municipio varchar (100))
begin

insert into municipios (municipio)
	values(v_municipio);
    
end $$

call sp_InsertarMunicipio('san lucas');
call sp_InsertarMunicipio('mixco');
call sp_InsertarMunicipio('flores');

select * from municipios;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create table zonas(
	idZona int not null primary key auto_increment,
    zona int not null
);
-- INSERTAR
    DELIMITER $$
create procedure sp_InsertarZona(v_zona int)
begin

insert into zonas (zona)
	values(v_zona);
    
end $$

call sp_InsertarZona(1);
call sp_InsertarZona(10);
call sp_InsertarZona(14);

select * from municipios;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create table productos(
	idProducto int not null primary key auto_increment,
    idUnidadMedida int not null,
    idFamiliaProducto int not null,
    idSubFamilia int not null,
    producto varchar (100),
    descripcion varchar(100),
    fechaProduccion date not null,
    fechaVencimiento date not null,
    peso double not null,
	foreign key (idUnidadMedida) references unidadMedidas(idUnidadMedida),
    foreign key (idFamiliaProducto) references familiaProductos(idFamiliaProducto),
    foreign key (idSubFamilia) references subFamiliaProductos(idSubFamilia)
);
-- INSERTAR 
DELIMITER $$
create procedure sp_InsertarProductos(v_idFamiliaProducto int,v_idSubFamilia int,v_producto varchar (100),
v_descripcion varchar(100),v_fechaProduccion date ,v_fechaVencimiento date ,v_peso double,v_idUnidadMedida int)
begin

insert into productos (idFamiliaProducto,idSubFamilia,producto,descripcion,fechaProduccion,fechaVencimiento,peso,idUnidadMedida)
	values(v_idFamiliaProducto,v_idSubFamilia,v_producto,v_descripcion,v_fechaProduccion,v_fechaVencimiento,v_peso,v_idUnidadMedida);
    
end $$

call sp_InsertarProductos(1,2,'tommy ','de mesclia','2019-10-01','2040-10-01',100,1);
call sp_InsertarProductos(2,2,'adidas nmdr2','para jugar fut','2019-10-02','2040-10-02',48,1);
call sp_InsertarProductos(3,3,'rolex 1203','con huella','2019-10-03','2040-10-03',20,1);

select * from productos;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create table unidadMedidas(
	idUnidadMedida int not null primary key auto_increment,
    nombre varchar (100)
);
-- INSERTAR
DELIMITER $$
create procedure sp_InsertarUnidadMedida(v_nombre varchar (100))
begin

insert into unidadMedidas (nombre)
	values(v_nombre);
    
end $$

call sp_InsertarUnidadMedida('unidad');
call sp_InsertarUnidadMedida('media docenas');
call sp_InsertarUnidadMedida('docena');

select * from sucursales;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create table familiaProductos(
	idFamiliaProducto int not null primary key auto_increment,
    nombre varchar(100)
);
-- INSERTAR
DELIMITER $$
create procedure sp_InsertarFamiliaProdutos(v_Nombre varchar (100))
begin

insert into familiaProductos (nombre)
	values(v_Nombre);
    
end $$

call sp_InsertarFamiliaProdutos('ropa');
call sp_InsertarFamiliaProdutos('calzado');
call sp_InsertarFamiliaProdutos('accesorios');


select * from familiaProductos;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create table subfamiliaProductos(
	idSubFamilia int not null primary key auto_increment,
    nombre varchar (100)
    
);
-- INSERTAR 
DELIMITER $$
create procedure sp_InsertarSubFamiliaProductos(v_nombre varchar (100))
begin

insert into subFamiliaProductos (nombre)
	values(v_nombre);
    
end $$

call sp_InsertarSubFamiliaProductos('pantalon');
call sp_InsertarSubFamiliaProductos('tenis de fut');
call sp_InsertarSubFamiliaProductos('reloj');

select * from subFamiliaProductos;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create table sucursales(
	idSucursal int not null primary key auto_increment,
    nombre varchar (100),
    direccion varchar (100),
    numeroCel int not null,
    nombreEncargado varchar (100)
);
-- INSERTAR
DELIMITER $$
create procedure sp_InsertarSucursales(v_nombre varchar (100),v_direccion varchar (100),v_numeroCel int,v_nombreEncargado varchar (100))
begin

insert into sucursales (nombre,direccion,numeroCel,nombreEncargado)
	values(v_nombre,v_direccion,v_numeroCel,v_nombreEncargado);
    
end $$

call sp_InsertarSucursales('mesclorit zona 10','4av zona 10',5670-1234,'hactor corado');
call sp_InsertarSucursales('mesclorit zona 18','10 calle zona 10',5657-1265,'alan chavez');
call sp_InsertarSucursales('mesclorit zona 6av','5av zona 1',4689-3456,'chino lopez');

select * from sucursales;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create table  detalleSucursal(
	idDetalleSucursal int not null primary key auto_increment,
    idSucursal int not null,
    idProducto int not null,
    cantiadadProd int not null,
    costoUnitario double not null,
    precioVenta double not null,
    foreign key (idSucursal) references sucursales(idSucursal),
    foreign key (idProducto) references productos(idProducto)
);
-- INSERTAR
DELIMITER $$
create procedure sp_InsertarDetalleSucursal(v_idSucursal int,v_idProducto int,v_cantiadadProd int,v_costoUnitario double,v_precioVenta double)
begin
insert into detalleSucursal (idSucursal,idProducto,cantiadadProd,costoUnitario,precioVenta) 
	values (v_idSucursal,v_idProducto,v_cantiadadProd,v_costoUnitario,v_precioVenta);
    
end $$

call sp_InsertarDetalleSucursal(1,2,40,40,55);
call sp_InsertarDetalleSucursal(1,1,38,60,69);
call sp_InsertarDetalleSucursal(3,2,67,60,71);


select * from detalleSucursal;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create table compraProducto(
	idCompraProd int not null primary key auto_increment,
    idSucursal int not null,
    idProducto int not null,
    idUnidadMedida int not null,
    idProveedor int not null,   
    cantidad int not null,
    valor_C_iva double not null,
    iva double not null,
    valorUnitario_S_iva double not null,
    noDocumento int not null,
	fechaDocumento date not null,
    foreign key(idSucursal) references sucursales(idSucursal),
    foreign key(idProveedor) references proveedores(idProveedor),
    foreign key(idProducto) references productos(idProducto),
    foreign key(idUnidadMedida) references unidadMedidas(idUnidadMedida)
);
-- INSERTAR
DELIMITER $$
create procedure sp_InsertarCompraProducto(v_idSucursal int, v_idProducto int, v_idUnidadMedida int, v_idProveedor int,v_cantidad int,
 v_valor_C_iva double, v_iva double, v_valorUnitario_S_iva double, v_noDocumento int, v_fechaDocumento date )
begin

insert into compraProducto (idSucursal,idProducto,idUnidadMedida,idProveedor,cantidad,valor_C_iva,iva,valorUnitario_S_iva,noDocumento,fechaDocumento)
	values(v_idSucursal,v_idProducto,v_idUnidadMedida,v_idProveedor,v_cantidad,v_valor_C_iva,v_iva,v_valorUnitario_S_iva,v_noDocumento,v_fechaDocumento);
    
end $$

call sp_InsertarCompraProducto(1,2,3,1,50,150,50,100,1,'2019-03-12');
call sp_InsertarCompraProducto(2,1,3,3,100,100,50,50,2,'2019-03-12');
call sp_InsertarCompraProducto(1,1,2,1,200,250,75,125,3,'2019-03-12');


select * from compraProducto;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create table ventaProducto(
	idVentaProducto int not null primary key auto_increment,
    idSucursal int not null,
    idCliente int not null,
    idProducto int not null,
    idUnidadMedida int not null,
    cantidad int not null,
    valorVentaUnitario double not null,
    costoUnitario double not null,
    noDocumento int not null,
    fechaDocumento date not null,
    fechaEntrega date not null,
    foreign key(idSucursal) references sucursales(idSucursal),
	foreign key(idCliente) references clientes(idCliente),
    foreign key(idProducto) references productos(idProducto),
    foreign key(idUnidadMedida) references unidadMedidas(idUnidadMedida)
);
-- INSERTAR
DELIMITER $$
create procedure sp_InsertarVentaProducto(v_idSucursal int, v_idCliente int, v_idProducto int, v_idUnidadMedida int, v_cantidad int, 
v_valorVentaUnitario double, v_costoUnitario double, v_noDocumento int, v_fechaDocumento date, v_fechaEntrega date)
begin

insert into ventaProducto (idSucursal,idCliente,idProducto,idUnidadMedida,cantidad,valorVentaUnitario,costoUnitario,noDocumento,fechaDocumento,fechaEntrega)
	values (v_idSucursal,v_idCliente,v_idProducto,v_idUnidadMedida,v_cantidad,v_valorVentaUnitario,v_costoUnitario,v_noDocumento,v_fechaDocumento,v_fechaEntrega);

END $$

call sp_InsertarVentaProducto(3,2,1,2,10,18.00,16.50,1,'2018-08-12','2018-08-12');
call sp_InsertarVentaProducto(2,3,2,3,8,17.00,15.00,1,'2018-08-12','2018-08-12');
call sp_InsertarVentaProducto(1,1,3,1,12,20.00,18.00,1,'2018-08-12','2018-08-12');



































