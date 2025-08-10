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
modificadoPor NVARCHAR(150)
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
idUsuario INT,
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
modificadoPor NVARCHAR(150)
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
modificadoPor NVARCHAR(150) NULL
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
modificadoPor NVARCHAR(150)
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
			usuarioModificacion = @pRevisadoPor,
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
        LEFT JOIN Contrato C ON E.idEmpleado = C.idEmpleado
		WHERE E.idEmpleado = @pIdEmpleado;

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
        LEFT JOIN Jornada J ON J.idJornada = HJ.idJornada
		WHERE E.activo !='N';
    END TRY
    BEGIN CATCH
        SET @ErrorMessage = ERROR_MESSAGE();
        SET @ErrorSeverity = ERROR_SEVERITY();
        SET @ErrorState = ERROR_STATE();
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;

GO
CREATE PROCEDURE spListarEmpleadosGestion
AS
BEGIN 
    DECLARE @ErrorMessage NVARCHAR(255);
	DECLARE @ErrorSeverity INT;
	DECLARE @ErrorState INT;
    BEGIN TRY
        SELECT 
            E.idEmpleado,
            E.identificacion,
            E.primerNombre,
            ISNULL(E.segundoNombre + ' ', '') as 'segundoNombre' ,
            E.primerApellido,
            ISNULL(E.segundoApellido, '') as 'segundoApellido',
            E.salarioBruto,
			E.fechaContratacion,
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
		WHERE E.activo !='N';
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

GO
CREATE PROCEDURE spCrearEmpleado
(
@pIdentificacion    NVARCHAR(30),
@pPrimerNombre      NVARCHAR(100),
@pSegundoNombre     NVARCHAR(100),
@pPrimerApellido    NVARCHAR(100),
@pSegundoApellido   NVARCHAR(100),
@pFechaContratacion DATE,
@pSalarioBruto      FLOAT,
@pAdicionadoPor     NVARCHAR(150),
@pIdDepartamento    INT,
@pIdJornada         INT,
@pIdPuesto          INT
)
AS
BEGIN
    DECLARE @pIdEmpleadoIngreso INT;
    DECLARE @ErrorMessage NVARCHAR(255);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    BEGIN TRY
        INSERT INTO Empleado
        (
            identificacion, primerNombre, segundoNombre, primerApellido, segundoApellido,
            fechaContratacion, salarioBruto, activo, fechaAdicion, adicionadoPor
        )
        VALUES
        (
            @pIdentificacion, @pPrimerNombre, @pSegundoNombre, @pPrimerApellido, @pSegundoApellido,
            @pFechaContratacion, @pSalarioBruto, 'A', GETDATE(), @pAdicionadoPor
        );

        -- Obtener el id recién insertado
        SELECT @pIdEmpleadoIngreso = SCOPE_IDENTITY();

        INSERT INTO HistorialDepartamentos
        (idEmpleado, idDepartamento, estado, adicionadoPor, fechaAdicion)
        VALUES
        (@pIdEmpleadoIngreso, @pIdDepartamento, 'A', @pAdicionadoPor, GETDATE());

        INSERT INTO HistorialJornada
        (idEmpleado, idJornada, estado, adicionadoPor, fechaAdicion)
        VALUES
        (@pIdEmpleadoIngreso, @pIdJornada, 'A', @pAdicionadoPor, GETDATE());

        INSERT INTO HistorialPuesto
        (idEmpleado, idPuesto, estado, adicionadoPor, fechaAdicion)
        VALUES
        (@pIdEmpleadoIngreso, @pIdPuesto, 'A', @pAdicionadoPor, GETDATE());

    END TRY
    BEGIN CATCH
        SET @ErrorMessage = ERROR_MESSAGE();
        SET @ErrorSeverity = ERROR_SEVERITY();
        SET @ErrorState = ERROR_STATE();
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;
GO


GO
CREATE PROCEDURE spModificarEmpleado
(
    @pIdEmpleado      INT,
    @pIdentificacion  NVARCHAR(30),
    @pPrimerNombre    NVARCHAR(100),
    @pSegundoNombre   NVARCHAR(100),
    @pPrimerApellido  NVARCHAR(100),
    @pSegundoApellido NVARCHAR(100),
    @pSalarioBruto    FLOAT,
    @pModificadoPor   NVARCHAR(150),
    @pIdDepartamento  INT,
    @pIdJornada       INT,
    @pIdPuesto        INT
)
AS
BEGIN
    DECLARE @ErrorMessage NVARCHAR(255);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    DECLARE @pSalarioAnterior FLOAT;
    DECLARE @pIdDepartamentoAnterior INT;
    DECLARE @pIdJornadaAnterior INT;
    DECLARE @pIdPuestoAnterior INT;

    BEGIN TRY
        -- Validar existencia del empleado
        IF NOT EXISTS (SELECT 1 FROM Empleado WHERE idEmpleado = @pIdEmpleado)
        BEGIN
            RAISERROR('El empleado con ID %d no existe.', 16, 1, @pIdEmpleado);
            RETURN;
        END


        SELECT @pSalarioAnterior = salarioBruto
        FROM Empleado
        WHERE idEmpleado = @pIdEmpleado;

        SELECT @pIdDepartamentoAnterior = idDepartamento
        FROM HistorialDepartamentos
        WHERE idEmpleado = @pIdEmpleado AND estado = 'A';

        SELECT @pIdJornadaAnterior = idJornada
        FROM HistorialJornada
        WHERE idEmpleado = @pIdEmpleado AND estado = 'A';

        SELECT @pIdPuestoAnterior = idPuesto
        FROM HistorialPuesto
        WHERE idEmpleado = @pIdEmpleado AND estado = 'A';

        -- Si cambió salario, registrar historial
        IF @pSalarioAnterior IS NOT NULL AND @pSalarioAnterior <> @pSalarioBruto
        BEGIN
            INSERT INTO HistorialSalarios
                (salarioAnterior, salarioNuevo, adicionadoPor, fechaAdicion, idEmpleado)
            VALUES
                (@pSalarioAnterior, @pSalarioBruto, @pModificadoPor, GETDATE(), @pIdEmpleado);
        END

        -- Actualizar datos base del empleado
        UPDATE Empleado
        SET
            identificacion      = @pIdentificacion,
            primerNombre        = @pPrimerNombre,
            segundoNombre       = @pSegundoNombre,
            primerApellido      = @pPrimerApellido,
            segundoApellido     = @pSegundoApellido,
            salarioBruto        = @pSalarioBruto,
            usuarioModificacion = @pModificadoPor,
            fechaModificacion   = GETDATE()
        WHERE idEmpleado = @pIdEmpleado;

        -- Departamento
        IF @pIdDepartamentoAnterior IS NULL
        BEGIN
            INSERT INTO HistorialDepartamentos
                (idEmpleado, idDepartamento, estado, adicionadoPor, fechaAdicion)
            VALUES
                (@pIdEmpleado, @pIdDepartamento, 'A', @pModificadoPor, GETDATE());
        END
        ELSE IF @pIdDepartamentoAnterior != @pIdDepartamento
        BEGIN
            UPDATE HistorialDepartamentos
            SET estado = 'N',
                modificadoPor = @pModificadoPor,
                fechaModificacion = GETDATE()
            WHERE idEmpleado = @pIdEmpleado AND estado = 'A';

            INSERT INTO HistorialDepartamentos
                (idEmpleado, idDepartamento, estado, adicionadoPor, fechaAdicion)
            VALUES
                (@pIdEmpleado, @pIdDepartamento, 'A', @pModificadoPor, GETDATE());
        END

        -- Jornada
        IF @pIdJornadaAnterior IS NULL
        BEGIN
            INSERT INTO HistorialJornada
                (idEmpleado, idJornada, estado, adicionadoPor, fechaAdicion)
            VALUES
                (@pIdEmpleado, @pIdJornada, 'A', @pModificadoPor, GETDATE());
        END
        ELSE IF @pIdJornadaAnterior != @pIdJornada
        BEGIN
            UPDATE HistorialJornada
            SET estado = 'N',
                modificadoPor = @pModificadoPor,
                fechaModificacion = GETDATE()
            WHERE idEmpleado = @pIdEmpleado AND estado = 'A';

            INSERT INTO HistorialJornada
                (idEmpleado, idJornada, estado, adicionadoPor, fechaAdicion)
            VALUES
                (@pIdEmpleado, @pIdJornada, 'A', @pModificadoPor, GETDATE());
        END

        -- Puesto
        IF @pIdPuestoAnterior IS NULL
        BEGIN
            INSERT INTO HistorialPuesto
                (idEmpleado, idPuesto, estado, adicionadoPor, fechaAdicion)
            VALUES
                (@pIdEmpleado, @pIdPuesto, 'A', @pModificadoPor, GETDATE());
        END
        ELSE IF @pIdPuestoAnterior != @pIdPuesto
        BEGIN
            UPDATE HistorialPuesto
            SET estado = 'N',
                modificadoPor = @pModificadoPor,
                fechaModificacion = GETDATE()
            WHERE idEmpleado = @pIdEmpleado AND estado = 'A';

            INSERT INTO HistorialPuesto
                (idEmpleado, idPuesto, estado, adicionadoPor, fechaAdicion)
            VALUES
                (@pIdEmpleado, @pIdPuesto, 'A', @pModificadoPor, GETDATE());
        END
    END TRY
    BEGIN CATCH
        SET @ErrorMessage = ERROR_MESSAGE();
        SET @ErrorSeverity = ERROR_SEVERITY();
        SET @ErrorState = ERROR_STATE();
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;



SELECT * FROM HistorialDepartamentos WHERE idEmpleado = 5


GO
CREATE PROCEDURE spEliminrEmpleaado
(
@pIdEmpleado INT,
@pModificadoPor NVARCHAR(150)
)
AS
BEGIN
    DECLARE @ErrorMessage NVARCHAR(255);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    BEGIN TRY

		UPDATE Empleado
		SET
		activo = 'N',
		usuarioModificacion = @pModificadoPor,
		fechaModificacion = GETDATE()
		WHERE idEmpleado = @pIdEmpleado;

		UPDATE HistorialDepartamentos
		SET
		estado = 'N',
		modificadoPor = @pModificadoPor,
		fechaModificacion = GETDATE()
		WHERE idEmpleado = @pIdEmpleado;

		UPDATE HistorialJornada
		SET
		estado = 'N',
		modificadoPor = @pModificadoPor,
		fechaModificacion = GETDATE()
		WHERE idEmpleado = @pIdEmpleado;

		UPDATE HistorialPuesto
		SET
		estado = 'N',
		modificadoPor = @pModificadoPor,
		fechaModificacion = GETDATE()
		WHERE idEmpleado = @pIdEmpleado;

    END TRY
    BEGIN CATCH
        SET @ErrorMessage = ERROR_MESSAGE();
        SET @ErrorSeverity = ERROR_SEVERITY();
        SET @ErrorState = ERROR_STATE();
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;

GO
CREATE PROCEDURE spListarDepartamentos
AS
BEGIN
    DECLARE @ErrorMessage NVARCHAR(255);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    BEGIN TRY
	    SELECT idDepartamento, nombre 
		FROM Departamento

    END TRY
    BEGIN CATCH
        SET @ErrorMessage = ERROR_MESSAGE();
        SET @ErrorSeverity = ERROR_SEVERITY();
        SET @ErrorState = ERROR_STATE();
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;

GO
CREATE PROCEDURE spListarPuesto
AS
BEGIN
    DECLARE @ErrorMessage NVARCHAR(255);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    BEGIN TRY
	    SELECT idPuesto, nombre 
		FROM Puesto

    END TRY
    BEGIN CATCH
        SET @ErrorMessage = ERROR_MESSAGE();
        SET @ErrorSeverity = ERROR_SEVERITY();
        SET @ErrorState = ERROR_STATE();
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;

GO
CREATE PROCEDURE spListarJornada
AS
BEGIN
    DECLARE @ErrorMessage NVARCHAR(255);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    BEGIN TRY
	    SELECT idJornada, nombre 
		FROM Jornada

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
SELECT * FROM Usuario
INSERT INTO Usuario (nombreUsuario, contrasenna, adicionadoPor, fechaAdicion)
VALUES 
('admin', 'admin123', 'sistema', GETDATE()),
('mauricio.cordero', 'pass1234', 'admin', GETDATE());

INSERT INTO Usuario (nombreUsuario, contrasenna, adicionadoPor, fechaAdicion)
VALUES 
('prueba', 'prueba', 'admin', GETDATE());

SELECT * FROM Usuario
-- 3. Insertar ListaRoles
GO

SELECT * FROM ListaRoles
INSERT INTO ListaRoles (idRol, idUsuario, estado, adicionadoPor, fechaAdicion)
VALUES 
(1, 1, 'A', 'sistema', GETDATE()), -- admin con rol Administrador
(2, 2, 'A', 'admin', GETDATE());   -- mauricio.cordero con rol Empleado
INSERT INTO ListaRoles (idRol, idUsuario, estado, adicionadoPor, fechaAdicion)
VALUES 
(1, 3, 'A', 'sistema', GETDATE()); -- admin con rol Administrador


-- 4. Insertar Empleados (usando los usuarios anteriores)
GO
SELECT *  FROM Empleado
INSERT INTO Empleado (
    identificacion, primerNombre, segundoNombre, primerApellido, segundoApellido,
    fechaContratacion, salarioBruto, idUsuario, activo, fechaAdicion, adicionadoPor
)
VALUES 
('206060612', 'PRUEBA', 'PRUEBA', 'PRUEBA', 'PRUEBA', 
 '2021-01-15', 6500, 3, 'A', GETDATE(), 'admin');

GO
INSERT INTO Empleado (
    identificacion, primerNombre, segundoNombre, primerApellido, segundoApellido,
    fechaContratacion, salarioBruto, idUsuario, activo, fechaAdicion, adicionadoPor
)
VALUES 
('206060606', 'Mauricio', 'Leonel', 'Cordero', 'Méndez', 
 '2021-01-15', 650000, 2, 'S', GETDATE(), 'admin');

 -- 5. Insertar Departamento
GO
SELECT * FROM Departamento
INSERT INTO Departamento (nombre, descripcion, estado, adicionadoPor, fechaAdicion)
VALUES ('Contabilidad', 'Departamento de finanzas', 'A', 'admin', GETDATE());
GO
INSERT INTO Departamento (nombre, descripcion, estado, adicionadoPor, fechaAdicion)
VALUES ('TI', 'Departamento de TI', 'A', 'admin', GETDATE());

-- 6. Insertar Puesto
GO
SELECT * FROM Puesto
INSERT INTO Puesto (nombre, descripcion, estado, adicionadoPor, fechaAdicion)
VALUES ('Contador General', 'Encargado de los estados financieros', 'A', 'admin', GETDATE());
GO
INSERT INTO Puesto (nombre, descripcion, estado, adicionadoPor, fechaAdicion)
VALUES ('Programador Junior', '', 'A', 'admin', GETDATE());

-- 7. Insertar Jornada
GO
SELECT * FROM Jornada
INSERT INTO Jornada (nombre, descripcion, estado, horasSemanales, adicionadoPor, fechaAdicion)
VALUES ('Tiempo Completo', 'Jornada completa de 40 horas semanales', 'A', 40, 'admin', GETDATE());

-- 8. Insertar HistorialDepartamentos
SELECT * FROM HistorialDepartamentos
SELECT * FROM Empleado
GO
INSERT INTO HistorialDepartamentos (idEmpleado, idDepartamento, estado, adicionadoPor, fechaAdicion)
VALUES (2, 1, 'A', 'admin', GETDATE());

-- 9. Insertar HistorialPuesto
GO
INSERT INTO HistorialPuesto (idEmpleado, idPuesto, estado, adicionadoPor, fechaAdicion)
VALUES (2, 1, 'A', 'admin', GETDATE());

-- 10. Insertar HistorialJornada
GO
INSERT INTO HistorialJornada (idEmpleado, idJornada, estado, adicionadoPor, fechaAdicion)
VALUES (2, 1, 'A', 'admin', GETDATE());

-- 11. Insertar Contrato
GO
INSERT INTO Contrato (tipoContrato, estadoContrato, adicionadoPor, fechaAdicion, idEmpleado)
VALUES ('Indefinido', 'A', 'admin', GETDATE(), 2);

-- 12. Insertar HistorialSalarios
GO
INSERT INTO HistorialSalarios (salarioAnterior, salarioNuevo, adicionadoPor, fechaAdicion, idEmpleado)
VALUES (600000, 650000, 'admin', GETDATE(), 2);

-- 13. Insertar Solicitud de Vacaciones
GO
INSERT INTO SolicitudVacaciones (detalle, estado, fechaAdicion, adicionadoPor, idEmpleado)
VALUES ('Vacaciones de una semana en julio', 'En Revision', GETDATE(), 'mauricio.cordero', 2);

-- 14. Insertar Contacto
GO
INSERT INTO Contacto (tipoContacto, infoContacto, adicionadoPor, fechaAdicion, idEmpleado)
VALUES ('Correo electrónico', 'mauricio.cordero@email.com', 'admin', GETDATE(), 2);










