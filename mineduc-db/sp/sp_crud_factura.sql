
USE [MINEDUC]
GO
/*
Creador: Rodney Rizo
Funcionalidad: SP para realizar CRUD de facturas
*/

ALTER PROCEDURE sp_crud_factura
   @action VARCHAR(3) = NULL,
   @idFactura INT = NULL,
   @nombre VARCHAR(50) = NULL,
   @imagen image = NULL,
   @idGasto INT = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	IF (@action = 'C') --Create
	BEGIN
		INSERT INTO Factura VALUES(@nombre, @idGasto, GETDATE(), @imagen)
	END
	
	IF (@action = 'R') --Read
	BEGIN
		SELECT f.Nombre, g.Descripcion [Gasto]
		FROM Factura f WITH(NOLOCK)  
		INNER JOIN Gasto g WITH(NOLOCK) ON g.GastoId = f.GastoId
		WHERE g.GastoId = ISNULL(@idGasto, g.GastoId)
	END
	
	IF (@action = 'U') --Update
	BEGIN
		UPDATE Factura
		SET nombre = @nombre
		WHERE FacturaId = @idFactura
	END
	
	IF (@action = 'D') --DELETE
	BEGIN
		DELETE Factura where FacturaId = @idFactura
	END
	
	IF (@action = 'S') --See image
	BEGIN
		SELECT Imagen FROM Factura WHERE FacturaId = @idFactura
	END
END