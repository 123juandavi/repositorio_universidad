CREATE DATABASE IF NOT EXISTS db_universidad;
USE db_universidad;

CREATE TABLE departamento (
    id_departamento INTEGER(10) PRIMARY KEY NOT NULL,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE grado (
    id_grado INTEGER(10) PRIMARY KEY NOT NULL,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE alumno (
    id_alumno INT(10) PRIMARY KEY NOT NULL,
    nif VARCHAR(9),
    nombre VARCHAR(25) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50) NOT NULL,
    ciudad VARCHAR(25) NOT NULL,
    direccion VARCHAR(50),
    telefono VARCHAR(9),
    fecha_nacimiento DATE,
    sexo ENUM('H', 'M')
);

CREATE TABLE curso_escolar (
    id_curso_escolar INT(10) PRIMARY KEY NOT NULL,
    ano_inicio YEAR(4),
    ano_fin YEAR(4)
);

CREATE TABLE profesor (
    id_profesor INT(10) PRIMARY KEY NOT NULL,
    nif VARCHAR(9),
    nombre VARCHAR(25) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50) NOT NULL,
    ciudad VARCHAR(25) NOT NULL,
    direccion VARCHAR(50),
    telefono VARCHAR(9),
    fecha_nacimiento DATE,
    sexo ENUM('H', 'M'),
    id_departamento INTEGER(10) NOT NULL,
    FOREIGN KEY(id_departamento) REFERENCES departamento(id_departamento)
);

CREATE TABLE asignatura (
    id_asignatura INTEGER(10) PRIMARY KEY NOT NULL,
    nombre VARCHAR(100),
    creditos FLOAT,
    tipo ENUM('basica', 'obligatorio', 'optativa') NOT NULL,
    curso TINYINT(3),
    cuatrimestre TINYINT(3),
    id_profesor INT(10) NOT NULL,
    id_grado INT(10) NOT NULL,
    FOREIGN KEY(id_profesor) REFERENCES profesor(id_profesor),
    FOREIGN KEY(id_grado) REFERENCES grado(id_grado)
);

CREATE TABLE alumno_se_matricula_asignatura (
    id_alumno INT(10),
    id_asignatura INT(10),
    id_curso_escolar INT(10),
    PRIMARY KEY(id_alumno, id_asignatura, id_curso_escolar),
    FOREIGN KEY(id_alumno) REFERENCES alumno(id_alumno),
    FOREIGN KEY(id_asignatura) REFERENCES asignatura(id_asignatura),
    FOREIGN KEY(id_curso_escolar) REFERENCES curso_escolar(id_curso_escolar)
);

INSERT INTO alumno (id_alumno, nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo) VALUES
    (11, '23456732T', 'Melissa', 'Gomez', 'Salazar', 'pereira', 'Calle 15', '7453623', '2002-03-15', 'M'),
    (12, '12345543A', 'Hernan', 'Gomez', 'Gomez', 'Medellin', 'Carrera 23', '7654893', '1959-02-27', 'H'),
    (13, '56000132T', 'Andrea', 'Martinez', 'Ramirez', 'Cartagena', 'Carrera 19', '7234512', '2005-05-17', 'M'),
    (14, '34560123I', 'Juan', 'Jimenez', 'Rodriguez', 'Bogota', 'Calle 5', '7239087', '1999-10-23', 'H'),
    (15, '2901245S', 'Laura', 'Nunez', 'Mendez', 'Cali', 'Carrera 10', '7433331', '2003-06-17', 'M');
    
    
SELECT * FROM alumno_se_matricula_asignatura;
SELECT * FROM grado;
SELECT * FROM asignatura;
SELECT * FROM curso_escolar;
SELECT * FROM profesor;
SELECT * FROM departamento;