USE sub_urbans;

INSERT INTO clientes (nombres, apellidos, correo, telefono) VALUES
('Laura', 'Gómez', 'laura.gomez@email.com', '3001112233'),
('Andrés', 'Rodríguez', 'andres.rodriguez@email.com', '3012223344'),
('Valentina', 'Pérez', 'valentina.perez@email.com', '3023334455'),
('Samuel', 'Torres', 'samuel.torres@email.com', '3034445566');

INSERT INTO categorias (nombre, descripcion) VALUES
('Camisetas', 'Camisetas casuales y urbanas'),
('Pantalones', 'Jeans y pantalones streetwear'),
('Chaquetas', 'Chaquetas para diferentes estilos'),
('Accesorios', 'Gorras, bolsos y complementos');

INSERT INTO productos
(id_categoria, nombre, descripcion, talla, color, precio, stock) VALUES
(1, 'Camiseta Oversize Basic', 'Camiseta de corte amplio', 'M', 'Negro', 59900, 18),
(1, 'Camiseta Graphic', 'Camiseta con estampado urbano', 'L', 'Blanco', 69900, 12),
(2, 'Jean Wide Leg', 'Jean de corte amplio', '32', 'Azul', 139900, 8),
(2, 'Cargo Street', 'Pantalón estilo cargo', '30', 'Beige', 129900, 10),
(3, 'Chaqueta Bomber', 'Chaqueta urbana liviana', 'M', 'Negro', 189900, 5),
(4, 'Gorra SubUrbans', 'Gorra con diseño de marca', 'Única', 'Gris', 49900, 20);

INSERT INTO metodos_pago (nombre, descripcion) VALUES
('Tarjeta', 'Pago electrónico con tarjeta'),
('Transferencia', 'Transferencia bancaria'),
('Contraentrega', 'Pago al recibir el pedido');

INSERT INTO pedidos (id_cliente, estado, observaciones) VALUES
(1, 'Pagado', 'Entrega en domicilio'),
(2, 'Pendiente', 'Confirmar disponibilidad'),
(1, 'Entregado', 'Cliente recibió el pedido'),
(3, 'Pagado', 'Compra de temporada');

INSERT INTO detalle_pedido
(id_pedido, id_producto, cantidad, precio_unitario) VALUES
(1, 1, 2, 59900),
(1, 6, 1, 49900),
(2, 3, 1, 139900),
(3, 2, 1, 69900),
(3, 4, 1, 129900),
(4, 5, 1, 189900),
(4, 6, 2, 49900);

INSERT INTO pagos
(id_pedido, id_metodo_pago, valor, estado, referencia) VALUES
(1, 1, 169700, 'Aprobado', 'SUB-PA-0001'),
(2, 2, 139900, 'Pendiente', 'SUB-PA-0002'),
(3, 1, 199800, 'Aprobado', 'SUB-PA-0003'),
(4, 3, 289700, 'Aprobado', 'SUB-PA-0004');
