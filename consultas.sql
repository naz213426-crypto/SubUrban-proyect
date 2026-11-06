USE sub_urbans;
SELECT * FROM productos;

INSERT INTO productos
(id_categoria, nombre, descripcion, talla, color, precio, stock)
VALUES (1, 'Camiseta Urban New', 'Nueva camiseta de prueba', 'S', 'Verde', 64900, 7);


UPDATE productos
SET precio = 67900, stock = 9
WHERE nombre = 'Camiseta Urban New';


DELETE FROM productos
WHERE nombre = 'Camiseta Urban New';

SELECT nombre, talla, precio
FROM productos
WHERE precio >= 100000;

SELECT nombre, precio
FROM productos
ORDER BY precio ASC;


SELECT
    p.id_pedido,
    CONCAT(c.nombres, ' ', c.apellidos) AS cliente,
    p.fecha_pedido,
    p.estado
FROM pedidos p
INNER JOIN clientes c ON p.id_cliente = c.id_cliente;


SELECT COUNT(*) AS total_productos
FROM productos;


SELECT SUM(valor) AS total_pagos_aprobados
FROM pagos
WHERE estado = 'Aprobado';


SELECT
    c.nombre AS categoria,
    COUNT(pr.id_producto) AS cantidad_productos
FROM categorias c
LEFT JOIN productos pr ON c.id_categoria = pr.id_categoria
GROUP BY c.id_categoria, c.nombre;


SELECT
    c.nombre AS categoria,
    SUM(dp.cantidad * dp.precio_unitario) AS total_vendido
FROM detalle_pedido dp
INNER JOIN productos pr ON dp.id_producto = pr.id_producto
INNER JOIN categorias c ON pr.id_categoria = c.id_categoria
INNER JOIN pedidos pe ON dp.id_pedido = pe.id_pedido
WHERE pe.estado IN ('Pagado', 'Entregado')
GROUP BY c.id_categoria, c.nombre;


SELECT
    c.nombre AS categoria,
    SUM(dp.cantidad * dp.precio_unitario) AS total_vendido
FROM detalle_pedido dp
INNER JOIN productos pr ON dp.id_producto = pr.id_producto
INNER JOIN categorias c ON pr.id_categoria = c.id_categoria
INNER JOIN pedidos pe ON dp.id_pedido = pe.id_pedido
WHERE pe.estado IN ('Pagado', 'Entregado')
GROUP BY c.id_categoria, c.nombre
HAVING SUM(dp.cantidad * dp.precio_unitario) > 100000;

SELECT
    pe.id_pedido,
    CONCAT(cl.nombres, ' ', cl.apellidos) AS cliente,
    pr.nombre AS producto,
    dp.cantidad,
    dp.precio_unitario,
    (dp.cantidad * dp.precio_unitario) AS subtotal
FROM detalle_pedido dp
INNER JOIN pedidos pe ON dp.id_pedido = pe.id_pedido
INNER JOIN clientes cl ON pe.id_cliente = cl.id_cliente
INNER JOIN productos pr ON dp.id_producto = pr.id_producto
ORDER BY pe.id_pedido;
