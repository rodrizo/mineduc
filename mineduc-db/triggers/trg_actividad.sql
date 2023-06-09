USE MINEDUC
GO

ALTER TRIGGER trg_actividad
ON [dbo].Actividad
AFTER UPDATE
AS
BEGIN
	DECLARE @parameters VARCHAR(250);

	UPDATE a
	SET LastModifiedDate = GETDATE()
	FROM Actividad a
	INNER JOIN inserted i WITH(NOLOCK) ON i.ActividadId = a.ActividadId
	WHERE (TRIM(a.DetalleActividades) <> TRIM(i.DetalleActividades) OR (a.Estimado <> i.Estimado) OR (a.Fecha <> i.Fecha) 
	OR (a.Nombre <> i.Nombre) OR (a.Observaciones <> i.Observaciones) OR (a.TipoActividadId <> i.TipoActividadId))

	SELECT 
		@parameters =
		CASE
			WHEN i.Nombre <> d.Nombre THEN CONCAT('Cambio nombre de: ', d.Nombre, ' a ', i.Nombre)
			WHEN a.Observaciones <> i.Observaciones THEN CONCAT('Cambio observaciones de: ', d.Observaciones, ' a ', i.Observaciones)
			WHEN a.TipoActividadId <> i.TipoActividadId THEN CONCAT('Cambio tipo actividad de: ', d.TipoActividadId, ' a ', i.TipoActividadId)
			WHEN TRIM(a.DetalleActividades) <> TRIM(i.DetalleActividades) THEN 'Cambio detalle'
			WHEN a.Estimado <> i.Estimado THEN CONCAT('Cambio estimado de: ', d.Estimado, ' a ', i.Estimado)
			WHEN a.Fecha <> i.Fecha THEN CONCAT('Cambio fecha de: ', d.Fecha, ' a ', i.Fecha)
		ELSE 'No cambios' END 
	FROM Actividad a
	INNER JOIN inserted i WITH(NOLOCK) ON i.ActividadId = a.ActividadId
	INNER JOIN deleted d WITH(NOLOCK) ON d.ActividadId = i.ActividadId

	INSERT INTO Bitacora VALUES('Update', 'trg_actividad', @parameters, 1000, GETDATE())
	
END