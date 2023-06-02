
USE [MINEDUC]
GO
/*
Creador: Diana Gutierrez
Funcionalidad: SP para realizar operaciones de gastos
*/

ALTER PROCEDURE sp_crud_gastos
   @action VARCHAR(3) = NULL,
   @idGasto INT = NULL,
   @descripcion VARCHAR(250) = NULL,
   @monto DECIMAL(12,8)= NULL,
   @idActividad INT = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	IF (@action = 'C') --Create
	BEGIN
		INSERT INTO Gasto VALUES(@descripcion, @monto, GETDATE(), @idActividad)
	END
	
	IF (@action = 'R') --Read
	BEGIN
		SELECT g.GastoId [Id], g.Descripcion, g.Monto, a.Nombre [Actividad], c.Nombre [Comite]
		FROM Gasto g WITH(NOLOCK)  
		INNER JOIN Actividad a WITH(NOLOCK) ON a.ActividadId = g.ActividadId
		INNER JOIN Comite c WITH(NOLOCK) ON c.ComiteId = a.ComiteId
		WHERE g.ActividadId = ISNULL(@idActividad, g.ActividadId)
	END
	
	IF (@action = 'U') --Update
	BEGIN
		UPDATE Gasto
		SET Descripcion = @descripcion, Monto = @monto
		WHERE GastoId = @idGasto
	END
	
	IF (@action = 'D') --DELETE
	BEGIN
		DELETE Gasto WHERE GastoId = @idGasto
	END

	IF(@action <> 'R')
	BEGIN
		--Insertando data en bitácora
		DECLARE @actionName VARCHAR(25);
		SELECT @actionName = CASE WHEN @action = 'C' THEN 'Create' WHEN @action = 'U' THEN 'Update' WHEN @action = 'D' THEN 'Delete' ELSE NULL END

		INSERT INTO Bitacora VALUES(@actionName, 'sp_crud_gastos', CONCAT(ISNULL(@action, 'NULL'),',',ISNULL(@idGasto, 0),',',ISNULL(@descripcion, 'NULL'),',',ISNULL(@monto, 0),',',ISNULL(@idActividad, 0)), 1000, GETDATE())
	END
END