USE [MINEDUC]
GO
/*
Creador: Rodney Rizo
Funcionalidad: SP para realizar CRUD de escuelas
*/
CREATE PROCEDURE sp_crud_escuela
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
END