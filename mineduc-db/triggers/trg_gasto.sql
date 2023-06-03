USE MINEDUC
GO

ALTER TRIGGER trg_gasto
ON [dbo].Gasto
AFTER UPDATE
AS
BEGIN
	DECLARE @parameters VARCHAR(250);

	UPDATE a
	SET LastModifiedDate = GETDATE()
	FROM Gasto a
	INNER JOIN inserted i WITH(NOLOCK) ON i.GastoId = a.GastoId
	WHERE (TRIM(a.Descripcion) <> TRIM(i.Descripcion) OR (a.Monto <> i.Monto))

	SELECT 
		@parameters =
		CASE
			WHEN i.Descripcion <> d.Descripcion THEN CONCAT('Cambio descripción de: ', d.Descripcion, ' a ', i.Descripcion)
			WHEN a.Monto <> i.Monto THEN CONCAT('Cambio monto de: ', d.Monto, ' a ', i.Monto)
		ELSE 'No cambios' END 
	FROM Gasto a
	INNER JOIN inserted i WITH(NOLOCK) ON i.ActividadId = a.ActividadId
	INNER JOIN deleted d WITH(NOLOCK) ON d.ActividadId = i.ActividadId

	INSERT INTO Bitacora VALUES('Update', 'trg_gasto', @parameters, 1000, GETDATE())
	
END