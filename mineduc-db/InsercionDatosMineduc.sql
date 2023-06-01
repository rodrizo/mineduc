-- INSERCIÓN DE DATOS 
USE MINEDUC

INSERT INTO Escuela (nombre) VALUES ('Sagrada Familia');
INSERT INTO Escuela (nombre)VALUES ('Amigos');
INSERT INTO Escuela (nombre) VALUES ('HIGA');
INSERT INTO Escuela (nombre) VALUES ('Albert Einstein');
INSERT INTO Escuela (nombre) VALUES ('IGER');

INSERT INTO Gasto VALUES ('Gasto de material escolar', 500.00, GETDATE(), 1);
INSERT INTO Gasto VALUES ('Gasto de transporte', 250.00, GETDATE(),2);
INSERT INTO Gasto VALUES ('Gasto de alimentos', 800.00, GETDATE(),3);
INSERT INTO Gasto VALUES ('material didáctico', 350.00, GETDATE(),4);
INSERT INTO Gasto VALUES ('Gasto de decoración', 150.00, GETDATE(),5);

INSERT INTO Factura VALUES ('Comida', 1, GETDATE());
INSERT INTO Factura VALUES ('Transporte', 2, GETDATE());
INSERT INTO Factura VALUES ('Utiles escolares', 3, GETDATE());
INSERT INTO Factura VALUES ('Materiales de construccion', 4, GETDATE());
INSERT INTO Factura VALUES ('Refrigerio', 5, GETDATE());

INSERT INTO TipoActividad(descripcion) VALUES ('Organizacion de Eventos');
INSERT INTO TipoActividad(descripcion) VALUES ('Apoyo en Aula');
INSERT INTO TipoActividad(descripcion) VALUES ('Mejora Entorno escolar');
INSERT INTO TipoActividad (descripcion) VALUES ('Toma de decisiones');
INSERT INTO TipoActividad (descripcion) VALUES ('Voluntariado');

INSERT INTO Comite (nombre, Fondo, EscuelaId) VALUES ('Comité de Eventos', 5000.00, 1);
INSERT INTO Comite (nombre, Fondo, EscuelaId) VALUES ('Comité de Celebraciones', 2500.00, 2);
INSERT INTO Comite (nombre, Fondo, EscuelaId) VALUES ('Comité de Salud', 10000.00, 1);
INSERT INTO Comite (nombre, Fondo, EscuelaId) VALUES ('Comité de Transporte', 7500.00, 3);
INSERT INTO Comite (nombre, Fondo, EscuelaId) VALUES ('Comité de Voluntariado', 3000.00, 2);

INSERT INTO Persona (nombre, dpi, ComiteId) VALUES ('Juan Pérez', '1234567890', 1);
INSERT INTO Persona (nombre, dpi, ComiteId) VALUES ('María López', '9876543210', 2);
INSERT INTO Persona (nombre, dpi, ComiteId) VALUES ('Pedro Ramírez', '4567890123', 1);
INSERT INTO Persona (nombre, dpi, ComiteId) VALUES ('Ana García', '7890123456', 3);
INSERT INTO Persona (nombre, dpi, ComiteId) VALUES ('Luisa Martínez', '2345678901', 2);


INSERT INTO Actividad VALUES ('Recreacion', '2023-05-01', 1000.00, 'Compra de articulos', 'Ninguna', 1, 1);
INSERT INTO Actividad VALUES ('Salud', '2023-10-10', 2500.00, 'Compra de Medicina', 'Ninguna', 2, 3);
INSERT INTO Actividad VALUES ('Viaje', '2023-07-05', 500.00, 'Compra Boletos', 'Ninguna', 1, 4);
INSERT INTO Actividad VALUES ('Almuerzo', '2023-08-02', 1500.00, 'Compra Alimentos', 'Ninguna', 1, 2);
INSERT INTO Actividad VALUES ('Pintar Aula', '2023-09-05', 800.00, 'Compra Pintura', 'Ninguna', 3, 5);


