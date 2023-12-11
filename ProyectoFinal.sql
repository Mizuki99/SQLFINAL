USE master
GO
IF DB_ID(N'Docentes') IS NOT NULL
DROP DATABASE Docentes;
GO


CREATE TABLE Aula (
    idAula INT PRIMARY KEY,
    Nombre NVARCHAR(100),
    Capacidad INT,
	No_Butacas NVARCHAR(25),
    Edificio NVARCHAR(50),
    Ubicacion NVARCHAR(100),
	status_Aula bit (1),
	CONSTRAINT PKAula PRIMARY KEY(idAula)
	)
CREATE TABLE Alumno (
    idAlumno INT PRIMARY KEY,
    Nombre NVARCHAR(100),
    Apellido NVARCHAR(100),
    FechaNacimiento DATE,
    Direccion NVARCHAR(255),
    Telefono NVARCHAR(15),
	NSS NVARCHAR(25),
	Tipolenguamaterna NVARCHAR(50),
	Periodo NVARCHAR (50),
	Curp NVARCHAR(50),
    Semestre NVARCHAR(50),
	Genero NVARCHAR(10),
    Asistencia NVARCHAR(50),
	Tipo_Sangre NVARCHAR(10),
    CarreraID INT,
    GrupoID INT,
	CONSTRAINT PKAlumno PRIMARY KEY(idAlumno)
	)
CREATE TABLE Carrera (
    idCarrera INT PRIMARY KEY,
    Nombre NVARCHAR(100),
	Sementre NVARCHAR(10),
    Descripcion NVARCHAR(255),
    Duracion INT,
    Titulacion NVARCHAR(50),
	CONSTRAINT PKCarrera PRIMARY KEY(idCarrera)
	)
CREATE TABLE Docente (
    idDocente INT PRIMARY KEY,
    Nombre NVARCHAR(100),
    Apellido NVARCHAR(100),
    Email NVARCHAR(100),
	Tutor NVARCHAR(25),
	ListaAlumnos NVARCHAR (100),
    Especialidad NVARCHAR(100),
    FechaContratacion DATE
	CONSTRAINT PKDocente PRIMARY KEY(idDocente)
	)
CREATE TABLE Examen (
    idExamen INT PRIMARY KEY,
    Calificacion NVARCHAR (20),
    Fecha DATE,
    HoraInicio TIME,
	Tipo_Examen NVARCHAR (25),
	Nombre_Alumno NVARCHAR (50),
    DuracionMinutos INT,
    AulaID INT
	CONSTRAINT PKExamen PRIMARY KEY(idExamen)
  )
CREATE TABLE Horario (
    idHorario INT PRIMARY KEY,
    DiaSemana NVARCHAR(20),
	Materia NVARCHAR (20),
    HoraInicio TIME,
    HoraFin TIME,
    ClaseID INT
	CONSTRAINT PKHorario PRIMARY KEY(idHorario)
	)
CREATE TABLE Materia (
    idMateria INT PRIMARY KEY,
    Nombre_Asignatura NVARCHAR(100),
    Nombre NVARCHAR(255),
    Creditos INT,
	Clave NVARCHAR (10),
	Carrera NVARCHAR (15),
	Horario_Practicas NVARCHAR (15),
    PlanEstudioID INT
	CONSTRAINT PKMa0teria PRIMARY KEY(idMateria)
    )
CREATE TABLE PlanEstudio (
    idPlanEstudio INT PRIMARY KEY,
    CarreraID INT,
	Fecha NVARCHAR (10),
	Descripcion NVARCHAR (100),
    Nombre NVARCHAR(100),
    Duracion INT
	CONSTRAINT PKPlanEstudio PRIMARY KEY(idPlanEstudio)
	)
CREATE TABLE Proyectos (
    idProyecto INT PRIMARY KEY,
	Nombre_Proyecto NVARCHAR (100),
	Nombre_Alumno NVARCHAR(100),
	Calificacion NVARCHAR (50),
    Descripcion NVARCHAR(255),
    FechaEntrega DATE,
    MateriaID INT
	CONSTRAINT PKProyecto PRIMARY KEY(idProyecto)
	)
CREATE TABLE Tareas (
    idTarea INT PRIMARY KEY,
    MateriaID INT,
	Aprobatoria NVARCHAR (10),
	Tipo_Tarea NVARCHAR (10),
	Nombre_Alumno NVARCHAR (50),
	Descripcion NVARCHAR(255),
    FechaEntrega DATE,
    Ponderacion INT
	CONSTRAINT PKTarea PRIMARY KEY(idTarea)
	)
CREATE TABLE Turno (
    idTurno INT PRIMARY KEY,
    Nombre NVARCHAR(50),
    Descripcion NVARCHAR(255)
	CONSTRAINT PKTurno PRIMARY KEY(idTurno)
	)
CREATE TABLE Asesoria (
    idAsesoria INT PRIMARY KEY,
    Fecha DATE,
	Nombre_Materia NVARCHAR (25),
	Unidad NVARCHAR (50),
    HoraInicio TIME,
    HoraFin TIME,
    idDocente INT,
    idAlumno INT,
    Comentarios NVARCHAR(500),
    CONSTRAINT PKAsesoria PRIMARY KEY(idAsesoria)
);
CREATE TABLE Cubiculo (
    idCubiculo INT PRIMARY KEY,
    Nombre NVARCHAR(100),
    Edificio NVARCHAR(50),
	Periodo Date,
	Numero_Cubiculo NVARCHAR (10),
    Capacidad INT,
    CONSTRAINT PKCubiculo PRIMARY KEY(idCubiculo)
);
CREATE TABLE EvaluacionMaestro (
    idEvaluacion INT PRIMARY KEY,
    Puntualidad INT,
	Nombre_Maestro NVARCHAR (100),
	Fecha DATE,
    ConocimientoMateria INT,
    MetodosEnsenanza INT,
    Comentarios NVARCHAR(500),
    CONSTRAINT PKEvaluacion PRIMARY KEY(idEvaluacion)
);
CREATE TABLE Tutor (
    idTutor INT PRIMARY KEY,
    Nombre NVARCHAR(100),
	lista_Alumnos NVARCHAR (100),
    Apellido NVARCHAR(100),
    Email NVARCHAR(100),
    Telefono NVARCHAR(15),
    Especialidad NVARCHAR(100),
    CONSTRAINT PKTutor PRIMARY KEY(idTutor)
);
CREATE TABLE Universidad (
    idUniversidad INT PRIMARY KEY,
    Nombre NVARCHAR(100),
    Direccion NVARCHAR(255),
	CP NVARCHAR (10),
	Nombre_DIrector NVARCHAR (50),
    Ciudad NVARCHAR(50),
    Pais NVARCHAR(50),
    Telefono NVARCHAR(15),
    CONSTRAINT PKUniversidad PRIMARY KEY(idUniversidad)
)
CREATE TABLE AsesoriaAlumno (
    idAsesoriaAlumno INT PRIMARY KEY,
    idAsesoria INT,
	Unidad NVARCHAR (15),
	Fecha DATE,
    idAlumno INT,
	CONSTRAINT PKAsesoriaAlumno PRIMARY KEY(idAsesoriaAlumno)
);

--INDEX

-- �ndice para la tabla Aula
CREATE INDEX IDX_Aula_IdAula ON Aula (idAula);

-- �ndice para la tabla Alumno
CREATE INDEX IDX_Alumno_IdAlumno ON Alumno (idAlumno);

-- �ndice para la tabla Carrera
CREATE INDEX IDX_Carrera_IdCarrera ON Carrera (idCarrera);

-- �ndice para la tabla Docente
CREATE INDEX IDX_Docente_IdDocente ON Docente (idDocente);

-- �ndice para la tabla Examen
CREATE INDEX IDX_Examen_IdExamen ON Examen (idExamen);

-- �ndice para la tabla Horario
CREATE INDEX IDX_Horario_IdHorario ON Horario (idHorario);

-- �ndice para la tabla Materia
CREATE INDEX IDX_Materia_IdMateria ON Materia (idMateria);

-- �ndice para la tabla PlanEstudio
CREATE INDEX IDX_PlanEstudio_IdPlanEstudio ON PlanEstudio (idPlanEstudio);

-- �ndice para la tabla Proyectos
CREATE INDEX IDX_Proyecto_IdProyecto ON Proyectos (idProyecto);

-- �ndice para la tabla Tareas
CREATE INDEX IDX_Tarea_IdTarea ON Tareas (idTarea);

-- �ndice para la tabla Turno
CREATE INDEX IDX_Turno_IdTurno ON Turno (idTurno);

-- �ndice para la tabla Asesoria
CREATE INDEX IDX_Asesoria_IdAsesoria ON Asesoria (idAsesoria);

-- �ndice para la tabla Cubiculo
CREATE INDEX IDX_Cubiculo_IdCubiculo ON Cubiculo (idCubiculo);

-- �ndice para la tabla EvaluacionMaestro
CREATE INDEX IDX_Evaluacion_IdEvaluacion ON EvaluacionMaestro (idEvaluacion);

-- �ndice para la tabla Tutor
CREATE INDEX IDX_Tutor_IdTutor ON Tutor (idTutor);

-- �ndice para la tabla Universidad
CREATE INDEX IDX_Universidad_IdUniversidad ON Universidad (idUniversidad);


 --Relaciones 
 --nm
ALTER TABLE AsesoriaAlumno
ADD CONSTRAINT FKAsesoriaAlumno_Asesoria
FOREIGN KEY (idAsesoria)
REFERENCES Asesoria(idAsesoria);

ALTER TABLE AsesoriaAlumno
ADD CONSTRAINT FKAsesoriaAlumno_Alumno
FOREIGN KEY (idAlumno)
REFERENCES Alumno(idAlumno);
--
--11

ALTER TABLE Kardex
ADD idAlumno INT;


ALTER TABLE Kardex
ADD CONSTRAINT FK_Kardex_Alumno
FOREIGN KEY (idAlumno)
REFERENCES Alumno(idAlumno);


ALTER TABLE Horario
ADD idAlumno INT;


ALTER TABLE Horario
ADD CONSTRAINT FK_Horario_Alumno
FOREIGN KEY (idAlumno)
REFERENCES Alumno(idAlumno);


ALTER TABLE Alumno
ADD idUniversidad INT;


ALTER TABLE Alumno
ADD CONSTRAINT FK_Alumno_Universidad
FOREIGN KEY (idUniversidad)
REFERENCES Universidad(idUniversidad);


ALTER TABLE Grupo
ADD idTurno INT;


ALTER TABLE Grupo
ADD CONSTRAINT FK_Grupo_Turno
FOREIGN KEY (idTurno)
REFERENCES Turno(idTurno);


ALTER TABLE Cubiculo
ADD idDocente INT;


ALTER TABLE Cubiculo
ADD CONSTRAINT FK_Cubiculo_Docente
FOREIGN KEY (idDocente)
REFERENCES Docente(idDocente);


ALTER TABLE Materia
ADD idReticula INT;


ALTER TABLE Materia
ADD CONSTRAINT FK_Materia_Reticula
FOREIGN KEY (idReticula)
REFERENCES Reticula(idReticula);


ALTER TABLE Grupo
ADD idReticula INT;


ALTER TABLE Grupo
ADD CONSTRAINT FK_Grupo_Reticula
FOREIGN KEY (idReticula)
REFERENCES Reticula(idReticula);


ALTER TABLE Reticula
ADD idPlanEstudio INT;


ALTER TABLE Reticula
ADD CONSTRAINT FK_Reticula_PlanEstudio
FOREIGN KEY (idPlanEstudio)
REFERENCES PlanEstudio(idPlanEstudio);


ALTER TABLE PlanEstudio
ADD idCarrera INT;


ALTER TABLE PlanEstudio
ADD CONSTRAINT FK_PlanEstudio_Carrera
FOREIGN KEY (idCarrera)
REFERENCES Carrera(idCarrera);
--

--1n

ALTER TABLE EvaluacionMaestro
ADD idAlumno INT;


ALTER TABLE EvaluacionMaestro
ADD CONSTRAINT FK_EvaluacionMaestro_Alumno
FOREIGN KEY (idAlumno)
REFERENCES Alumno(idAlumno);


ALTER TABLE Asistencia
ADD idAlumno INT;


ALTER TABLE Asistencia
ADD CONSTRAINT FK_Asistencia_Alumno
FOREIGN KEY (idAlumno)
REFERENCES Alumno(idAlumno);


ALTER TABLE Aula
ADD idAlumno INT;


ALTER TABLE Aula
ADD CONSTRAINT FK_Aula_Alumno
FOREIGN KEY (idAlumno)
REFERENCES Alumno(idAlumno);


ALTER TABLE Tarea
ADD idAlumno INT;


ALTER TABLE Tarea
ADD CONSTRAINT FK_Tarea_Alumno
FOREIGN KEY (idAlumno)
REFERENCES Alumno(idAlumno);


ALTER TABLE Proyecto
ADD idAlumno INT;


ALTER TABLE Proyecto
ADD CONSTRAINT FK_Proyecto_Alumno
FOREIGN KEY (idAlumno)
REFERENCES Alumno(idAlumno);


ALTER TABLE Examen
ADD idAlumno INT;


ALTER TABLE Examen
ADD CONSTRAINT FK_Examen_Alumno
FOREIGN KEY (idAlumno)
REFERENCES Alumno(idAlumno);


ALTER TABLE Grupo
ADD idAlumno INT;


ALTER TABLE Grupo
ADD CONSTRAINT FK_Grupo_Alumno
FOREIGN KEY (idAlumno)
REFERENCES Alumno(idAlumno);


ALTER TABLE Tarea
ADD idDocente INT;


ALTER TABLE Tarea
ADD CONSTRAINT FK_Tarea_Docente
FOREIGN KEY (idDocente)
REFERENCES Docente(idDocente);


ALTER TABLE Proyecto
ADD idDocente INT;


ALTER TABLE Proyecto
ADD CONSTRAINT FK_Proyecto_Docente
FOREIGN KEY (idDocente)
REFERENCES Docente(idDocente);


ALTER TABLE Examen
ADD idDocente INT;


ALTER TABLE Examen
ADD CONSTRAINT FK_Examen_Docente
FOREIGN KEY (idDocente)
REFERENCES Docente(idDocente);


ALTER TABLE Docente
ADD UniversidadID INT;


ALTER TABLE Docente
ADD CONSTRAINT FK_Docente_Universidad
FOREIGN KEY (idUniversidad)
REFERENCES Universidad(idUniversidad);


ALTER TABLE Docente
ADD idAlumno INT;


ALTER TABLE Docente
ADD CONSTRAINT FK_Docente_Alumno
FOREIGN KEY (idAlumno)
REFERENCES Alumno(idAlumno);


ALTER TABLE Docente
ADD TurnoID INT;


ALTER TABLE Docente
ADD CONSTRAINT FK_Docente_Turno
FOREIGN KEY (idTurno)
REFERENCES Turno(idTurno);


ALTER TABLE Docente
ADD MateriaID INT;


ALTER TABLE Docente
ADD CONSTRAINT FK_Docente_Materia
FOREIGN KEY (idMateria)
REFERENCES Materia(idMateria);



ALTER TABLE Materia
ADD GrupoID INT;


ALTER TABLE Materia
ADD CONSTRAINT FK_Materia_Grupo
FOREIGN KEY (idGrupo)
REFERENCES Grupo(idGrupo);

-------poblar

-- Poblaci�n de la tabla Aula
INSERT INTO Aula (idAula, Nombre, Capacidad, No_Butacas, Edificio, Ubicacion, status_Aula)
VALUES
(1, 'Aula 101', 50, '30 butacas', 'Edificio A', 'Piso 1', 1),
(2, 'Aula 201', 60, '40 butacas', 'Edificio B', 'Piso 2', 1),
(3, 'Aula 301', 70, '50 butacas', 'Edificio C', 'Piso 3', 1),
(4, 'Aula 401', 80, '60 butacas', 'Edificio D', 'Piso 4', 0);

-- Poblaci�n de la tabla Alumno
INSERT INTO Alumno (idAlumno, Nombre, Apellido, FechaNacimiento, Direccion, Telefono, NSS, Tipolenguamaterna, Periodo, Curp, Semestre, Genero, Asistencia, Tipo_Sangre, CarreraID, GrupoID)
VALUES
(1, 'Juan', 'P�rez', '1998-03-15', '123 Calle Principal', '555-123-4567', '1234567890', 'Espa�ol', '2023A', 'CURP1234567890', '4to Semestre', 'Masculino', 'Regular', 'A+', 1, 1),
(2, 'Mar�a', 'Gonz�lez', '1999-05-20', '456 Calle Secundaria', '555-987-6543', '9876543210', 'Espa�ol', '2023B', 'CURP9876543210', '3er Semestre', 'Femenino', 'Regular', 'B-', 2, 2),
(3, 'Pedro', 'Ram�rez', '1997-07-10', '789 Calle Terciaria', '555-234-5678', '2345678901', 'Espa�ol', '2023A', 'CURP2345678901', '5to Semestre', 'Masculino', 'Regular', 'O+', 1, 1),
(4, 'Ana', 'L�pez', '2000-01-05', '101 Calle Cuarta', '555-345-6789', '3456789012', 'Espa�ol', '2023B', 'CURP3456789012', '2do Semestre', 'Femenino', 'Regular', 'A-', 2, 2);

-- Poblaci�n de la tabla Carrera
INSERT INTO Carrera (idCarrera, Nombre, Sementre, Descripcion, Duracion, Titulacion)
VALUES
(1, 'Ingenier�a en Inform�tica', 'Semestral', 'Descripci�n de la carrera de inform�tica', 10, 'Tesis'),
(2, 'Licenciatura en Administraci�n', 'Semestral', 'Descripci�n de la carrera de administraci�n', 8, 'Tesis');

-- Poblaci�n de la tabla Docente
INSERT INTO Docente (idDocente, Nombre, Apellido, Email, Tutor, ListaAlumnos, Especialidad, FechaContratacion)
VALUES
(1, 'Ricardo', 'G�mez', 'ricardo@example.com', 'S�', 'Lista de alumnos', 'Inform�tica', '2020-08-15'),
(2, 'Laura', 'Mart�nez', 'laura@example.com', 'No', 'Lista de alumnos', 'Administraci�n', '2018-06-10');

-- Poblaci�n de la tabla Examen
INSERT INTO Examen (idExamen, Calificacion, Fecha, HoraInicio, Tipo_Examen, Nombre_Alumno, DuracionMinutos, AulaID)
VALUES
(1, 'Aprobado', '2023-06-10', '08:00:00', 'Final', 'Juan P�rez', 120, 1),
(2, 'Reprobado', '2023-06-15', '14:00:00', 'Parcial', 'Mar�a Gonz�lez', 90, 2),
(3, 'Aprobado', '2023-06-12', '10:00:00', 'Final', 'Pedro Ram�rez', 120, 3),
(4, 'Reprobado', '2023-06-20', '16:00:00', 'Parcial', 'Ana L�pez', 90, 4);

-- Poblaci�n de la tabla Horario
INSERT INTO Horario (idHorario, DiaSemana, Materia, HoraInicio, HoraFin, ClaseID)
VALUES
(1, 'Lunes', 'Matem�ticas', '08:00:00', '10:00:00', 1),
(2, 'Martes', 'Historia', '10:00:00', '12:00:00', 2),
(3, 'Mi�rcoles', 'Inform�tica', '14:00:00', '16:00:00', 3),
(4, 'Jueves', 'Econom�a', '16:00:00', '18:00:00', 4);

-- Poblaci�n de la tabla Materia
INSERT INTO Materia (idMateria, Nombre_Asignatura, Nombre, Creditos, Clave, Carrera, Horario_Practicas, PlanEstudioID)
VALUES
(1, '�lgebra', 'Matem�ticas', 5, 'MAT101', 'Ingenier�a en Inform�tica', 'Viernes 14:00-16:00', 1),
(2, 'Historia Mundial', 'Historia', 4, 'HIS101', 'Licenciatura en Administraci�n', 'Lunes 08:00-10:00', 2),
(3, 'Programaci�n en C', 'Inform�tica', 6, 'INF101', 'Ingenier�a en Inform�tica', 'Mi�rcoles 14:00-16:00', 1),
(4, 'Microeconom�a', 'Econom�a', 4, 'ECO101', 'Licenciatura en Administraci�n', 'Jueves 16:00-18:00', 2);

-- Poblaci�n de la tabla PlanEstudio
INSERT INTO PlanEstudio (idPlanEstudio, CarreraID, Fecha, Descripcion, Nombre, Duracion)
VALUES
(1, 1, '2020', 'Plan de estudios para Ingenier�a en Inform�tica', 'Plan 2020', 10),
(2, 2, '2018', 'Plan de estudios para Licenciatura en Administraci�n', 'Plan 2018', 8);

-- Poblaci�n de la tabla Proyectos
INSERT INTO Proyectos (idProyecto, Nombre_Proyecto, Nombre_Alumno, Calificacion, Descripcion, FechaEntrega, MateriaID)
VALUES
(1, 'Proyecto de Programaci�n', 'Juan P�rez', 'Aprobado', 'Desarrollo de una aplicaci�n web', '2023-05-10', 3),
(2, 'Investigaci�n Hist�rica', 'Mar�a Gonz�lez', 'Reprobado', 'Estudio de un per�odo hist�rico', '2023-05-15', 2),
(3, 'Aplicaci�n Android', 'Pedro Ram�rez', 'Aprobado', 'Desarrollo de una app m�vil', '2023-05-12', 3),
(4, 'An�lisis Econ�mico', 'Ana L�pez', 'Reprobado', 'Informe de an�lisis econ�mico', '2023-05-20', 4);

-- Poblaci�n de la tabla Tareas
INSERT INTO Tareas (idTarea, MateriaID, Aprobatoria, Tipo_Tarea, Nombre_Alumno, Descripcion, FechaEntrega, Ponderacion)
VALUES
(1, 1, 'S�', 'Programaci�n', 'Juan P�rez', 'Desarrollo de un programa', '2023-05-10', 10),
(2, 2, 'No', 'Investigaci�n', 'Mar�a Gonz�lez', 'Investigaci�n hist�rica', '2023-05-15', 15),
(3, 3, 'S�', 'Programaci�n', 'Pedro Ram�rez', 'Desarrollo de una app', '2023-05-12', 10),
(4, 4, 'No', 'An�lisis', 'Ana L�pez', 'Informe econ�mico', '2023-05-20', 15);

-- Poblaci�n de la tabla Turno
INSERT INTO Turno (idTurno, Nombre, Descripcion)
VALUES
(1, 'Matutino', 'Turno de ma�ana'),
(2, 'Vespertino', 'Turno de tarde');

-- Poblaci�n de la tabla Asesoria
INSERT INTO Asesoria (idAsesoria, Fecha, Nombre_Materia, Unidad, HoraInicio, HoraFin, idDocente, idAlumno, Comentarios)
VALUES
(1, '2023-06-10', 'Matem�ticas', 'Unidad 1', '08:00:00', '10:00:00', 1, 1, 'Comentarios de asesor�a'),
(2, '2023-06-15', 'Historia', 'Unidad 2', '10:00:00', '12:00:00', 2, 2, 'Comentarios de asesor�a'),
(3, '2023-06-12', 'Inform�tica', 'Unidad 3', '14:00:00', '16:00:00', 1, 1, 'Comentarios de asesor�a'),
(4, '2023-06-20', 'Econom�a', 'Unidad 1', '16:00:00', '18:00:00', 2, 2, 'Comentarios de asesor�a');

-- Poblaci�n de la tabla Cubiculo
INSERT INTO Cubiculo (idCubiculo, Nombre, Edificio, Periodo, Numero_Cubiculo, Capacidad)
VALUES
(1, 'Cub�culo 101', 'Edificio A', '2023-06-10', 'C101', 10),
(2, 'Cub�culo 201', 'Edificio B', '2023-06-15', 'C201', 15),
(3, 'Cub�culo 301', 'Edificio C', '2023-06-12', 'C301', 20),
(4, 'Cub�culo 401', 'Edificio D', '2023-06-20', 'C401', 25);

-- Poblaci�n de la tabla EvaluacionMaestro
INSERT INTO EvaluacionMaestro (idEvaluacion, Puntualidad, Nombre_Maestro, Fecha, ConocimientoMateria, MetodosEnsenanza, Comentarios)
VALUES
(1, 5, 'Ricardo G�mez', '2023-06-10', 4, 4, 'Buen maestro'),
(2, 4, 'Laura Mart�nez', '2023-06-15', 3, 3, 'Regular'),
(3, 5, 'Ricardo G�mez', '2023-06-12', 4, 4, 'Muy buen maestro'),
(4, 3, 'Laura Mart�nez', '2023-06-20', 2, 2, 'Necesita mejorar');

-- Poblaci�n de la tabla Tutor
INSERT INTO Tutor (idTutor, Nombre, lista_Alumnos, Apellido, Email, Telefono, Especialidad)
VALUES
(1, 'Tutor1', 'Lista de alumnos 1', 'Apellido1', 'tutor1@example.com', '555-123-4567', 'Especialidad 1'),
(2, 'Tutor2', 'Lista de alumnos 2', 'Apellido2', 'tutor2@example.com', '555-234-5678', 'Especialidad 2');

-- Poblaci�n de la tabla Universidad
INSERT INTO Universidad (idUniversidad, Nombre, Direccion, CP, Nombre_DIrector, Ciudad, Pais, Telefono)
VALUES
(1, 'Universidad A', 'Direcci�n A', 'CP12345', 'Director A', 'Ciudad A', 'Pa�s A', '555-111-2222'),
(2, 'Universidad B', 'Direcci�n B', 'CP54321', 'Director B', 'Ciudad B', 'Pa�s B', '555-333-4444');



-- SELECT para la tabla Aula
SELECT * FROM Aula;

-- SELECT para la tabla Alumno
SELECT * FROM Alumno;

-- SELECT para la tabla Carrera
SELECT * FROM Carrera;

-- SELECT para la tabla Docente
SELECT * FROM Docente;

-- SELECT para la tabla Examen
SELECT * FROM Examen;

-- SELECT para la tabla Horario
SELECT * FROM Horario;

-- SELECT para la tabla Materia
SELECT * FROM Materia;

-- SELECT para la tabla PlanEstudio
SELECT * FROM PlanEstudio;

-- SELECT para la tabla Proyectos
SELECT * FROM Proyectos;

-- SELECT para la tabla Tareas
SELECT * FROM Tareas;

-- SELECT para la tabla Turno
SELECT * FROM Turno;

-- SELECT para la tabla Asesoria
SELECT * FROM Asesoria;

-- SELECT para la tabla Cubiculo
SELECT * FROM Cubiculo;

-- SELECT para la tabla EvaluacionMaestro
SELECT * FROM EvaluacionMaestro;

-- SELECT para la tabla Tutor
SELECT * FROM Tutor;

-- SELECT para la tabla Universidad
SELECT * FROM Universidad;





SELECT * 
FROM Alumno
WHERE CarreraID = (SELECT idCarrera FROM Carrera WHERE Nombre = 'Ingenier�a en Inform�tica');




SELECT Docente.*
FROM Docente
INNER JOIN Materia ON Docente.idDocente = Materia.idClase
WHERE Materia.Nombre_Asignatura = 'Algebra';


SELECT Nombre, Apellido, AVG(Calificacion) AS PromedioCalificaciones
FROM Examen
WHERE Nombre_Alumno = 'Juan Perez'
GROUP BY Nombre, Apellido;


SELECT Horario.*
FROM Horario
INNER JOIN Alumno ON Horario.idClase = Alumno.idGrupo
WHERE Alumno.Nombre = 'Juan';


SELECT Materia.*
FROM Materia
INNER JOIN PlanEstudio ON Materia.idPlanEstudio = PlanEstudio.idPlanEstudio
WHERE PlanEstudio.Nombre = 'Plan 2018';



SELECT Examen.*
FROM Examen
INNER JOIN Materia ON Examen.idMateria = Materia.idMateria
WHERE Materia.Nombre_Asignatura = 'Matematicas';




SELECT Docente.*
FROM Docente
INNER JOIN Universidad ON Docente.idUniversidad = Universidad.idUniversidad
WHERE Universidad.Nombre = 'Universidad A';





ALTER TABLE Cubiculo
ADD idDocente INT;

ALTER TABLE Cubiculo
ADD CONSTRAINT FK_Cubiculo_Docente
FOREIGN KEY (idDocente)
REFERENCES Docente(idDocente);


ALTER TABLE Materia
ADD idReticula INT;


ALTER TABLE Materia
ADD CONSTRAINT FK_Materia_Reticula
FOREIGN KEY (idReticula)
REFERENCES Reticula(idReticula);


ALTER TABLE Grupo
ADD idReticula INT;


ALTER TABLE Grupo
ADD CONSTRAINT FK_Grupo_Reticula
FOREIGN KEY (idReticula)
REFERENCES Reticula(idReticula);


ALTER TABLE Reticula
ADD idPlanEstudio INT;


ALTER TABLE Reticula
ADD CONSTRAINT FK_Reticula_PlanEstudio
FOREIGN KEY (idPlanEstudio)
REFERENCES PlanEstudio(idPlanEstudio);


ALTER TABLE PlanEstudio
ADD idCarrera INT;


ALTER TABLE PlanEstudio
ADD CONSTRAINT FK_PlanEstudio_Carrera
FOREIGN KEY (idCarrera)
REFERENCES Carrera(idCarrera);
--

--1n

ALTER TABLE EvaluacionMaestro
ADD idAlumno INT;


ALTER TABLE EvaluacionMaestro
ADD CONSTRAINT FK_EvaluacionMaestro_Alumno
FOREIGN KEY (idAlumno)
REFERENCES Alumno(idAlumno);


ALTER TABLE Asistencia
ADD idAlumno INT;


ALTER TABLE Asistencia
ADD CONSTRAINT FK_Asistencia_Alumno
FOREIGN KEY (idAlumno)
REFERENCES Alumno(idAlumno);


ALTER TABLE Aula
ADD idAlumno INT;


ALTER TABLE Aula
ADD CONSTRAINT FK_Aula_Alumno
FOREIGN KEY (idAlumno)
REFERENCES Alumno(idAlumno);


ALTER TABLE Tarea
ADD idAlumno INT;


ALTER TABLE Tarea
ADD CONSTRAINT FK_Tarea_Alumno
FOREIGN KEY (idAlumno)
REFERENCES Alumno(idAlumno);


ALTER TABLE Proyecto
ADD idAlumno INT;


ALTER TABLE Proyecto
ADD CONSTRAINT FK_Proyecto_Alumno
FOREIGN KEY (idAlumno)
REFERENCES Alumno(idAlumno);


ALTER TABLE Examen
ADD idAlumno INT;


ALTER TABLE Examen
ADD CONSTRAINT FK_Examen_Alumno
FOREIGN KEY (idAlumno)
REFERENCES Alumno(idAlumno);


ALTER TABLE Grupo
ADD idAlumno INT;


ALTER TABLE Grupo
ADD CONSTRAINT FK_Grupo_Alumno
FOREIGN KEY (idAlumno)
REFERENCES Alumno(idAlumno);


ALTER TABLE Tarea
ADD idDocente INT;


