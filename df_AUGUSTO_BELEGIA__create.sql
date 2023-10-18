-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-10-12 01:52:05.436

-- tables
-- Table: CALIFICACIONES
CREATE TABLE CALIFICACIONES (
    Id_Calificaciones int  NOT NULL,
    Estudiantes_RElacinados varchar(80)  NOT NULL,
    Fecha_de_evaluacion datetime  NOT NULL,
    Tema_de_evaluacion varchar(15)  NOT NULL,
    Calificacion_obtenida char(5)  NOT NULL,
    Formas_de_evaluacion char(5)  NOT NULL,
    Evaluacinos_id_evaluaciones int  NOT NULL,
    CONSTRAINT CALIFICACIONES_pk PRIMARY KEY (Id_Calificaciones)
);

-- Table: CLASES
CREATE TABLE CLASES (
    id_clase int  NOT NULL,
    Nombre varchar(80)  NOT NULL,
    cantidad_de_Estudiantes char(5)  NOT NULL,
    Horario datetime  NOT NULL,
    Aula varchar(12)  NOT NULL,
    Profesor varchar(20)  NOT NULL,
    Cursos_id_Cursos int  NOT NULL,
    CONSTRAINT CLASES_pk PRIMARY KEY (id_clase)
);

-- Table: Curso
CREATE TABLE Curso (
    id_curso int  NOT NULL,
    nombre varchar(20)  NOT NULL,
    cursos_relacionados char(5)  NOT NULL,
    grado_academico char(5)  NOT NULL,
    id_estudiante int  NOT NULL,
    CONSTRAINT Cursos_pk PRIMARY KEY (id_curso)
);

-- Table: ESTUDIANTES
CREATE TABLE ESTUDIANTES (
    ID_Estudiante int  NOT NULL,
    Nombres varchar(60)  NOT NULL,
    Apellidos varchar(60)  NOT NULL,
    Edad char(2)  NOT NULL,
    Fecha_nacimiento date  NOT NULL,
    fecha_ingreso date  NOT NULL,
    informacion_medica varchar(200)  NOT NULL,
    id_profesor int  NOT NULL,
    CONSTRAINT ESTUDIANTES_pk PRIMARY KEY (ID_Estudiante)
);

-- Table: Evaluacinos
CREATE TABLE Evaluacinos (
    id_evaluaciones int  NOT NULL,
    tema_de_evaluacion char(5)  NOT NULL,
    profesor_asignado char(5)  NOT NULL,
    curso varchar(80)  NOT NULL,
    estudiantes char(9)  NOT NULL,
    tipo_evaluacion varchar(80)  NOT NULL,
    id_clase int  NOT NULL,
    CONSTRAINT Evaluacinos_pk PRIMARY KEY (id_evaluaciones)
);

-- Table: Profesores
CREATE TABLE Profesores (
    id_profesor int  NOT NULL,
    Nombres varchar(60)  NOT NULL,
    Apellidos varchar(20)  NOT NULL,
    genero char(2)  NOT NULL,
    edad char(2)  NOT NULL,
    email varchar(80)  NOT NULL,
    direcccion varchar(80)  NOT NULL,
    fecha_nacimiento date  NOT NULL,
    curso varchar(80)  NOT NULL,
    CONSTRAINT Profesores_pk PRIMARY KEY (id_profesor)
);

-- foreign keys
-- Reference: CALIFICACIONES_Evaluacinos (table: CALIFICACIONES)
ALTER TABLE CALIFICACIONES ADD CONSTRAINT CALIFICACIONES_Evaluacinos FOREIGN KEY CALIFICACIONES_Evaluacinos (Evaluacinos_id_evaluaciones)
    REFERENCES Evaluacinos (id_evaluaciones);

-- Reference: CLASES_Cursos (table: CLASES)
ALTER TABLE CLASES ADD CONSTRAINT CLASES_Cursos FOREIGN KEY CLASES_Cursos (Cursos_id_Cursos)
    REFERENCES Curso (id_curso);

-- Reference: Curso_ESTUDIANTES (table: Curso)
ALTER TABLE Curso ADD CONSTRAINT Curso_ESTUDIANTES FOREIGN KEY Curso_ESTUDIANTES (id_estudiante)
    REFERENCES ESTUDIANTES (ID_Estudiante);

-- Reference: ESTUDIANTES_Profesores (table: ESTUDIANTES)
ALTER TABLE ESTUDIANTES ADD CONSTRAINT ESTUDIANTES_Profesores FOREIGN KEY ESTUDIANTES_Profesores (id_profesor)
    REFERENCES Profesores (id_profesor);

-- Reference: Evaluacinos_CLASES (table: Evaluacinos)
ALTER TABLE Evaluacinos ADD CONSTRAINT Evaluacinos_CLASES FOREIGN KEY Evaluacinos_CLASES (id_clase)
    REFERENCES CLASES (id_clase);

-- End of file.

