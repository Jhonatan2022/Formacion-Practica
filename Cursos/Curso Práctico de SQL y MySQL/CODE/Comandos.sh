# Accedemos a la siguiente ruta por medio de la terminal
cd C:\Program Files\MySQL\MySQL Workbench 8.0


# Para limpiar la pantalla de la terminal en mysql
system cls


# Accedemos al servicio de bases de datos con el siguiente comando
mysql -u root -h localhost -p # Nos pedirá la contraseña


# Comando para ver las bases de datos que tenemos
show databases;


# Comando para usar una base de datos
use nombre_base_de_datos;


# Comando para saber en que base de datos estamos
select database();

# Comando para crear una base de datos
create database nombre_base_de_datos;
# Si la base de datos ya existe nos dará un error
create database if not exists nombre_base_de_datos;



# Comando para crear una tabla en una base de datos
# UNSIGNED: No permite valores negativos
CREATE TABLE IF NOT EXISTS books (
    book_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    author_id INTEGER UNSIGNED NOT NULL,
    title VARCHAR(100) NOT NULL,
    `year` INTEGER UNSIGNED NOT NULL DEFAULT 1900,
    language VARCHAR(2) NOT NULL DEFAULT 'es'COMMENT 'ISO 639-1 Language',
    cover_url VARCHAR(500),
    price DOUBLE(6, 2) NOT NULL DEFAULT 10.0,
    sellable TINYINT(1) DEFAULT 1,
    copies INTEGER UNSIGNED NOT NULL DEFAULT 1,
    description TEXT
);

 

CREATE TABLE IF NOT EXISTS authors (
    author_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    nationality VARCHAR(3)
);



CREATE TABLE IF NOT EXISTS cients (
    client_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    birthdate DATETIME,
    gender ENUM('M', 'F', 'ND') NOT NULL,
    active TINYINT(1) NOT NULL DEFAULT 1,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);



CREATE TABLE IF NOT EXISTS operations (
    operation_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    book_id INTEGER UNSIGNED NOT NULL,
    client_id INTEGER UNSIGNED NOT NULL,
    operation_date DATETIME NOT NULL,
    type ENUM('prestado', 'devuelto', 'vendido') NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    modifed_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    finished TINYINT(1) NOT NULL DEFAULT 0
);



# Si en el 1er y 3er ejemplo de INSERT les marca el error:ERROR 1366 (HY000): Incorrect integer value: ‘’ for column ‘author_id’ at row 1
# Es porque en la tabla de authors el campo author_id es de tipo INTEGER UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
# Para esto pondremos NULL en el campo author_id esto hará que se auto incremente el valor


INSERT INTO authors(author_id, name, nationality) VALUES (NULL, 'Juan Rulfo', 'MEX');


INSERT INTO authors(name, nationality) VALUES ('Gabriel Garcia Marquez', 'COL');


INSERT INTO authors VALUES (NULL, 'Mario Vargas Llosa', 'PER');

INSERT INTO authors VALUES
(5,'Juan Rulfo','MEX'),
(6,'Henning Mankel','SWE'),
(7,'Jaideva Goswami','USA'),
(8,'John Foreman','USA'),
(9,'Stephen Hawking','USA'),
(10,'Stephen Dubner','USA'),
(11,'Edward Said','USA'),
(12,'Vladimir Vapnik','RUS'),
(13,'V P Menon','IND'),
(14,'Leonard Mlodinow','USA'),
(15,'Frank Shih','JAP'),
(16,'Maria Konnikova','RUS'),
(17,'Sebastian Gutierrez','ESP'),
(18,'Kurt Vonnegut','USA'),
(19,'Cedric Villani','FRA'),
(20,'Gerald Sussman','USA'),
(21,'Abraham Eraly','IND'),
(22,'Frank Kafka','AUT'),
(23,'John Pratt','USA'),
(24,'Robert Nisbet','USA'),
(25,'H. G. Wells',"ENG"),
(26,'Werner Heisenberg','DEU'),
(27,'Andy Oram',NULL),
(28,'Terence Tao',"AUS"),
(29,'Drew Conway',"USA"),
(30,'Nate Silver',"USA"),
(31,'Wes McKinney',"USA"),
(32,'Thomas Cormen', "USA"),
(33,'Siddhartha Deb',"IND"),
(34,'Albert Camus',"FRA"),
(37,'Adam Smith',"ENG"),
(38,'Ken Follett',"ENG"),
(39,'Fritjof Capra',"AUT"),
(40,'Richard Feynman',"USA"),
(41,'Ernest Hemingway',"USA"),
(42,'Frederick Forsyth',"ENG"),
(43,'Jeffery Archer',"ENG"),
(44,'Randy Pausch',"USA"),
(45,'Ayn Rand',"RUS"),
(46,'Michael Crichton',"USA"),
(47,'John Steinbeck',"USA"),
(48,'Edgar Allen Poe',"USA"),
(51,'Will Durant',NULL),
(52,'P L Deshpande',NULL),
(56,'John Grisham',"USA"),
(57,'V. S. Naipaul',NULL),
(58,'Joseph Heller',NULL),
(59,'BBC',NULL),
(60,'Bob Dylan',"USA"),
(61,'Madan Gupta',"IND"),
(62,'Alfred Stonier',NULL),
(63,'W. H. Greene',NULL),
(64,'Gary Bradsky',NULL),
(65,'Andrew Tanenbaum',NULL),
(66,'David Forsyth',NULL),
(67,'Schilling Taub',NULL),
(68,'Yashwant Kanetkar',NULL),
(69,'Jonathan Stroud',NULL),
(70,'Fyodor Dostoevsky',"RUS"),
(71,'Dan Brown',"USA"),
(72,'Amartya Sen',NULL),
(73,'Amitav Ghosh',NULL),
(75,'Lorraine Hansberry',NULL),
(76,'Bob Woodward',NULL),
(78,'Kuldip Nayar',NULL),
(79,'Sunita Deshpande',NULL),
(80,'William Dalrymple',NULL),
(81,'Various',NULL),
(85,'Sanjay Garg',NULL),
(86,'V P Kale',NULL),
(87,'Shashi Tharoor',"IND"),
(89,'Dominique Lapierre',NULL),
(93,'Bertrand Russell',"ENG"),
(94,'Sam Harris',NULL),
(96,'Earle Stanley Gardner',NULL),
(98,'Peter Drucker',NULL),
(99,'David Bodanis',NULL),
(100,'Victor Hugo',"FRA"),
(103,'Richard Gordon',NULL),
(104,'George Orwell',NULL),
(107,'Lee Iacoca',"USA"),
(108,'William S Maugham',NULL),
(111,'Robert Pirsig',NULL),
(112,'Robert Fisk',NULL),
(114,'Amir Aczel',NULL),
(117,'Samuel Huntington',NULL),
(119,'Richard Bach',NULL),
(120,'Braithwaite',NULL),
(121,'V S Naipaul',NULL),
(122,'Jawaharlal Nehru',NULL),
(128,'Gerald Durrell',NULL),
(133,'Simon Singh',"ENG"),
(134,'Hart Duda',NULL),
(135,'Thomas Friedman',NULL),
(138,'Keith Devlin',NULL),
(140,'James Gleick',NULL),
(141,'Joy Thomas',NULL),
(142,'Muhammad Rashid',NULL),
(143,'Ned Mohan',NULL),
(144,'Simon Haykin',NULL),
(148,'Alex Rutherford',NULL),
(153,'Michael Baz-Zohar',NULL),
(154,'Jim Corbett',NULL),
(155,'Jules Verne',NULL),
(156,'Deshpande P L',NULL),
(160,'Eric Raymond',NULL),
(161,'Sergio Franco',NULL),
(162,'Allen Downey',NULL),
(163,'Morris West',NULL),
(166,'Phillip Janert',NULL),
(167,'Carl Sagan',"USA"),
(168,'E T Bell',NULL),
(169,'Richard Dawkins',NULL),
(170,'Sudhanshu Ranjan',"IND"),
(171,'Kautiyla',NULL),
(172,'Palkhivala',NULL),
(174,'Sorabjee',NULL),
(175,'Hussain Zaidi',NULL),
(176,'Peter Ackroyd',NULL),
(178,'Nariman',NULL),
(179,'Jean Sassoon',NULL),
(180,'Peter Dickinson',NULL),
(182,'Machiavelli',NULL),
(183,'Aldous Huxley',"ENG"),
(184,'J K Rowling',"ENG"),
(185,'Steig Larsson',"SWE"),
(189,'Steve Eddins', NULL),
(192,'Charles Dickens',"ENG");

# Comando para ver las tablas que tenemos en la base de datos
show tables;


# Comando para ver la estructura de una tabla
describe nombre_tabla;


# Comando para ver toda la descripción de una tabla
show full columns from nombre_tabla;


# Comando para ver los datos de una tabla
select * from nombre_tabla;

# Comando para eliminar una tabla
drop table nombre_tabla;

# Comando para ver los errores que tenemos
show warnings;