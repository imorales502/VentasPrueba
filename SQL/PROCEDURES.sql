	USE VentaMariscos
	ALTER PROCEDURE ValidaCliente 
		@PNit VARCHAR(12)
		,@PNombre VARCHAR(60)
		,@PDireccion VARCHAR(50)
	AS
	BEGIN TRY
		
		IF NOT EXISTS( SELECT 1 FROM CLIENTE 
						WHERE Nit = @PNit)
		BEGIN
			INSERT INTO CLIENTE VALUES(@PNit, @PNombre, @PDireccion)
		END

		SELECT ID, Nombre, Direccion FROM Cliente WHERE Nit = @PNit
	END TRY
	BEGIN CATCH
		SELECT
		ERROR_STATE(),
		ERROR_PROCEDURE(),
		ERROR_MESSAGE()
	END CATCH;

	CREATE PROCEDURE SPGeneraMovimiento(
		@PFecha DATETIME
		,@PIdUsuario INT
		,@PIdCliente INT
		,@PIdTipoMovimiento INT
		,@PEstado BIT = NULL
		,@PID int = NULL
	)
	AS
	BEGIN TRY
		IF NOT EXISTS(SELECT 1 FROM Movimiento WHERE ID = @PID)
		BEGIN
			INSERT INTO Movimiento VALUES(@PFecha, @PIdUsuario, @PIdCliente, 1, @PIdTipoMovimiento)
			SELECT TOP 1 ID FROM Movimiento WHERE ID_Cliente = @PIdCliente ORDER BY ID DESC 
		END
		ELSE
		BEGIN
			UPDATE a SET a.Estado = @PEstado
			FROM Movimiento a 
			WHERE ID = @PID
		END
	END TRY
	BEGIN CATCH
		SELECT
		ERROR_MESSAGE()
	END CATCH


	CREATE PROCEDURE SPDetalleMovimiento (
		@PCantidad INT
		,@PIdMovimiento INT
		,@PIDProducto INT
		,@PIdUsuario INT
	)
	AS
	BEGIN TRY
		BEGIN TRANSACTION;
			DECLARE @VSucursal INT, @VExistencia DECIMAL(5,2), @VTipoMovimiento INT

			SET @VSucursal = (SELECT a.ID FROM Sucursal a
							  INNER JOIN Usuario b ON a.ID = b.Id_Sucursal
							  WHERE b.Id = @PIdUsuario)

			SET @VExistencia =  (SELECT Cantidad 
									  FROM EXISTENCIAS 
									  WHERE ID_Sucursal = @VSucursal
									  AND ID_Producto = @PIDProducto)

			SET @VTipoMovimiento = (SELECT a.ID FROM Tipo_Movimiento a
									INNER JOIN Movimiento b ON a.ID = b.ID_TipoMovimiento
									WHERE b.ID = @PIdMovimiento)

			IF @VExistencia > @PCantidad
			BEGIN
				INSERT INTO Detalle_Movimiento VALUES(@PCantidad, @PIdMovimiento, @PIDProducto)
			
				IF @VTipoMovimiento = 1
				BEGIN
					UPDATE a SET a.Cantidad = a.Cantidad + @PCantidad
					FROM EXISTENCIAS a
					WHERE a.ID_Sucursal = @VSucursal
					AND a.ID_Producto = @PIDProducto
				END
				ELSE
				BEGIN 
					UPDATE a SET a.Cantidad = a.Cantidad - @PCantidad
					FROM EXISTENCIAS a
					WHERE a.ID_Sucursal = @VSucursal
					AND a.ID_Producto = @PIDProducto
				END	
				SELECT 1
			END
			ELSE 
			BEGIN
				SELECT 0
			END
		COMMIT;
	END TRY
	BEGIN CATCH
		ROLLBACK;
		SELECT
		ERROR_MESSAGE()
	END CATCH

	create PROCEDURE SPConsultaProductos (
		@PIdProducto INT = null
		,@PNombre VARCHAR(40) = null
	)
	AS
	BEGIN
		SELECT ID, Nombre, Precio
		FROM Productos
		WHERE ID = ISNULL(@PIdProducto,ID)
		AND Nombre LIKE CONCAT('%',ISNULL(@PNOMBRE, Nombre),'%')
	END

	EXEC SPConsultaProductos NULL, null
	AND a.Nombre LIKE CONCAT("%",IFNULL(PNombre, a.Nombre),"%");

	SELECT ID, Nombre, Precio
		FROM Productos
		WHERE ID = ISNULL(ID,NULL)
		AND Nombre LIKE CONCAT('%',ISNULL(Nombre,NULL),'%')

	INSERT INTO Productos VALUES('Cangrejo', 40)

	DROP PROC DetalleMovimiento
	SELECT * FROM Movimiento
	EXEC ValidaCliente '920627-12', 'Ismar Morales', 'ESC'

	exec SPConsultaProductos @PIdProducto=default,@PNombre=default



