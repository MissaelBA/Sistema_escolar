-- La clave se concatenara con el id al mostrarla para no duplicar información y que se vea de manera más limpia
CREATE TABLE centros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    telebachillerato VARCHAR(100) NOT NULL,
    clave_centro VARCHAR(100) NOT NULL UNIQUE,
    municipio VARCHAR(100) NOT NULL,
    encargado VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE
);	

CREATE TABLE alumnos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    matricula VARCHAR(100) NOT NULL UNIQUE,
    centro_id INT NOT NULL,
    estatus ENUM('activo', 'inactivo') NOT NULL,
	nombre VARCHAR(100) NOT NULL,
    paterno VARCHAR(100) NOT NULL,
    materno VARCHAR(100) NOT NULL,
    genero ENUM('H', 'M')NOT NULL,
    generacion INT NOT NULL,
    municipio VARCHAR(100) NOT NULL,
    pais VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE,

    CONSTRAINT fk_alumnos_centro
    FOREIGN KEY (centro_id)
    REFERENCES centros(id)
);

CREATE TABLE materias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_materia VARCHAR(100) NOT NULL UNIQUE
    );
    
CREATE TABLE calificaciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
	alumno_id INT NOT NULL,
	materia_id INT NOT NULL,
	calificacion DECIMAL(4,2) NOT NULL,
	fecha_registro DATE,

    CONSTRAINT fk_calificaciones_alumno
    FOREIGN KEY (alumno_id)
    REFERENCES alumnos(id),

	CONSTRAINT fk_calificaciones_materia
    FOREIGN KEY (materia_id)
    REFERENCES materias(id),
    
	UNIQUE (alumno_id, materia_id)
);

ALTER TABLE calificaciones
MODIFY fecha_registro DATE
NOT NULL DEFAULT (CURRENT_DATE);

ALTER TABLE calificaciones
ADD CONSTRAINT chk_calificacion
CHECK (calificacion >= 0 AND calificacion <= 10);
