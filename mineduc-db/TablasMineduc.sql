CREATE DATABASE MINEDUC

USE MINEDUC
GO


--Tables without FK
CREATE TABLE Escuela(
	EscuelaId INT IDENTITY PRIMARY KEY,
	Nombre VARCHAR(50),
);

CREATE TABLE Factura(
	FacturaId INT IDENTITY PRIMARY KEY,
	Nombre VARCHAR(250),
	Imagen IMAGE,
	GastoId INT FOREIGN KEY REFERENCES Gasto(GastoId),
	CreateDate DATETIME
);


CREATE TABLE TipoActividad(
	TipoActividadId INT IDENTITY PRIMARY KEY,
	Descripcion VARCHAR(250)
);


--Tables with FK
CREATE TABLE Persona(
	PersonaId INT IDENTITY PRIMARY KEY,
	Nombre VARCHAR(50),
	Dpi VARCHAR(25),
	ComiteId INT FOREIGN KEY REFERENCES Comite(ComiteId)
);

CREATE TABLE Comite(
	ComiteId INT IDENTITY PRIMARY KEY,
	Nombre VARCHAR(25),
	Fondo DECIMAL(10, 2),
	EscuelaId INT FOREIGN KEY REFERENCES Escuela(EscuelaId)
);

CREATE TABLE Actividad(
	ActividadId INT IDENTITY PRIMARY KEY,
	Nombre VARCHAR(25),
	Fecha DATETIME,
	Estimado DECIMAL(10, 2),
	DetalleActividades VARCHAR(250),
	Observaciones VARCHAR(250),
	LastModifiedDate DATETIME,
	TipoActividadId INT FOREIGN KEY REFERENCES TipoActividad(TipoActividadId),
	ComiteId INT FOREIGN KEY REFERENCES Comite(ComiteId)
);


CREATE TABLE Gasto(
	GastoId INT IDENTITY PRIMARY KEY,
	Descripcion VARCHAR(250),
	Monto DECIMAL(10, 2),
	LastModifiedDate DATETIME,
	ActividadId INT FOREIGN KEY REFERENCES Actividad(ActividadId)
);