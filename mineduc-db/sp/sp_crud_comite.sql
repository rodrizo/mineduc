USE [MINEDUC]
GO
/*
Creador: Sofía Vasquez
Funcionalidad: SP para realizar CRUD de comités
*/

ALTER PROCEDURE sp_crud_comite
   @action VARCHAR(3) = NULL,
   @idComite INT = NULL,
   @nombre VARCHAR(50) = NULL,
   @fondo DECIMAL(12,8) = NULL,
   @idEscuela INT = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	IF (@action = 'C') --Create
	BEGIN
		INSERT INTO Comite VALUES(@nombre, @fondo, @idEscuela)
	END
	
	IF (@action = 'R') --Read
	BEGIN
		SELECT c.ComiteId [Id], c.Nombre, c.Fondo, e.Nombre [Escuela]
		FROM Comite c WITH(NOLOCK)  
		INNER JOIN Escuela e WITH(NOLOCK) ON e.EscuelaId = c.EscuelaId
		WHERE e.EscuelaId = ISNULL(@idEscuela, e.EscuelaId)
	END
	
	IF (@action = 'U') --Update
	BEGIN
		UPDATE Comite
		SET nombre = @nombre, Fondo = @fondo
		WHERE ComiteId = @idComite
	END
	
	IF (@action = 'D') --DELETE
	BEGIN
		DELETE Comite where ComiteId = @idComite
	END

	--Insertando data en bitácora
	DECLARE @actionName VARCHAR(25);
	SELECT @actionName = CASE WHEN @action = 'C' THEN 'Create' WHEN @action = 'R' THEN 'Read' WHEN @action = 'U' THEN 'Update' WHEN @action = 'D' THEN 'Delete' ELSE NULL END

	INSERT INTO Bitacora VALUES(@actionName, 'sp_crud_factura', CONCAT(@action,',',@idComite,',',@nombre,',',@fondo,',',@idEscuela), 1000, GETDATE())
END