# Desafio---Diego-Gonzalez
Proyecto educativo

# Desafío - Acceso a datos normalizados SQL con Node y Express

# Descripción

Supongamos que tenemos una tabla llamada "Ventas" en una base de datos de una tienda
de electrónicos con la siguiente estructura:

```sql
CREATE TABLE Ventas (
ID_Venta INT,
Fecha DATE,
Cliente VARCHAR(100),
Telefono VARCHAR(20),
Producto VARCHAR(100),
Categoria VARCHAR(50),
Precio DECIMAL(10,2),
Cantidad INT,
Total DECIMAL(10,2)
);
```

Esta tabla contiene información sobre ventas, clientes, productos y sus categorías. Tu tarea
es normalizar esta tabla para que cumpla con las formas normales 1FN, 2FN y 3FN.

1. La tabla cumple con la 1FN, ya que:
a. Cada columna contiene valores atómicos (no hay valores múltiples en una
sola celda).
b. Cada columna tiene un nombre único.
c. Todos los valores en una columna son del mismo tipo de datos.
d. No hay grupos repetitivos.

2. La tabla no cumple con la 2FN porque hay dependencias parciales. El Telefono
depende solo del Cliente, y la Categoria depende solo del Producto. Para cumplir con
la 2FN, debemos separar estas entidades en tablas propias.

3. Después de aplicar la 2FN, aún no se cumple la 3FN porque hay dependencias
transitivas. El Precio depende del Producto, no de la clave primaria de la tabla
Ventas.

# Requerimientos

1. Aplicar la 2FN, identicar y separar aquellas entidades que podrían ser propias.
(3 Puntos)
2. Aplicar la 3FN en la tabla ventas para que cada atributo no clave dependa
directamente de la clave primaria.
(4 Puntos)
3. Realiza la solución de este ejercicio escribiendo código SQL donde se declaren los
atributos y tipo de datos para cada atributo.
(3 Puntos)

## SOLUCIÓN:

```sql
CREATE TABLE Clientes (
    ID_Cliente INT PRIMARY KEY,
    Nombre_Cliente VARCHAR(100),
    Telefono VARCHAR(20)
);

CREATE TABLE Productos (
    ID_Producto INT PRIMARY KEY,
    Nombre_Producto VARCHAR(100),
    Categoria VARCHAR(50),
    Precio DECIMAL(10,2)
);

CREATE TABLE Ventas (
    ID_Venta INT PRIMARY KEY,
    ID_Cliente INT,
    Fecha DATE,
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente)
);

CREATE TABLE Detalle_Ventas (
    ID_Venta INT,
    ID_Producto INT,
    Cantidad INT,
    Total DECIMAL(10,2),
    PRIMARY KEY (ID_Venta, ID_Producto),
    FOREIGN KEY (ID_Venta) REFERENCES Ventas(ID_Venta),
    FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto)
);
```
