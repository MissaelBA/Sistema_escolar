INSERT INTO centros
(
    telebachillerato,
    clave_centro,
    municipio,
    encargado,
    correo
)
VALUES
(
    'Telebachillerato Comunitario Jerécuaro - El Tepozán',
    '11ETK0001U',
    'Jerécuaro',
    'Sergio Jesús Almanza Juárez',
    'sealmanza@uveg.edu.mx'
);

INSERT INTO alumnos
(

    matricula,
    centro_id,
    estatus,
    nombre,
    paterno,
    materno,
    genero,
    generacion,
    municipio,
    pais
)
VALUES
(
    'TBC130001001',
    1,
    'activo',
    'Maria de la Luz',
    'Perez',
    'Bush',
    'M',
    1,
    'Jerécuaro',	
    'México'
    '1982-09-22'
);

INSERT INTO materias(nombre_materia)
VALUES
('Matemáticas'),
('Programación'),
('Historia');

INSERT INTO calificaciones
(
    alumno_id,
    materia_id,
    calificacion,
    fecha_registro
)
VALUES
(
    1,
    1,
    9.5,
    CURDATE()
);