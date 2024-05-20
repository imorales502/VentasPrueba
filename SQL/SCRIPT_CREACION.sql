	

	--CREATE DATABASE VentaMariscos

	USE VentaMariscos

	CREATE TABLE Sucursal(
		ID int identity primary key
		, Nombre VARCHAR(30)
		, Dirección VARCHAR(100)
	)

	CREATE TABLE Usuario (
		Id int IDENTITY PRIMARY KEY
		,Usuario VARCHAR(25)
		,Nombre VARCHAR(30)
		,Apellido VARCHAR(30)
		,Contraseña VARCHAR(500)
		,Id_Sucursal INT FOREIGN KEY REFERENCES Sucursal(ID)
	)


	CREATE TABLE Productos (
		ID INT IDENTITY PRIMARY KEY
		,Nombre VARCHAR(40)
		,PRECIO DECIMAL(5,2)
	)

	CREATE TABLE EXISTENCIAS(
		ID_Producto INT FOREIGN KEY REFERENCES Productos(ID)
		,ID_Sucursal INT FOREIGN KEY REFERENCES Sucursal(ID)
		,Cantidad DECIMAL(5,2)
	)


	CREATE TABLE Tipo_Movimiento (
		ID INT IDENTITY PRIMARY KEY
		,Nombre VARCHAR(12)
	)

	INSERT INTO Tipo_Movimiento VALUES('Compra'),('Venta')
	SELECT * FROM Tipo_Movimiento

	CREATE TABLE Movimiento(
		ID INT IDENTITY PRIMARY KEY
		,Fecha DATETIME
		,Estado BIT
		,ID_Usuario INT FOREIGN KEY REFERENCES Usuario(Id)
		,ID_TipoMovimiento INT FOREIGN KEY REFERENCES Tipo_Movimiento(ID)
		,ID_Cliente INT FOREIGN KEY REFERENCES Cliente(ID)
	)

	ALTER TABLE MOVIMIENTO ADD Estado BIT
	ALTER TABLE MOVIMIENTO ADD ID_Cliente INT FOREIGN KEY REFERENCES Cliente(ID)

	CREATE TABLE Cliente (
		ID INT IDENTITY PRIMARY KEY
		,NIT VARCHAR(12) 
		,Nombre VARCHAR(60)
		,Direccion VARCHAR(50)
	)


	CREATE TABLE Detalle_Movimiento (
		ID INT IDENTITY PRIMARY KEY
		,CANTIDAD DECIMAL(5,2)
		,ID_Movimiento INT FOREIGN KEY REFERENCES Movimiento(ID)
		,ID_Producto INT FOREIGN KEY REFERENCES Productos(ID)
	)



	ALTER TABLE MOVIMIENTO ADD Estado BIT

	INSERT INTO Sucursal(Nombre, Dirección) VALUES('Tienda las palmeras', '7 calle 5-32 zona 3 Esc.')
	DROP TABLE Movimiento
	select * from Sucursal
