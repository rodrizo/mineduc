USE [MINEDUC]
GO
/*
Creador: Rodney Rizo
Funcionalidad: SP para realizar operaciones de actividades
*/

ALTER PROCEDURE sp_crud_actividad
   @action VARCHAR(3) = NULL,
   @idActividad INT = NULL,
   @nombre VARCHAR(50) = NULL,
   @fecha DATETIME = NULL,
   @estimado DECIMAL(12,8)= NULL,
   @detalle VARCHAR(MAX) = NULL,
   @observaciones VARCHAR(MAX) = NULL,
   @idTipoActividad INT = NULL,
   @idComite INT = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	IF (@action = 'C') --Create
	BEGIN
		INSERT INTO Actividad VALUES(@nombre, @fecha, @estimado, @detalle, @observaciones, @idTipoActividad, @idComite, GETDATE())
	END
	
	IF (@action = 'R') --Read
	BEGIN
		SELECT a.ActividadId [Id], a.Nombre, a.Fecha, a.Estimado, a.DetalleActividades [Detalle], a.Observaciones, ta.Descripcion [Actividad], c.Nombre [Comite]
		FROM Actividad a WITH(NOLOCK)  
		INNER JOIN Comite c WITH(NOLOCK) ON c.ComiteId = a.ComiteId
		INNER JOIN TipoActividad ta WITH(NOLOCK) ON ta.TipoActividadId = a.TipoActividadId
		WHERE c.ComiteId = ISNULL(@idComite, c.ComiteId)
	END
	
	IF (@action = 'U') --Update
	BEGIN
		UPDATE Actividad
		SET Nombre = @nombre, Fecha = @fecha, Estimado = @estimado, DetalleActividades = @detalle, Observaciones = @observaciones, TipoActividadId = @idTipoActividad
		WHERE ActividadId = @idActividad
	END
	
	IF (@action = 'D') --DELETE
	BEGIN
		DELETE Actividad WHERE ActividadId = @idActividad
	END
END