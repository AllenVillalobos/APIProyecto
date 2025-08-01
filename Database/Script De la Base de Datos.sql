CREATE DATABASE  Proyecto
GO 
USE Proyecto

GO
CREATE TABLE Rol (
idRol INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
nombreRol NVARCHAR(100) NOT NULL,
descripcionRol NVARCHAR(150),
adicionadoPor NVARCHAR(150) NOT NULL,
fechaAdicion DATE NOT NULL,
fechaModificacion DATE,
modificadoPor NVARCHAR(150)
);

GO
CREATE TABLE Usuario (
idUsuario INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
nombreUsuario NVARCHAR(100) NOT NULL,
contrasenna NVARCHAR(150) NOT NULL,
adicionadoPor NVARCHAR(150) NOT NULL,
fechaAdicion DATE NOT NULL,
fechaModificacion DATE,
modificadoPor NVARCHAR(150)
);

GO
CREATE TABLE ListaRoles (
idRol INT NOT NULL,
idUsuario INT NOT NULL,
estado CHAR(1) NOT NULL,
adicionadoPor NVARCHAR(150) NOT NULL,
fechaAdicion DATE NOT NULL,
fechaModificacion DATE,
modificadoPor NVARCHAR(150),
PRIMARY KEY (idRol, idUsuario)
);

GO
ALTER TABLE ListaRoles
ADD CONSTRAINT fkRolLR FOREIGN KEY (idRol) REFERENCES Rol(idRol);

GO
ALTER TABLE ListaRoles
ADD CONSTRAINT fkUsuarioLR FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario);

GO
CREATE TABLE Empleado (
idEmpleado INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
identificacion NVARCHAR(30) NOT NULL,
primerNombre NVARCHAR(100) NOT NULL,
segundoNombre NVARCHAR(100),
primerApellido NVARCHAR(100) NOT NULL,
segundoApellido NVARCHAR(100),
fechaContratacion DATE NOT NULL,
salarioBruto FLOAT NOT NULL,
idUsuario INT NOT NULL UNIQUE,
activo CHAR(1) NOT NULL,
fechaAdicion DATE NOT NULL,
adicionadoPor NVARCHAR(150) NOT NULL,
fechaModificacion DATE,
usuarioModificacion NVARCHAR(150) 
);

GO
ALTER TABLE Empleado
ADD CONSTRAINT fkUsuarioE FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario);

GO
CREATE TABLE HistorialSalarios (
idHistorialSalario INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
salarioAnterior FLOAT NOT NULL,
salarioNuevo FLOAT NOT NULL,
adicionadoPor NVARCHAR(200) NOT NULL,
fechaAdicion DATE NOT NULL,
fechaModificacion DATE,
usuarioModificacion NVARCHAR(200),
idEmpleado INT NOT NULL
);

GO
ALTER TABLE HistorialSalarios
ADD CONSTRAINT fkEmpleadoHS FOREIGN KEY (idEmpleado) REFERENCES Empleado(idEmpleado);

GO
CREATE TABLE SolicitudVacaciones (
idSolicitudVacaciones INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
detalle NVARCHAR(200) NOT NULL,
estado NVARCHAR(150) NOT NULL,
revisadoPor NVARCHAR(150),
fechaRevision DATE,
fechaAdicion DATE NOT NULL,
adicionadoPor NVARCHAR(150) NOT NULL,
fechaModificacion DATE,
usuarioModificacion NVARCHAR(150),
idEmpleado INT NOT NULL
);

GO
ALTER TABLE SolicitudVacaciones
ADD CONSTRAINT fkEmpleadoSV FOREIGN KEY (idEmpleado) REFERENCES Empleado(idEmpleado);

GO
CREATE TABLE Contacto (
idContacto INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
tipoContacto NVARCHAR(100) NOT NULL,
infoContacto NVARCHAR(200) NOT NULL,
adicionadoPor NVARCHAR(250) NOT NULL,
fechaAdicion DATE NOT NULL,
fechaModificacion DATE,
usuarioModificacion NVARCHAR(250),
idEmpleado INT NOT NULL
);

GO
ALTER TABLE Contacto
ADD CONSTRAINT fkEmpleadoCO FOREIGN KEY (idEmpleado) REFERENCES Empleado(idEmpleado);

GO
CREATE TABLE Contrato (
idContrato INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
tipoContrato NVARCHAR(200) NOT NULL,
estadoContrato CHAR(1) NOT NULL,
adicionadoPor NVARCHAR(200) NOT NULL,
fechaAdicion DATE NOT NULL,
fechaModificacion DATE,
usuarioModificacion NVARCHAR(200),
idEmpleado INT NOT NULL UNIQUE
);

GO
ALTER TABLE Contrato
ADD CONSTRAINT fkEmpleadoCT FOREIGN KEY (idEmpleado) REFERENCES Empleado(idEmpleado);

GO
CREATE TABLE Puesto (
idPuesto INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
nombre NVARCHAR(200) NOT NULL,
descripcion NVARCHAR(200) NOT NULL,
estado CHAR(1) NOT NULL,
adicionadoPor NVARCHAR(200) NOT NULL,
fechaAdicion DATE NOT NULL,
fechaModificacion DATE,
usuarioModificacion NVARCHAR(200)
);

GO
CREATE TABLE HistorialPuesto (
idEmpleado INT NOT NULL,
idPuesto INT NOT NULL,
estado CHAR(1) NOT NULL,
adicionadoPor NVARCHAR(150) NOT NULL,
fechaAdicion DATE NOT NULL,
fechaModificacion DATE,
modificadoPor NVARCHAR(150),
PRIMARY KEY (idEmpleado, idPuesto)
);

GO
ALTER TABLE HistorialPuesto
ADD CONSTRAINT fkEmpleadoHP FOREIGN KEY (idEmpleado) REFERENCES Empleado(idEmpleado);

GO
ALTER TABLE HistorialPuesto
ADD CONSTRAINT fkPuestoHP FOREIGN KEY (idPuesto) REFERENCES Puesto(idPuesto);

GO
CREATE TABLE Jornada (
idJornada INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
nombre NVARCHAR(250) NOT NULL,
descripcion NVARCHAR(200) NOT NULL,
estado CHAR(1) NOT NULL,
horasSemanales INT NOT NULL,
adicionadoPor NVARCHAR(200) NOT NULL,
fechaAdicion DATE NOT NULL,
fechaModificacion DATE,
usuarioModificacion NVARCHAR(200)
);

GO
CREATE TABLE HistorialJornada (
idEmpleado INT NOT NULL,
idJornada INT NOT NULL,
estado CHAR(1) NOT NULL,
adicionadoPor NVARCHAR(150) NOT NULL,
fechaAdicion DATE NOT NULL,
fechaModificacion DATE NULL,
modificadoPor NVARCHAR(150) NULL,
PRIMARY KEY (idEmpleado, idJornada)
);

GO
ALTER TABLE HistorialJornada
ADD CONSTRAINT fkEmpleadoHJ FOREIGN KEY (idEmpleado) REFERENCES Empleado(idEmpleado);

GO
ALTER TABLE HistorialJornada
ADD CONSTRAINT fkJornadaHJ FOREIGN KEY (idJornada) REFERENCES Jornada(idJornada);

GO
CREATE TABLE Departamento (
idDepartamento INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
nombre NVARCHAR(100) NOT NULL,
descripcion NVARCHAR(250),
estado CHAR(1) NOT NULL,
adicionadoPor NVARCHAR(250) NOT NULL,
fechaAdicion DATE NOT NULL,
fechaModificacion DATE,
usuarioModificacion NVARCHAR(250)
);

GO
CREATE TABLE HistorialDepartamentos (
idEmpleado INT NOT NULL,
idDepartamento INT NOT NULL,
estado CHAR(1) NOT NULL,
adicionadoPor NVARCHAR(150) NOT NULL,
fechaAdicion DATE NOT NULL,
fechaModificacion DATE,
modificadoPor NVARCHAR(150),
PRIMARY KEY (idEmpleado, idDepartamento)
);

GO
ALTER TABLE HistorialDepartamentos
ADD CONSTRAINT fkEmpleadoHD FOREIGN KEY (idEmpleado) REFERENCES Empleado(idEmpleado);

GO
ALTER TABLE HistorialDepartamentos
ADD CONSTRAINT fkDepartamentoHD FOREIGN KEY (idDepartamento) REFERENCES Departamento(idDepartamento);

GO 
CREATE PROCEDURE spListarSolicitudVacaciones
AS
BEGIN
   DECLARE @ErrorMessage NVARCHAR(255);
   DECLARE @ErrorSeverity INT;
   DECLARE @ErrorState INT;
    BEGIN TRY
        SELECT
		    SV.idSolicitudVacaciones,
            SV.detalle,
            SV.estado,
            SV.fechaAdicion AS 'FechaCreacion',
            E.primerNombre + ' ' + E.primerApellido AS 'NombreCompleto',
            SV.revisadoPor,
            SV.fechaRevision
        FROM SolicitudVacaciones SV
        INNER JOIN Empleado E ON SV.idEmpleado = E.idEmpleado;
    END TRY
    BEGIN CATCH
        SET @ErrorMessage = ERROR_MESSAGE();
        SET @ErrorSeverity  = ERROR_SEVERITY();
        SET @ErrorState = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;

GO
CREATE PROCEDURE spCrearSolicitudVacaciones
(
    @pDetalle NVARCHAR(200),
    @pIdEmpleado INT,
    @pAdicionadoPor NVARCHAR(150)
)
AS
BEGIN
   DECLARE @ErrorMessage NVARCHAR(255);
   DECLARE @ErrorSeverity INT;
   DECLARE @ErrorState INT;
    BEGIN TRY
        -- Verificar si el empleado existe
        IF NOT EXISTS (
            SELECT 1 FROM Empleado WHERE idEmpleado = @pIdEmpleado
        )
        BEGIN
            RAISERROR('El empleado con ID: %d no existe.', 16, 1, @pIdEmpleado);
            RETURN;
        END

        -- Insertar nueva solicitud de vacaciones
        INSERT INTO SolicitudVacaciones (
            detalle,
            estado,
            fechaAdicion,
            adicionadoPor,
            idEmpleado
        )
        VALUES (
            @pDetalle,
            'En Revision',
            GETDATE(),
            @pAdicionadoPor,
            @pIdEmpleado
        );
    END TRY
    BEGIN CATCH
        SET @ErrorMessage = ERROR_MESSAGE();
        SET @ErrorSeverity = ERROR_SEVERITY();
        SET @ErrorState = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;


GO
CREATE PROCEDURE spModificarSolicitudVacaciones
(
    @pidSolicitudVacaciones INT,
    @pResolucion NVARCHAR(150),
    @pRevisadoPor NVARCHAR(150)
)
AS
BEGIN
   DECLARE @ErrorMessage NVARCHAR(255);
   DECLARE @ErrorSeverity INT;
   DECLARE @ErrorState INT;
    BEGIN TRY
        -- Verificar si la solicitud existe
        IF NOT EXISTS (
            SELECT 1 
            FROM SolicitudVacaciones 
            WHERE idSolicitudVacaciones = @pidSolicitudVacaciones
        )
        BEGIN
            RAISERROR('La solicitud de vacaciones con el ID %d no existe.', 16, 1, @pidSolicitudVacaciones);
            RETURN;
        END

        -- Actualizar solicitud si existe
        UPDATE SolicitudVacaciones
        SET
            estado = @pResolucion,
            revisadoPor = @pRevisadoPor,
            fechaModificacion = GETDATE(),
            fechaRevision = GETDATE()
        WHERE idSolicitudVacaciones = @pidSolicitudVacaciones;

    END TRY
    BEGIN CATCH
        SET @ErrorMessage = ERROR_MESSAGE();
        SET @ErrorSeverity = ERROR_SEVERITY();
        SET @ErrorState = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;

GO
CREATE PROCEDURE spLogin
(
    @pNombreUsuario NVARCHAR(100),
    @pcontrasenna NVARCHAR(150)
)
AS
BEGIN
   DECLARE @ErrorMessage NVARCHAR(255);
   DECLARE @ErrorSeverity INT;
   DECLARE @ErrorState INT;
    BEGIN TRY
        -- Verificar si el usuario existe
        IF NOT EXISTS (
            SELECT 1 FROM Usuario WHERE nombreUsuario = @pNombreUsuario
        )
        BEGIN
            RAISERROR('El usuario "%s" no está registrado.', 16, 1, @pNombreUsuario);
            RETURN;
        END

        -- Verificar si la contraseña coincide
        IF NOT EXISTS (
            SELECT 1 FROM Usuario 
            WHERE nombreUsuario = @pNombreUsuario AND contrasenna = @pcontrasenna
        )
        BEGIN
            RAISERROR('La contraseña ingresada para el usuario "%s" es incorrecta.', 16, 1, @pNombreUsuario);
            RETURN;
        END

        -- Si pasó ambas validaciones, retornar datos del usuario
        SELECT 
            U.idUsuario,
            U.nombreUsuario,
			E.idEmpleado,
			E.primerNombre + ' ' + 
            ISNULL(E.segundoNombre + ' ', '') + 
            E.primerApellido + ' ' + 
            ISNULL(E.segundoApellido, '') AS NombreCompleto
        FROM Usuario U
		INNER JOIN Empleado E
		ON U.idUsuario = E.idUsuario
        WHERE U.nombreUsuario = @pNombreUsuario AND U.contrasenna = @pcontrasenna;

    END TRY
    BEGIN CATCH
        SET @ErrorMessage = ERROR_MESSAGE();
        SET @ErrorSeverity = ERROR_SEVERITY();
        SET @ErrorState = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;

GO
CREATE PROCEDURE spListarPermisosPorUsuario
(
    @pidUsuario INT
)
AS
BEGIN
   DECLARE @ErrorMessage NVARCHAR(255);
   DECLARE @ErrorSeverity INT;
   DECLARE @ErrorState INT;
    BEGIN TRY
        -- Verificar si el usuario existe
        IF NOT EXISTS (
            SELECT 1 FROM Usuario WHERE idUsuario = @pidUsuario
        )
        BEGIN
            RAISERROR('El usuario con ID %d no existe.', 16, 1, @pidUsuario);
            RETURN;
        END

        -- Devolver roles asignados
        SELECT R.nombreRol
        FROM ListaRoles LR
        INNER JOIN Rol R ON LR.idRol = R.idRol
        WHERE LR.idUsuario = @pidUsuario AND LR.estado = 'A';
    END TRY
    BEGIN CATCH
        SET @ErrorMessage = ERROR_MESSAGE();
        SET @ErrorSeverity = ERROR_SEVERITY();
        SET @ErrorState = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;

GO
CREATE PROCEDURE spConstanciaSalarial
(
    @pIdEmpleado INT
)
AS
BEGIN
   DECLARE @ErrorMessage NVARCHAR(255);
   DECLARE @ErrorSeverity INT;
   DECLARE @ErrorState INT;
    BEGIN TRY
        -- Verificar si el empleado existe
        IF NOT EXISTS (
            SELECT 1 FROM Empleado WHERE idEmpleado = @pIdEmpleado
        )
        BEGIN
            RAISERROR('El empleado con ID %d no existe.', 16, 1, @pIdEmpleado);
            RETURN;
        END

        -- Obtener datos del empleado para la constancia
        SELECT 
            E.idEmpleado,
            E.identificacion,
            E.primerNombre + ' ' + 
            ISNULL(E.segundoNombre + ' ', '') + 
            E.primerApellido + ' ' + 
            ISNULL(E.segundoApellido, '') AS NombreCompleto,
            E.salarioBruto,
            E.fechaContratacion,
            E.activo,
            D.nombre AS Departamento,
            P.nombre AS Puesto,
            C.tipoContrato
        FROM Empleado E
        LEFT JOIN HistorialDepartamentos HD ON E.idEmpleado = HD.idEmpleado AND HD.estado = 'A'
        LEFT JOIN Departamento D ON HD.idDepartamento = D.idDepartamento
        LEFT JOIN HistorialPuesto HP ON E.idEmpleado = HP.idEmpleado AND HP.estado = 'A'
        LEFT JOIN Puesto P ON HP.idPuesto = P.idPuesto
        LEFT JOIN Contrato C ON E.idEmpleado = C.idEmpleado;

    END TRY
    BEGIN CATCH
        SET @ErrorMessage = ERROR_MESSAGE();
        SET @ErrorSeverity = ERROR_SEVERITY();
        SET @ErrorState = ERROR_STATE();
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;

GO
CREATE PROCEDURE spGenerarLiquidacionEmpleado
(
    @pIdEmpleado INT,
    @pFechaSalida DATE
)
AS
BEGIN
   DECLARE @ErrorMessage NVARCHAR(255);
   DECLARE @ErrorSeverity INT;
   DECLARE @ErrorState INT;
   DECLARE @salarioBruto FLOAT;
   DECLARE @fechaIngreso DATE;
   DECLARE @salarioDiario FLOAT;
   DECLARE @diasTrabajados INT;
   DECLARE @aniosTrabajados FLOAT;

    BEGIN TRY
        -- Validación de existencia
        IF NOT EXISTS (SELECT 1 FROM Empleado WHERE idEmpleado = @pIdEmpleado)
        BEGIN
            RAISERROR('El empleado con ID %d no existe.', 16, 1, @pIdEmpleado);
            RETURN;
        END
        -- Obtener datos del empleado
        SELECT 
            @salarioBruto = salarioBruto,
            @fechaIngreso = fechaContratacion
        FROM Empleado
        WHERE idEmpleado = @pIdEmpleado;

        -- Cálculos base
        SET @salarioDiario = @salarioBruto / 30.0;
        SET @diasTrabajados = DATEDIFF(DAY, @fechaIngreso, @pFechaSalida);
        SET @aniosTrabajados = ROUND(@diasTrabajados / 365.0, 2);

        -- Inicialización
        DECLARE 
            @cesantia FLOAT = 0,
            @preaviso FLOAT = 0,
            @vacaciones FLOAT = 0,
            @aguinaldo FLOAT = 0;

        -- Cesantía (19.5 días por año, máx 8 años)
        IF @aniosTrabajados >= 1
        BEGIN
            IF @aniosTrabajados > 8
                SET @cesantia = 8 * 19.5 * @salarioDiario;
            ELSE
                SET @cesantia = @aniosTrabajados * 19.5 * @salarioDiario;
        END

        -- Preaviso
        IF @aniosTrabajados < 0.25
            SET @preaviso = 7 * @salarioDiario;
        ELSE IF @aniosTrabajados < 1
            SET @preaviso = 15 * @salarioDiario;
        ELSE
            SET @preaviso = 30 * @salarioDiario;

        -- Vacaciones (1.25 días por mes trabajado = 15 por año)
        SET @vacaciones = @aniosTrabajados * 15 * @salarioDiario;

        -- Aguinaldo proporcional
        SET @aguinaldo = (@salarioBruto * (@aniosTrabajados * 12)) / 12;

        -- Resultado final
        SELECT 
            @pIdEmpleado AS idEmpleado,
            @salarioBruto AS salarioMensual,
            ROUND(@salarioDiario, 2) AS salarioDiario,
            ROUND(@aniosTrabajados, 2) AS aniosTrabajados,
            ROUND(@vacaciones, 2) AS vacacionesProporcionales,
            ROUND(@aguinaldo, 2) AS aguinaldoProporcional,
            ROUND(@preaviso, 2) AS montoPreaviso,
            ROUND(@cesantia, 2) AS montoCesantia,
            ROUND(@vacaciones + @aguinaldo + @preaviso + @cesantia, 2) AS totalLiquidacion;

    END TRY
    BEGIN CATCH
        SET @ErrorMessage = ERROR_MESSAGE();
        SET @ErrorSeverity = ERROR_SEVERITY();
        SET @ErrorState = ERROR_STATE();
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;

GO
CREATE PROCEDURE spListarEmpleados
AS
BEGIN 
    DECLARE @ErrorMessage NVARCHAR(255);
	DECLARE @ErrorSeverity INT;
	DECLARE @ErrorState INT;
    BEGIN TRY
        SELECT 
            E.idEmpleado,
            E.identificacion,
            E.primerNombre + ' ' + 
            ISNULL(E.segundoNombre + ' ', '') + 
            E.primerApellido + ' ' + 
            ISNULL(E.segundoApellido, '') AS NombreCompleto,
            E.salarioBruto,
            D.nombre AS Departamento,
            P.nombre AS Puesto,
            J.nombre AS Jornada
        FROM Empleado E
        LEFT JOIN HistorialDepartamentos HD ON E.idEmpleado = HD.idEmpleado AND HD.estado = 'A'
        LEFT JOIN Departamento D ON HD.idDepartamento = D.idDepartamento
        LEFT JOIN HistorialPuesto HP ON E.idEmpleado = HP.idEmpleado AND HP.estado = 'A'
        LEFT JOIN Puesto P ON HP.idPuesto = P.idPuesto
        LEFT JOIN HistorialJornada HJ ON E.idEmpleado = HJ.idEmpleado AND HJ.estado = 'A'
        LEFT JOIN Jornada J ON J.idJornada = HJ.idJornada;
    END TRY
    BEGIN CATCH
        SET @ErrorMessage = ERROR_MESSAGE();
        SET @ErrorSeverity = ERROR_SEVERITY();
        SET @ErrorState = ERROR_STATE();
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;


GO
CREATE PROCEDURE spListarEmpleado
(
    @pIdEmpleado INT
)
AS
BEGIN 
    DECLARE @ErrorMessage NVARCHAR(255);
	DECLARE @ErrorSeverity INT;
	DECLARE @ErrorState INT;
    BEGIN TRY
        -- Validar existencia
        IF NOT EXISTS (SELECT 1 FROM Empleado WHERE idEmpleado = @pIdEmpleado)
        BEGIN
            RAISERROR('El empleado con ID %d no existe.', 16, 1, @pIdEmpleado);
            RETURN;
        END

        -- Devolver detalle
        SELECT 
            E.idEmpleado,
            E.identificacion,
            E.primerNombre + ' ' + 
            ISNULL(E.segundoNombre + ' ', '') + 
            E.primerApellido + ' ' + 
            ISNULL(E.segundoApellido, '') AS NombreCompleto,
            E.salarioBruto,
            D.nombre AS Departamento,
            P.nombre AS Puesto,
            J.nombre AS Jornada
        FROM Empleado E
        LEFT JOIN HistorialDepartamentos HD ON E.idEmpleado = HD.idEmpleado AND HD.estado = 'A'
        LEFT JOIN Departamento D ON HD.idDepartamento = D.idDepartamento
        LEFT JOIN HistorialPuesto HP ON E.idEmpleado = HP.idEmpleado AND HP.estado = 'A'
        LEFT JOIN Puesto P ON HP.idPuesto = P.idPuesto
        LEFT JOIN HistorialJornada HJ ON E.idEmpleado = HJ.idEmpleado AND HJ.estado = 'A'
        LEFT JOIN Jornada J ON J.idJornada = HJ.idJornada
        WHERE E.idEmpleado = @pIdEmpleado;
    END TRY
    BEGIN CATCH
        SET @ErrorMessage = ERROR_MESSAGE();
        SET @ErrorSeverity = ERROR_SEVERITY();
        SET @ErrorState = ERROR_STATE();
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;







-- Tabla Rol
INSERT INTO Rol (nombreRol, descripcionRol, adicionadoPor, fechaAdicion) VALUES ('Director', 'Puede hacer todas las acciones', 'admin', '2022-08-30');
INSERT INTO Rol (nombreRol, descripcionRol, adicionadoPor, fechaAdicion) VALUES ('Normal', 'Puede hacer acciones limitadas', 'admin', '2022-11-01');
INSERT INTO Rol (nombreRol, descripcionRol, adicionadoPor, fechaAdicion) VALUES ('Agregar', 'Solo puede agregar', 'admin', '2024-01-15');

-- Tabla Usuario
INSERT INTO Usuario (nombreUsuario, contrasenna, adicionadoPor, fechaAdicion) VALUES ('lucila.bustos', 'pass1123', 'admin', '2023-03-07');
INSERT INTO Usuario (nombreUsuario, contrasenna, adicionadoPor, fechaAdicion) VALUES ('bernal.castro', 'pass2123', 'admin', '2025-03-15');
INSERT INTO Usuario (nombreUsuario, contrasenna, adicionadoPor, fechaAdicion) VALUES ('arce.patricia', 'pass3123', 'admin', '2024-06-04');
INSERT INTO Usuario (nombreUsuario, contrasenna, adicionadoPor, fechaAdicion) VALUES ('julio.rivera', 'pass4123', 'admin', '2023-06-30');
INSERT INTO Usuario (nombreUsuario, contrasenna, adicionadoPor, fechaAdicion) VALUES ('trinidad.vazquez', 'pass5123', 'admin', '2022-11-27');

-- Tabla ListaRoles
INSERT INTO ListaRoles (idRol, idUsuario, estado, adicionadoPor, fechaAdicion) VALUES (1, 1, 'A', 'admin', '2024-07-07');
INSERT INTO ListaRoles (idRol, idUsuario, estado, adicionadoPor, fechaAdicion) VALUES (2, 2, 'A', 'admin', '2022-03-29');
INSERT INTO ListaRoles (idRol, idUsuario, estado, adicionadoPor, fechaAdicion) VALUES (3, 3, 'A', 'admin', '2022-10-20');

-- Tabla Empleado
INSERT INTO Empleado (identificacion, primerNombre, segundoNombre, primerApellido, segundoApellido, fechaContratacion, salarioBruto, idUsuario, activo, fechaAdicion, adicionadoPor) VALUES ('160-38-2402', 'Julio', 'César', 'Sánchez', 'Acosta', '2022-01-21', 783789, 1, 'S', '2022-11-18', 'admin');
INSERT INTO Empleado (identificacion, primerNombre, segundoNombre, primerApellido, segundoApellido, fechaContratacion, salarioBruto, idUsuario, activo, fechaAdicion, adicionadoPor) VALUES ('789-89-7763', 'Camila', 'Victoria', 'Gómez', 'Mora', '2024-03-12', 569007, 2, 'S', '2023-12-26', 'admin');
INSERT INTO Empleado (identificacion, primerNombre, segundoNombre, primerApellido, segundoApellido, fechaContratacion, salarioBruto, idUsuario, activo, fechaAdicion, adicionadoPor) VALUES ('105-37-1592', 'Esteban', 'Andrés', 'López', 'Fernández', '2022-04-11', 346481, 3, 'S', '2025-06-25', 'admin');
INSERT INTO Empleado (identificacion, primerNombre, segundoNombre, primerApellido, segundoApellido, fechaContratacion, salarioBruto, idUsuario, activo, fechaAdicion, adicionadoPor) VALUES ('176-45-3926', 'Karla', 'Isabel', 'Hernández', 'Vega', '2023-09-02', 547870, 4, 'S', '2022-03-13', 'admin');
INSERT INTO Empleado (identificacion, primerNombre, segundoNombre, primerApellido, segundoApellido, fechaContratacion, salarioBruto, idUsuario, activo, fechaAdicion, adicionadoPor) VALUES ('145-88-6481', 'Mauricio', 'Leonel', 'Cordero', 'Méndez', '2022-07-14', 598496, 5, 'S', '2022-07-30', 'admin');

-- Tabla HistorialSalarios
INSERT INTO HistorialSalarios (salarioAnterior, salarioNuevo, adicionadoPor, fechaAdicion, idEmpleado) VALUES (377440, 655048, 'admin', '2025-01-16', 1);
INSERT INTO HistorialSalarios (salarioAnterior, salarioNuevo, adicionadoPor, fechaAdicion, idEmpleado) VALUES (465885, 727739, 'admin', '2022-10-02', 2);
INSERT INTO HistorialSalarios (salarioAnterior, salarioNuevo, adicionadoPor, fechaAdicion, idEmpleado) VALUES (331493, 579050, 'admin', '2023-04-16', 3);
INSERT INTO HistorialSalarios (salarioAnterior, salarioNuevo, adicionadoPor, fechaAdicion, idEmpleado) VALUES (474682, 606427, 'admin', '2022-11-18', 4);
INSERT INTO HistorialSalarios (salarioAnterior, salarioNuevo, adicionadoPor, fechaAdicion, idEmpleado) VALUES (486290, 662143, 'admin', '2025-01-25', 5);

-- Tabla SolicitudVacaciones
INSERT INTO SolicitudVacaciones (detalle, estado, fechaAdicion, adicionadoPor, idEmpleado) VALUES ('Necesito vacaciones para asuntos familiares.', 'Pendiente', '2024-12-22', 'admin', 1);
INSERT INTO SolicitudVacaciones (detalle, estado, fechaAdicion, adicionadoPor, idEmpleado) VALUES ('Quiero descansar durante Semana Santa.', 'Pendiente', '2022-07-04', 'admin', 2);
INSERT INTO SolicitudVacaciones (detalle, estado, fechaAdicion, adicionadoPor, idEmpleado) VALUES ('Solicito vacaciones para viaje internacional.', 'Pendiente', '2024-12-26', 'admin', 3);
INSERT INTO SolicitudVacaciones (detalle, estado, fechaAdicion, adicionadoPor, idEmpleado) VALUES ('Deseo tiempo para resolver temas personales.', 'Pendiente', '2022-10-15', 'admin', 4);
INSERT INTO SolicitudVacaciones (detalle, estado, fechaAdicion, adicionadoPor, idEmpleado) VALUES ('Vacaciones solicitadas para asistir a boda.', 'Pendiente', '2024-11-10', 'admin', 5);

-- Tabla Contacto
INSERT INTO Contacto (tipoContacto, infoContacto, adicionadoPor, fechaAdicion, idEmpleado) VALUES ('Correo', 'lucila@example.com', 'admin', '2025-04-02', 1);
INSERT INTO Contacto (tipoContacto, infoContacto, adicionadoPor, fechaAdicion, idEmpleado) VALUES ('Correo', 'bernal@example.com', 'admin', '2025-05-08', 2);
INSERT INTO Contacto (tipoContacto, infoContacto, adicionadoPor, fechaAdicion, idEmpleado) VALUES ('Correo', 'arce@example.com', 'admin', '2022-12-20', 3);
INSERT INTO Contacto (tipoContacto, infoContacto, adicionadoPor, fechaAdicion, idEmpleado) VALUES ('Correo', 'julio@example.com', 'admin', '2024-03-25', 4);
INSERT INTO Contacto (tipoContacto, infoContacto, adicionadoPor, fechaAdicion, idEmpleado) VALUES ('Correo', 'trinidad@example.com', 'admin', '2025-04-12', 5);

-- Tabla Contrato
INSERT INTO Contrato (tipoContrato, estadoContrato, adicionadoPor, fechaAdicion, idEmpleado) VALUES ('Indefinido', 'A', 'admin', '2022-09-06', 1);
INSERT INTO Contrato (tipoContrato, estadoContrato, adicionadoPor, fechaAdicion, idEmpleado) VALUES ('Temporal', 'A', 'admin', '2023-08-17', 2);
INSERT INTO Contrato (tipoContrato, estadoContrato, adicionadoPor, fechaAdicion, idEmpleado) VALUES ('Indefinido', 'A', 'admin', '2024-11-30', 3);
INSERT INTO Contrato (tipoContrato, estadoContrato, adicionadoPor, fechaAdicion, idEmpleado) VALUES ('Indefinido', 'A', 'admin', '2023-12-23', 4);
INSERT INTO Contrato (tipoContrato, estadoContrato, adicionadoPor, fechaAdicion, idEmpleado) VALUES ('Temporal', 'A', 'admin', '2022-01-08', 5);

-- Tabla Puesto
INSERT INTO Puesto (nombre, descripcion, estado, adicionadoPor, fechaAdicion) VALUES ('Director de Marketing', 'Desarrolla estrategias promocionales.', 'A', 'admin', '2023-09-25');
INSERT INTO Puesto (nombre, descripcion, estado, adicionadoPor, fechaAdicion) VALUES ('Ingeniero DevOps', 'Gestiona integración y despliegue continuo.', 'A', 'admin', '2025-05-28');
INSERT INTO Puesto (nombre, descripcion, estado, adicionadoPor, fechaAdicion) VALUES ('Analista de sistemas', 'Analiza requerimientos del sistema.', 'A', 'admin', '2022-03-16');

-- Tabla HistorialPuesto
INSERT INTO HistorialPuesto (idEmpleado, idPuesto, estado, adicionadoPor, fechaAdicion) VALUES (1, 2, 'A', 'admin', '2024-04-30');
INSERT INTO HistorialPuesto (idEmpleado, idPuesto, estado, adicionadoPor, fechaAdicion) VALUES (2, 1, 'A', 'admin', '2023-06-29');
INSERT INTO HistorialPuesto (idEmpleado, idPuesto, estado, adicionadoPor, fechaAdicion) VALUES (3, 1, 'A', 'admin', '2022-12-27');
INSERT INTO HistorialPuesto (idEmpleado, idPuesto, estado, adicionadoPor, fechaAdicion) VALUES (4, 3, 'A', 'admin', '2023-11-08');
INSERT INTO HistorialPuesto (idEmpleado, idPuesto, estado, adicionadoPor, fechaAdicion) VALUES (5, 2, 'A', 'admin', '2024-07-11');

-- Tabla Jornada
INSERT INTO Jornada (nombre, descripcion, estado, horasSemanales, adicionadoPor, fechaAdicion) VALUES ('Jornada 1', 'Horario matutino de 8 a 12.', 'A', 40, 'admin', '2024-08-10');
INSERT INTO Jornada (nombre, descripcion, estado, horasSemanales, adicionadoPor, fechaAdicion) VALUES ('Jornada 2', 'Horario vespertino de 1 a 5.', 'A', 45, 'admin', '2025-06-28');

-- Tabla HistorialJornada
INSERT INTO HistorialJornada (idEmpleado, idJornada, estado, adicionadoPor, fechaAdicion) VALUES (1, 2, 'A', 'admin', '2023-09-12');
INSERT INTO HistorialJornada (idEmpleado, idJornada, estado, adicionadoPor, fechaAdicion) VALUES (2, 1, 'A', 'admin', '2022-07-17');
INSERT INTO HistorialJornada (idEmpleado, idJornada, estado, adicionadoPor, fechaAdicion) VALUES (3, 2, 'A', 'admin', '2025-02-08');
INSERT INTO HistorialJornada (idEmpleado, idJornada, estado, adicionadoPor, fechaAdicion) VALUES (4, 1, 'A', 'admin', '2022-10-21');
INSERT INTO HistorialJornada (idEmpleado, idJornada, estado, adicionadoPor, fechaAdicion) VALUES (5, 2, 'A', 'admin', '2022-04-14');

-- Tabla Departamento
INSERT INTO Departamento (nombre, descripcion, estado, adicionadoPor, fechaAdicion) VALUES ('TechNova S.A.', 'Optimización de procesos logísticos.', 'A', 'admin', '2025-01-27');
INSERT INTO Departamento (nombre, descripcion, estado, adicionadoPor, fechaAdicion) VALUES ('Digitaliza Solutions', 'Desarrollo de plataformas digitales.', 'A', 'admin', '2025-04-06');

-- Tabla HistorialDepartamentos
INSERT INTO HistorialDepartamentos (idEmpleado, idDepartamento, estado, adicionadoPor, fechaAdicion) VALUES (1, 1, 'A', 'admin', '2023-01-11');
INSERT INTO HistorialDepartamentos (idEmpleado, idDepartamento, estado, adicionadoPor, fechaAdicion) VALUES (2, 1, 'A', 'admin', '2022-06-01');
INSERT INTO HistorialDepartamentos (idEmpleado, idDepartamento, estado, adicionadoPor, fechaAdicion) VALUES (3, 2, 'A', 'admin', '2023-06-13');
INSERT INTO HistorialDepartamentos (idEmpleado, idDepartamento, estado, adicionadoPor, fechaAdicion) VALUES (4, 2, 'A', 'admin', '2025-06-21');
INSERT INTO HistorialDepartamentos (idEmpleado, idDepartamento, estado, adicionadoPor, fechaAdicion) VALUES (5, 1, 'A', 'admin', '2023-05-19');










