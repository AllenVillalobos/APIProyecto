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






SELECT * FROM ROL
-- 1. Insertar Roles
GO
INSERT INTO Rol (nombreRol, descripcionRol, adicionadoPor, fechaAdicion)
VALUES 
('Administrador', 'Acceso total', 'sistema', GETDATE()),
('Empleado', 'Acceso limitado a su perfil', 'sistema', GETDATE());

-- 2. Insertar Usuarios
GO
INSERT INTO Usuario (nombreUsuario, contrasenna, adicionadoPor, fechaAdicion)
VALUES 
('admin', 'admin123', 'sistema', GETDATE()),
('mauricio.cordero', 'pass1234', 'admin', GETDATE());

-- 3. Insertar ListaRoles
SELECT * FROM ListaRoles
INSERT INTO ListaRoles (idRol, idUsuario, estado, adicionadoPor, fechaAdicion)
VALUES 
(1, 1, 'A', 'sistema', GETDATE()), -- admin con rol Administrador
(2, 2, 'A', 'admin', GETDATE());   -- mauricio.cordero con rol Empleado

-- 4. Insertar Empleados (usando los usuarios anteriores)
SELECT * FROM Empleado
INSERT INTO Empleado (
    identificacion, primerNombre, segundoNombre, primerApellido, segundoApellido,
    fechaContratacion, salarioBruto, idUsuario, activo, fechaAdicion, adicionadoPor
)
VALUES 
('206060606', 'Mauricio', 'Leonel', 'Cordero', 'Méndez', 
 '2021-01-15', 650000, 2, 'S', GETDATE(), 'admin');

-- 5. Insertar Departamento
SELECT * FROM Departamento
INSERT INTO Departamento (nombre, descripcion, estado, adicionadoPor, fechaAdicion)
VALUES ('Contabilidad', 'Departamento de finanzas', 'A', 'admin', GETDATE());

-- 6. Insertar Puesto
SELECT * FROM Puesto
INSERT INTO Puesto (nombre, descripcion, estado, adicionadoPor, fechaAdicion)
VALUES ('Contador General', 'Encargado de los estados financieros', 'A', 'admin', GETDATE());

-- 7. Insertar Jornada
SELECT * FROM Jornada
INSERT INTO Jornada (nombre, descripcion, estado, horasSemanales, adicionadoPor, fechaAdicion)
VALUES ('Tiempo Completo', 'Jornada completa de 40 horas semanales', 'A', 40, 'admin', GETDATE());

-- 8. Insertar HistorialDepartamentos
SELECT * FROM HistorialDepartamentos
INSERT INTO HistorialDepartamentos (idEmpleado, idDepartamento, estado, adicionadoPor, fechaAdicion)
VALUES (1, 1, 'A', 'admin', GETDATE());

-- 9. Insertar HistorialPuesto
SELECT * FROM HistorialDepartamentos
INSERT INTO HistorialPuesto (idEmpleado, idPuesto, estado, adicionadoPor, fechaAdicion)
VALUES (1, 1, 'A', 'admin', GETDATE());

-- 10. Insertar HistorialJornada
SELECT * FROM  HistorialJornada
INSERT INTO HistorialJornada (idEmpleado, idJornada, estado, adicionadoPor, fechaAdicion)
VALUES (1, 1, 'A', 'admin', GETDATE());

-- 11. Insertar Contrato
SELECT * FROM Contrato
INSERT INTO Contrato (tipoContrato, estadoContrato, adicionadoPor, fechaAdicion, idEmpleado)
VALUES ('Indefinido', 'A', 'admin', GETDATE(), 1);

-- 12. Insertar HistorialSalarios
SELECT * FROM HistorialSalarios
INSERT INTO HistorialSalarios (salarioAnterior, salarioNuevo, adicionadoPor, fechaAdicion, idEmpleado)
VALUES (600000, 650000, 'admin', GETDATE(), 1);

-- 13. Insertar Solicitud de Vacaciones
SELECT * FROM SolicitudVacaciones
INSERT INTO SolicitudVacaciones (detalle, estado, fechaAdicion, adicionadoPor, idEmpleado)
VALUES ('Vacaciones de una semana en julio', 'En Revision', GETDATE(), 'mauricio.cordero', 1);

-- 14. Insertar Contacto
SELECT * FROM Contacto
INSERT INTO Contacto (tipoContacto, infoContacto, adicionadoPor, fechaAdicion, idEmpleado)
VALUES ('Correo electrónico', 'mauricio.cordero@email.com', 'admin', GETDATE(), 1);











