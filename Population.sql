Use F1_Garage_Manager
INSERT INTO Circuito VALUES
('Monza', 5.79, 11),
('Silverstone', 5.89, 18),
('Spa', 7.00, 19);
INSERT INTO Equipo VALUES
('Red Falcon'),
('Blue Storm');
INSERT INTO Usuario VALUES
('admin@correo.com', '1234', 'Administrador', 'Admin', 90, 'Red Falcon'),
('piloto1@correo.com', 'abcd', 'Carlos Perez', 'Piloto', 85, 'Red Falcon'),
('piloto2@correo.com', 'abcd', 'Luis Mora', 'Piloto', 80, 'Blue Storm');
INSERT INTO Carro VALUES
('CHS001', 'Red Falcon', 'piloto1@correo.com'),
('CHS002', 'Blue Storm', 'piloto2@correo.com');
INSERT INTO Usuario_Carro VALUES
('piloto1@correo.com', 'CHS001'),
('piloto2@correo.com', 'CHS002');
INSERT INTO Instalacion VALUES
(1, 80, 85, 90, 88, 87, 'CHS001'),
(2, 75, 80, 85, 82, 80, 'CHS002');
INSERT INTO Inventario_General VALUES
(1, 'Motor', 5000, 10),
(2, 'Aleron', 2000, 15),
(3, 'Neumaticos', 1500, 20);
INSERT INTO Parte VALUES
(1, 'Motor', 90, 85, 88, 'Red Falcon', 'CHS001', 1),
(2, 'Aleron', 85, 90, 80, 'Red Falcon', 'CHS001', 2),
(3, 'Neumaticos', 88, 82, 85, 'Blue Storm', 'CHS002', 3);
INSERT INTO Simulacion VALUES
(1, 'piloto1@correo.com', 'Monza'),
(2, 'piloto2@correo.com', 'Spa');
INSERT INTO Resultado VALUES
(GETDATE(), 1, 1),
(DATEADD(MINUTE, 5, GETDATE()), 2, 2);
INSERT INTO Patrocinadores VALUES
(1, 'Shell', 'Red Falcon'),
(2, 'Puma', 'Blue Storm');
INSERT INTO Aporte VALUES
(1, '2025-01-10', 10000, 'Patrocinio principal', 1),
(2, '2025-01-12', 8000, 'Publicidad', 2);
