
USE [MINEDUC]
GO
/*
Creador: Sofia Vasquez
Funcionalidad: SP para mostrar información de bitácora
*/

ALTER PROCEDURE sp_bitacora
   @action VARCHAR(25) = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	IF (@action = 'Create') --Create
	BEGIN
		SELECT b.BitacoraId [Id], b.Action [Accion], b.SpName [Procedimiento], b.Parameters [Parametros], b.UserId [UsuarioId], b.CreateDate [Fecha] 
		FROM Bitacora b WITH(NOLOCK)  
		WHERE b.Action = ISNULL('Create', b.Action)
		ORDER BY b.CreateDate DESC
	END
	
	IF (@action = 'Update') --Update
	BEGIN
		SELECT b.BitacoraId [Id], b.Action [Accion], b.SpName [Procedimiento], b.Parameters [Parametros], b.UserId [UsuarioId], b.CreateDate [Fecha] 
		FROM Bitacora b WITH(NOLOCK)  
		WHERE b.Action = ISNULL('Update', b.Action)
		ORDER BY b.CreateDate DESC
	END
	
	IF (@action = 'Delete') --DELETE
	BEGIN
		SELECT b.BitacoraId [Id], b.Action [Accion], b.SpName [Procedimiento], b.Parameters [Parametros], b.UserId [UsuarioId], b.CreateDate [Fecha] 
		FROM Bitacora b WITH(NOLOCK)  
		WHERE b.Action = ISNULL('Delete', b.Action)
		ORDER BY b.CreateDate DESC
	END

	IF (@action IS NULL) 
	BEGIN
		SELECT b.BitacoraId [Id], b.Action [Accion], b.SpName [Procedimiento], b.Parameters [Parametros], b.UserId [UsuarioId], b.CreateDate [Fecha] 
		FROM Bitacora b WITH(NOLOCK)  
		ORDER BY b.CreateDate DESC
	END
END