CREATE PROCEDURE sp_CompraConPresupuesto
    @ID_Parte INT,
    @Tipo VARCHAR(100),
    @p INT,
    @a INT,
    @m INT,
    @Nombre_Equipo VARCHAR(100),
    @ID_Item INT
AS
BEGIN
    BEGIN TRAN;

    DECLARE @Presupuesto DECIMAL(10,2);
    DECLARE @Gastado DECIMAL(10,2);
    DECLARE @Precio DECIMAL(10,2);

    -- Presupuesto del equipo
    SELECT @Presupuesto = ISNULL(SUM(A.Monto), 0)
    FROM Patrocinadores P
    JOIN Aporte A ON P.ID = A.ID
    WHERE P.Nombre_Equipo = @Nombre_Equipo;

    -- Gasto actual del equipo
    SELECT @Gastado = ISNULL(SUM(I.Precio), 0)
    FROM Parte P
    JOIN Inventario_General I ON P.ID_Item = I.ID_Item
    WHERE P.Nombre_Equipo = @Nombre_Equipo;

    -- Precio del item
    SELECT @Precio = Precio
    FROM Inventario_General
    WHERE ID_Item = @ID_Item;

    -- Validar stock
    IF NOT EXISTS (
        SELECT 1 FROM Inventario_General
        WHERE ID_Item = @ID_Item AND Stock > 0
    )
    BEGIN
        ROLLBACK;
        RAISERROR('No hay stock disponible', 16, 1);
        RETURN;
    END

    -- Validar presupuesto
    IF (@Gastado + @Precio) > @Presupuesto
    BEGIN
        ROLLBACK;
        RAISERROR('Presupuesto insuficiente para la compra', 16, 1);
        RETURN;
    END

    -- Descontar inventario general
    UPDATE Inventario_General
    SET Stock = Stock - 1
    WHERE ID_Item = @ID_Item;

    -- Agregar parte al inventario del equipo
    INSERT INTO Parte (
        ID_Parte, Tipo, p, a, m,
        Nombre_Equipo, N_Chasis, ID_Item
    )
    VALUES (
        @ID_Parte, @Tipo, @p, @a, @m,
        @Nombre_Equipo, NULL, @ID_Item
    );

    COMMIT;
END;


CREATE PROCEDURE sp_ComprarParte
    @ID_Parte INT,
    @Tipo VARCHAR(100),
    @p INT,
    @a INT,
    @m INT,
    @Nombre_Equipo VARCHAR(100),
    @ID_Item INT
AS
BEGIN
    BEGIN TRAN;

    -- Validar stock
    IF NOT EXISTS (
        SELECT 1 FROM Inventario_General
        WHERE ID_Item = @ID_Item AND Stock > 0
    )
    BEGIN
        ROLLBACK;
        RAISERROR('No hay stock disponible', 16, 1);
        RETURN;
    END

    -- Descontar inventario general
    UPDATE Inventario_General
    SET Stock = Stock - 1
    WHERE ID_Item = @ID_Item;

    -- Agregar parte al inventario del equipo (sin carro)
    INSERT INTO Parte (
        ID_Parte, Tipo, p, a, m,
        Nombre_Equipo, N_Chasis, ID_Item
    )
    VALUES (
        @ID_Parte, @Tipo, @p, @a, @m,
        @Nombre_Equipo, NULL, @ID_Item
    );

    COMMIT;
END;

CREATE PROCEDURE sp_ArmarCarro
    @ID_Parte INT,
    @N_Chasis VARCHAR(50)
AS
BEGIN
    BEGIN TRAN;

    -- Verificar que la parte exista y no esté instalada
    IF NOT EXISTS (
        SELECT 1 FROM Parte
        WHERE ID_Parte = @ID_Parte
          AND N_Chasis IS NULL
    )
    BEGIN
        ROLLBACK;
        RAISERROR('La parte no está disponible en el inventario del equipo', 16, 1);
        RETURN;
    END

    -- Asignar parte al carro
    UPDATE Parte
    SET N_Chasis = @N_Chasis
    WHERE ID_Parte = @ID_Parte;

    COMMIT;
END;

CREATE PROCEDURE sp_InventarioEquipo
    @Nombre_Equipo VARCHAR(100)
AS
BEGIN
    SELECT 
        P.ID_Parte,
        P.Tipo,
        I.Categoria,
        I.Precio
    FROM Parte P
    JOIN Inventario_General I ON P.ID_Item = I.ID_Item
    WHERE P.Nombre_Equipo = @Nombre_Equipo
      AND P.N_Chasis IS NULL;
END;

