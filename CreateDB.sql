Create dataBase F1_Garage_Manager

Use F1_Garage_Manager

CREATE TABLE Circuito (
    Nombre VARCHAR(100) PRIMARY KEY,
    Distancia DECIMAL(6,2),
    Curvas INT
);

CREATE TABLE Equipo (
    Nombre VARCHAR(100) PRIMARY KEY
);

CREATE TABLE Usuario (
    Correo VARCHAR(150) PRIMARY KEY,
    Contrasena VARCHAR(255),
    Nombre VARCHAR(100),
    Rol VARCHAR(50),
    Habilidad INT,
    Nombre_Equipo VARCHAR(100)
);

CREATE TABLE Carro (
    N_Chasis VARCHAR(50) PRIMARY KEY,
    Nombre_Equipo VARCHAR(100),
    Correo VARCHAR(150)
);

CREATE TABLE Usuario_Carro (
    Correo VARCHAR(150) PRIMARY KEY,
    N_Chasis VARCHAR(50)
);

CREATE TABLE Instalacion (
    ID INT PRIMARY KEY,
    PU INT,
    Aerodinamica INT,
    Neumaticos INT,
    Suspension INT,
    Caja_Cambios INT,
    N_Chasis VARCHAR(50)
);

CREATE TABLE Inventario_General (
    ID_Item INT PRIMARY KEY,
    Categoria VARCHAR(100),
    Precio DECIMAL(10,2),
    Stock INT
);

CREATE TABLE Parte (
    ID_Parte INT PRIMARY KEY,
    Tipo VARCHAR(100),
    p INT,
    a INT,
    m INT,
    Nombre_Equipo VARCHAR(100),
    N_Chasis VARCHAR(50),
    ID_Item INT
);

CREATE TABLE Simulacion (
    ID_Simulacion INT PRIMARY KEY,
    Correo VARCHAR(150),
    Nombre_Circuito VARCHAR(100)
);

CREATE TABLE Resultado (
    [Timestamp] DATETIME PRIMARY KEY,
    Rankings INT,
    ID_Simulacion INT
);

CREATE TABLE Patrocinadores (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Nombre_Equipo VARCHAR(100)
);

CREATE TABLE Aporte (
    ID_Aporte INT PRIMARY KEY,
    Fecha DATE,
    Monto DECIMAL(10,2),
    Descripcion VARCHAR(255),
    ID INT
);
-- Usuario → Equipo
ALTER TABLE Usuario
ADD CONSTRAINT FK_Usuario_Equipo
FOREIGN KEY (Nombre_Equipo) REFERENCES Equipo(Nombre);

-- Carro → Equipo
ALTER TABLE Carro
ADD CONSTRAINT FK_Carro_Equipo
FOREIGN KEY (Nombre_Equipo) REFERENCES Equipo(Nombre);

-- Carro → Usuario
ALTER TABLE Carro
ADD CONSTRAINT FK_Carro_Usuario
FOREIGN KEY (Correo) REFERENCES Usuario(Correo);

-- Usuario_Carro → Usuario
ALTER TABLE Usuario_Carro
ADD CONSTRAINT FK_UsuarioCarro_Usuario
FOREIGN KEY (Correo) REFERENCES Usuario(Correo);

-- Usuario_Carro → Carro
ALTER TABLE Usuario_Carro
ADD CONSTRAINT FK_UsuarioCarro_Carro
FOREIGN KEY (N_Chasis) REFERENCES Carro(N_Chasis);

-- Instalacion → Carro
ALTER TABLE Instalacion
ADD CONSTRAINT FK_Instalacion_Carro
FOREIGN KEY (N_Chasis) REFERENCES Carro(N_Chasis);

-- Parte → Equipo
ALTER TABLE Parte
ADD CONSTRAINT FK_Parte_Equipo
FOREIGN KEY (Nombre_Equipo) REFERENCES Equipo(Nombre);

-- Parte → Carro
ALTER TABLE Parte
ADD CONSTRAINT FK_Parte_Carro
FOREIGN KEY (N_Chasis) REFERENCES Carro(N_Chasis);

-- Parte → Inventario_General
ALTER TABLE Parte
ADD CONSTRAINT FK_Parte_Inventario
FOREIGN KEY (ID_Item) REFERENCES Inventario_General(ID_Item);

-- Simulacion → Usuario
ALTER TABLE Simulacion
ADD CONSTRAINT FK_Simulacion_Usuario
FOREIGN KEY (Correo) REFERENCES Usuario(Correo);

-- Simulacion → Circuito
ALTER TABLE Simulacion
ADD CONSTRAINT FK_Simulacion_Circuito
FOREIGN KEY (Nombre_Circuito) REFERENCES Circuito(Nombre);

-- Resultado → Simulacion
ALTER TABLE Resultado
ADD CONSTRAINT FK_Resultado_Simulacion
FOREIGN KEY (ID_Simulacion) REFERENCES Simulacion(ID_Simulacion);

-- Patrocinadores → Equipo
ALTER TABLE Patrocinadores
ADD CONSTRAINT FK_Patrocinadores_Equipo
FOREIGN KEY (Nombre_Equipo) REFERENCES Equipo(Nombre);

-- Aporte → Patrocinadores
ALTER TABLE Aporte
ADD CONSTRAINT FK_Aporte_Patrocinador
FOREIGN KEY (ID) REFERENCES Patrocinadores(ID);

