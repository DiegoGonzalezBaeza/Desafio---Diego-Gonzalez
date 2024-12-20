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