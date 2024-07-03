create database losafortunados;
use losafortunados;

create table clientes (
id_cliente int not null primary key auto_increment,
nombre varchar (50) not null,
email varchar (50) not null unique
);

create table cuentas (
id_cuenta int not null primary key auto_increment,
saldo decimal (10, 2) not null,
id_cliente int not null,
foreign key (id_cliente) references clientes (id_cliente)
);

create table transacciones (
id_transaccion int not null primary key auto_increment,
monto decimal (10,3) not null,
fecha date not null default (curdate()),
id_cuenta int not null,
foreign key (id_cuenta) references cuentas (id_cuenta)
);

-- Registros clientes
INSERT INTO clientes (nombre, email) VALUES 
('Juan Pérez', 'juan.perez@example.com'),
('María López', 'maria.lopez@example.com'),
('Carlos García', 'carlos.garcia@example.com'),
('Ana Fernández', 'ana.fernandez@example.com'),
('Luis Martínez', 'luis.martinez@example.com'),
('Marta Gómez', 'marta.gomez@example.com'),
('José Sánchez', 'jose.sanchez@example.com'),
('Laura Díaz', 'laura.diaz@example.com'),
('Pedro Hernández', 'pedro.hernandez@example.com'),
('Elena Ruiz', 'elena.ruiz@example.com'),
('Javier Ramos', 'javier.ramos@example.com'),
('Carmen Morales', 'carmen.morales@example.com'),
('Raúl Ortiz', 'raul.ortiz@example.com'),
('Lucía Medina', 'lucia.medina@example.com'),
('Diego Romero', 'diego.romero@example.com'),
('Sara Alonso', 'sara.alonso@example.com'),
('Miguel Torres', 'miguel.torres@example.com'),
('Isabel Castro', 'isabel.castro@example.com'),
('Antonio Gil', 'antonio.gil@example.com'),
('Nuria Soto', 'nuria.soto@example.com');

-- Registros cuentas
INSERT INTO cuentas (saldo, id_cliente) VALUES 
(1500.50, 1),
(2300.75, 2),
(1800.00, 3),
(500.25, 4),
(3200.60, 5),
(2100.00, 6),
(750.90, 7),
(940.40, 8),
(1200.00, 9),
(1330.80, 10),
(2450.00, 11),
(760.00, 12),
(1800.25, 13),
(2200.50, 14),
(1500.00, 15),
(2300.00, 16),
(1800.00, 17),
(1300.50, 18),
(2100.00, 19),
(1500.00, 20);

-- Registros transacciones
INSERT INTO transacciones (monto, fecha, id_cuenta) VALUES 
(100.50, '2024-07-01', 1),
(200.75, '2024-07-02', 2),
(150.00, '2024-07-03', 3),
(50.25, '2024-07-04', 4),
(300.60, '2024-07-05', 5),
(100.00, '2024-07-06', 6),
(75.90, '2024-07-07', 7),
(90.40, '2024-07-08', 8),
(120.00, '2024-07-09', 9),
(130.80, '2024-07-10', 10),
(245.00, '2024-07-11', 11),
(76.00, '2024-07-12', 12),
(180.25, '2024-07-13', 13),
(220.50, '2024-07-14', 14),
(150.00, '2024-07-15', 15),
(230.00, '2024-07-16', 16),
(180.00, '2024-07-17', 17),
(130.50, '2024-07-18', 18),
(210.00, '2024-07-19', 19),
(150.00, '2024-07-20', 20);

-- Saldo e id cuentas
select saldo, id_cuenta from cuentas;

-- Saldo mayor a 4000
select saldo from cuentas where saldo > 2000;

-- Saldo menor a 2000
select saldo from cuentas where saldo < 2000;

-- Mostrar los nombres de los clientes y la longitud de sus nombres
SELECT nombre, LENGTH(nombre) AS longitud_nombre FROM clientes;

-- Seleccionar las cuentas con saldo entre 1000 y 3000
SELECT * FROM cuentas WHERE saldo BETWEEN 1000 AND 3000;

-- Obtener una lista de todos los clientes y sus cuentas, mostrando los valores NULL 
SELECT c.nombre, cu.id_cuenta, cu.saldo FROM clientes c LEFT JOIN cuentas cu ON c.id_cliente = cu.id_cliente;

-- Concatenar el nombre del cliente y su email con un separador
SELECT CONCAT(nombre, ' / ', email) AS nombre_email FROM clientes;

-- Extraer los últimos 3 caracteres del email de cada cliente
SELECT SUBSTRING(email, -3) AS ultimos_tres_caracteres_email FROM clientes;

-- Convertir el nombre del cliente a minúsculas
SELECT LOWER(nombre) AS nombre_minusculas FROM clientes;

-- Convertir el nombre del cliente a minúsculas
SELECT UPPER(nombre) AS nombre_minusculas FROM clientes;

-- Seleccionar las transacciones ordenadas por monto de mayor a menor, mostrando solo las primeras 10
SELECT * FROM transacciones ORDER BY monto DESC LIMIT 10;

-- Calcular el saldo de cada cuenta después de aplicar un interés del 5%
SELECT id_cuenta, saldo, saldo * 1.05 AS saldo_con_interes FROM cuentas;

-- Reemplazar el dominio del email de los clientes: email, '@example.com', '@newdomain.com'
SELECT email, REPLACE(email, '@example.com', '@newdomain.com') AS nuevo_email FROM clientes;

-- Selecciona el nombre de cada cliente.
SELECT nombre FROM clientes;

--  Añade una columna que muestre el email del cliente en el formato Correo: [email].
SELECT nombre, CONCAT('Correo: ', email) AS formato_email FROM clientes;

-- Mostrar los emails de los clientes en minúsculas
SELECT LOWER(email) AS email_minusculas FROM clientes;

-- Mostrar el nombre del cliente en mayúsculas
SELECT UPPER(nombre) AS nombre_mayusculas FROM clientes;

-- Selecciona el id_cuenta.
SELECT id_cuenta FROM cuentas;

-- Calcula el total de las transacciones realizadas en cada cuenta.
SELECT id_cuenta, SUM(monto) AS total_transacciones FROM transacciones GROUP BY id_cuenta;

-- Calcular el saldo total de todas las cuentas
SELECT SUM(saldo) AS saldo_total FROM cuentas;

-- Calcular el monto total de todas las transacciones
SELECT SUM(monto) AS monto_total_transacciones FROM transacciones;

-- Calcular el monto promedio de las transacciones
SELECT AVG(monto) AS monto_promedio FROM transacciones;

-- Selecciona el id_transaccion y la fecha de todas las transacciones.
SELECT id_transaccion, fecha FROM transacciones;

-- Extraer el año de la fecha de cada transacción
SELECT id_transaccion, YEAR(fecha) AS año FROM transacciones;

-- Extraer el mes de la fecha de cada transacción
SELECT id_transaccion, MONTH(fecha) AS mes FROM transacciones;

-- Extraer el día de la semana de la fecha de cada transacción
SELECT id_transaccion, DAYOFWEEK(fecha) AS dia_semana FROM transacciones;

-- Filtra las transacciones que se realizaron en el año 2024.
SELECT * FROM transacciones WHERE YEAR(fecha) = 2024;

-- Filtra las transacciones que se realizaron en el año 2023.
update transacciones set fecha = '2023-06-02' where id_transaccion = 1;
update transacciones set fecha = '2023-07-02' where id_transaccion = 2;
update transacciones set fecha = '2023-08-02' where id_transaccion = 3;

SELECT * FROM transacciones WHERE YEAR(fecha) = 2023;

-- Seleccionar las transacciones realizadas en el mes de junio de cualquier año
SELECT * FROM transacciones WHERE MONTH(fecha) = 6;

-- Seleccionar las transacciones realizadas el 15 de cada mes
SELECT * FROM transacciones WHERE DAY(fecha) = 15;

-- Cuenta el número de transacciones realizadas en cada cuenta.
SELECT id_cuenta, COUNT(*) AS numero_transacciones FROM transacciones GROUP BY id_cuenta;

-- Calcular el saldo promedio de todas las cuentas.
SELECT avg(saldo) as saldoTotal from cuentas;

-- Seleccionar las transacciones con un monto negativo 
SELECT id_transaccion, monto as MontoNegativo from transacciones where monto<0;

-- Seleccionar las transacciones con un monto positivo
SELECT id_transaccion, monto as MontoPositivo from transacciones where monto>0;

-- Seleccionar todas las cuentas ordenadas por saldo de mayor a menor
SELECT id_cuenta, saldo from cuentas order by saldo desc; 

-- Seleccionar todos los clientes ordenados alfabéticamente por nombre
SELECT nombre from clientes order by nombre asc;

-- Seleccionar las transacciones realizadas en 2023
SELECT id_transaccion, fecha as Transacciones2023 from transacciones where year(fecha) = 2023 order by fecha asc;

-- Seleccionar las cuentas ordenadas por saldo de menor a mayor, mostrando solo las primeras 5
SELECT id_cuenta, saldo as saldoMenor from cuentas order by saldo asc limit 5;

-- Contar el número total de clientes
SELECT count(*) as numeroClientes from clientes;

-- Contar el número total de cuentas
SELECT count(*) as numeroCuentas from cuentas;

-- Contar el número total de transacciones
SELECT count(*) as numeroTransacciones from transacciones;

-- Redondear el saldo de cada cuenta a dos decimales
SELECT round(saldo,2) as saldoRedondeado from cuentas;
-- Encontrar la cuenta con el saldo más alto
SELECT id_cuenta, saldo as saldoAlto from cuentas where saldo = (select max(saldo) from cuentas);

-- Encontrar la cuenta con el saldo más bajo
SELECT id_cuenta, saldo as saldoBajo from cuentas where saldo = (select min(saldo) from cuentas);

-- Encontrar la transacción con el monto más alto
SELECT id_transaccion, monto as montoAlto from transacciones where monto = (select max(monto) from transacciones);

-- Encontrar la transacción con el monto más bajo
SELECT id_transaccion, monto as montoBajo from transacciones where monto = (select min(monto) from transacciones);