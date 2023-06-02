
USE [MINEDUC]
GO
/*
Creador: Sofia Vasquez
Funcionalidad: SP para mostrar información de bitácora
*/

CREATE PROCEDURE sp_bitacora
   @action VARCHAR(25) = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	IF (@action = 'C') --Create
	BEGIN
		SELECT b.BitacoraId [Id], b.Action [Accion], b.SpName [Procedimiento], b.Parameters [Parametros], b.UserId [UsuarioId], b.CreateDate [Fecha] 
		FROM Bitacora b WITH(NOLOCK)  
		WHERE b.Action = 'Create'
	END
	
	IF (@action = 'U') --Update
	BEGIN
		SELECT b.BitacoraId [Id], b.Action [Accion], b.SpName [Procedimiento], b.Parameters [Parametros], b.UserId [UsuarioId], b.CreateDate [Fecha] 
		FROM Bitacora b WITH(NOLOCK)  
		WHERE b.Action = 'Update'
	END
	
	IF (@action = 'D') --DELETE
	BEGIN
		SELECT b.BitacoraId [Id], b.Action [Accion], b.SpName [Procedimiento], b.Parameters [Parametros], b.UserId [UsuarioId], b.CreateDate [Fecha] 
		FROM Bitacora b WITH(NOLOCK)  
		WHERE b.Action = 'Delete'
	END
END