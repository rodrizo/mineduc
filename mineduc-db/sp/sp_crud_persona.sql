USE [MINEDUC]
GO
/*
Creador: Rodney Rizo
Funcionalidad: SP para realizar CRUD de escuelas
*/
ALTER PROCEDURE sp_crud_persona
   @action VARCHAR(3) = NULL,
   @idPersona INT = NULL,
   @nombre VARCHAR(50) = NULL,
   @dpi VARCHAR(25) = NULL,
   @idComite INT = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	IF (@action = 'C') --Create
	BEGIN
		INSERT INTO Persona VALUES(@nombre, @dpi, @idComite)
	END
	
	IF (@action = 'R') --Read
	BEGIN
		SELECT p.PersonaId [Id], p.Nombre, p.Dpi, c.Nombre [Comite]
		FROM Persona p WITH(NOLOCK)  
		INNER JOIN Comite c WITH(NOLOCK) ON c.ComiteId = p.ComiteId
		WHERE c.ComiteId = ISNULL(@idComite, p.ComiteId)
	END
	
	IF (@action = 'U') --Update
	BEGIN
		UPDATE Persona
		SET nombre = @nombre, Dpi = @dpi
		WHERE PersonaId = @idPersona
	END
	
	IF (@action = 'D') --DELETE
	BEGIN
		DELETE Persona where PersonaId = @idPersona
	END
END