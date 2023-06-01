
USE [MINEDUC]
GO
/*
Creador: Rodney Rizo
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
END