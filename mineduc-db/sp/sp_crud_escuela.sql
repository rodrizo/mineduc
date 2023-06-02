USE [MINEDUC]
GO
/*
Creador: Wilson Morales
Funcionalidad: SP para realizar CRUD de escuelas
*/
ALTER PROCEDURE sp_crud_escuela
   @action VARCHAR(3) = NULL,
   @idEscuela INT = NULL,
   @nombre VARCHAR(25) = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	IF (@action = 'C') --Create
	BEGIN
		INSERT INTO Escuela VALUES(@nombre)
	END
	
	IF (@action = 'R') --Read
	BEGIN
		SELECT es.EscuelaId [Id], es.Nombre
		FROM Escuela es WITH(NOLOCK)  
	END
	
	IF (@action = 'U') --Update
	BEGIN
		UPDATE Escuela
		SET nombre = @nombre
		WHERE EscuelaId = @idEscuela
	END
	
	IF (@action = 'D') --DELETE
	BEGIN
		DELETE Escuela where EscuelaId = @idEscuela
	END
	
	--Insertando data en bitácora
	DECLARE @actionName VARCHAR(25);
	SELECT @actionName = CASE WHEN @action = 'C' THEN 'Create' WHEN @action = 'R' THEN 'Read' WHEN @action = 'U' THEN 'Update' WHEN @action = 'D' THEN 'Delete' ELSE NULL END

	INSERT INTO Bitacora VALUES(@actionName, 'sp_crud_factura', CONCAT(@action,',',@idEscuela,',',@nombre), 1000, GETDATE())
END