USE [MINEDUC]
GO
/*
Creador: Rodney Rizo
Funcionalidad: SP para realizar CRUD de comités
*/
CREATE PROCEDURE sp_crud_comite
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
		WHERE e.EscuelaId = @idEscuela
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
END