-- Películas 
CREATE TABLE peliculas (
    id SMALLINT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    genero VARCHAR(50) NOT NULL,
    anio_estreno YEAR NOT NULL,
    duracion SMALLINT UNSIGNED NOT NULL,
    compania_productora VARCHAR(255) NOT NULL,
    director VARCHAR(255) NOT NULL
);

INSERT INTO peliculas (titulo, genero, anio_estreno, duracion, compania_productora, director) VALUES
('El Rey Leon', 'Animacion', 1994, 88, 'Walt Disney Pictures', 'Roger Allers, Rob Minkoff'),
('Tarzan', 'Animacion', 1999, 88, 'Walt Disney Pictures', 'Kevin Lima, Chris Buck'),
('Mufasa: El Rey Leon', 'Animacion', 2024, 105, 'Walt Disney Pictures', 'Barry Jenkins'),
('Coco', 'Animacion', 2017, 105, 'Pixar Animation Studios', 'Lee Unkrich'),
('Batman: El Caballero De La Noche', 'Accion', 2008, 152, 'Warner Bros.', 'Christopher Nolan'),
('Avengers: Endgame', 'Accion', 2019, 181, 'Marvel Studios', 'Anthony Russo, Joe Russo'),
('Inception', 'Ciencia Ficcion', 2010, 148, 'Warner Bros.', 'Christopher Nolan'),
('The Matrix', 'Ciencia Ficcion', 1999, 136, 'Warner Bros.', 'Lana Wachowski, Lilly Wachowski'),
('Toy Story', 'Animacion', 1995, 81, 'Pixar Animation Studios', 'John Lasseter'),
('Jurassic Park', 'Aventura', 1993, 127, 'Universal Pictures', 'Steven Spielberg'),
('Interstellar', 'Ciencia Ficcion', 2014, 169, 'Paramount Pictures', 'Christopher Nolan'),
('The Godfather', 'Drama', 1972, 175, 'Paramount Pictures', 'Francis Ford Coppola'),
('Gladiator', 'Accion', 2000, 155, 'Universal Pictures', 'Ridley Scott'),
('Shrek', 'Animacion', 2001, 90, 'DreamWorks Animation', 'Andrew Adamson, Vicky Jenson'),
('Titanic', 'Romance', 1997, 195, '20th Century Fox', 'James Cameron'),
('Spider-Man: No Way Home', 'Accion', 2021, 148, 'Marvel Studios', 'Jon Watts'),
('The Lion King', 'Animacion', 2019, 118, 'Walt Disney Pictures', 'Jon Favreau'),
('Pulp Fiction', 'Crimen', 1994, 154, 'Miramax', 'Quentin Tarantino'),
('The Shawshank Redemption', 'Drama', 1994, 142, 'Castle Rock Entertainment', 'Frank Darabont'),
('Frozen', 'Animacion', 2013, 102, 'Walt Disney Animation Studios', 'Chris Buck, Jennifer Lee'),
('The Dark Knight Rises', 'Accion', 2012, 164, 'Warner Bros.', 'Christopher Nolan'),
('Mad Max: Fury Road', 'Accion', 2015, 120, 'Warner Bros.', 'George Miller'),
('Finding Nemo', 'Animacion', 2003, 100, 'Pixar Animation Studios', 'Andrew Stanton'),
('The Lord of the Rings: The Fellowship of the Ring', 'Aventura', 2001, 178, 'New Line Cinema', 'Peter Jackson'),
('Harry Potter y la Piedra Filosofal', 'Fantasia', 2001, 152, 'Warner Bros.', 'Chris Columbus'),
('El Viaje de Chihiro', 'Animacion', 2001, 125, 'Studio Ghibli', 'Hayao Miyazaki'),
('La La Land', 'Musical', 2016, 128, 'Summit Entertainment', 'Damien Chazelle'),
('Como Enamorar a una Chica Punk', 'Comedia', 2017, 102, 'Hanway Films', 'John Cameron Mitchell'),
('Cuestion de Tiempo', 'Romance', 2013, 123, 'Working Title Films', 'Richard Curtis'),
('La Bruja', 'Terror', 2015, 93, 'Parts and Labor', 'Robert Eggers'),
('Mad Max', 'Accion', 1979, 93, 'Kennedy Miller Productions', 'George Miller'),
('La Isla Siniestra', 'Suspenso', 2010, 138, 'Paramount Pictures', 'Martin Scorsese');



-- Alumnos
CREATE TABLE alumnos (
    matricula INT(9) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido_paterno VARCHAR(50) NOT NULL,
    apellido_materno VARCHAR(50),
    fecha_nacimiento DATE NOT NULL
);

INSERT INTO alumnos (matricula, nombre, apellido_paterno, apellido_materno, fecha_nacimiento) VALUES
(412011001, 'Juan', 'Perez', 'Gomez', '2000-01-15'),
(423022002, 'Ana', 'Martinez', 'Lopez', '1999-06-23'),
(434033003, 'Carlos', 'Garcia', 'Ramirez', '1998-04-30'),
(445044004, 'Laura', 'Hernandez', 'Diaz', '2001-09-05'),
(456055005, 'Luis', 'Sanchez', 'Flores', '2000-12-17'),
(317056006, 'Maria', 'Gonzalez', 'Morales', '1999-03-22'),
(328047007, 'Pedro', 'Rodriguez', 'Torres', '2001-07-11'),
(339038008, 'Sofia', 'Ramirez', 'Rios', '1998-11-30'),
(341029009, 'Diego', 'Fernandez', 'Cruz', '2000-05-25'),
(351010010, 'Julia', 'Lopez', 'Soto', '1999-10-08'),
(212011011, 'Fernando', 'Castillo', 'Gomez', '2001-01-20'),
(223022012, 'Patricia', 'Mendoza', 'Jimenez', '1998-07-18'),
(234033013, 'Javier', 'Ortega', 'Vargas', '1999-09-12'),
(245044014, 'Claudia', 'Ramos', 'Perez', '2000-02-05'),
(256055015, 'Ricardo', 'Nunez', 'Alvarez', '2001-03-03'),
(117066016, 'Monica', 'Cruz', 'Moreno', '1998-05-16'),
(128077017, 'Francisco', 'Delgado', 'Reyes', '1999-12-25'),
(139088018, 'Veronica', 'Aguilar', 'Castro', '2000-08-14'),
(142099019, 'Roberto', 'Gomez', 'Suarez', '2001-06-07'),
(151011020, 'Lucia', 'Vega', 'Campos', '1999-11-19');



-- Dueños 
CREATE TABLE propietario (
    id INT NULL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

INSERT INTO propietario (id, nombre) VALUES
(1, 'Haruki Murakami'),
(2, 'George Orwell'),
(3, 'Aldous Huxley'),
(4, 'Carlos Castaneda'),
(5, 'Herman Hesse'),
(6, 'Agatha Christie'),
(7, 'Alejo Carpentier'),
(8, 'Isabel Allende'),
(9, 'Arturo Uslar'),
(10, 'Maria Luisa'),
(11, 'Howard Philip'),
(12, 'Gabriel Garcia'),
(13, 'Octavio Paz'),
(14, 'Charles Baudelaire'),
(15, 'Antonin Artaud');

-- Mascotas 
CREATE TABLE mascotas (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    propietario_id INT,
    raza VARCHAR(50),
    sexo CHAR(1),
    fecha_nacimiento DATE,
    FOREIGN KEY (propietario_id) REFERENCES propietario(id)
);

INSERT INTO mascotas (id, nombre, propietario_id, raza, sexo, fecha_nacimiento) VALUES
(1, 'Luna', 1, 'Golden Retriever', 'F', '2018-05-12'),
(2, 'Max', 2, 'Bulldog', 'M', '2017-08-23'),
(3, 'Bella', 3, 'Poodle', 'F', '2019-03-15'),
(4, 'Charlie', 4, 'Beagle', 'M', '2020-01-10'),
(5, 'Rocky', 5, 'Labrador Retriever', 'M', '2016-11-25'),
(6, 'Milo', 6, 'Chihuahua', 'M', '2019-07-05'),
(7, 'Daisy', 7, 'Shih Tzu', 'F', '2020-12-01'),
(8, 'Coco', 8, 'Rottweiler', 'F', '2017-06-14'),
(9, 'Buddy', 9, 'Dachshund', 'M', '2018-09-22'),
(10, 'Lucy', 10, 'Boxer', 'F', '2021-02-11'),
(11, 'Simba', 1, 'Persian Cat', 'M', '2015-03-18'),
(12, 'Oscar', 2, 'Siamese Cat', 'M', '2016-12-09'),
(13, 'Nala', 3, 'Maine Coon', 'F', '2018-04-27'),
(14, 'Loki', 4, 'Bengal Cat', 'M', '2019-05-07'),
(15, 'Zoe', 5, 'Sphynx', 'F', '2020-11-18'),
(16, 'Tiger', NULL, 'Pastor Alemán', 'M', '2016-10-22'),
(17, 'Lola', NULL, 'Basset Hound', 'F', '2017-04-15'),
(18, 'Rex', NULL, 'Doberman', 'M', '2018-12-19'),
(19, 'Mia', NULL, 'Husky Siberiano', 'F', '2020-03-08'),
(20, 'Zeus', NULL, 'Akita Inu', 'M', '2021-01-25');
