use turmax;
-- listar o nome de cada material e o valor médio desse material

SELECT m.id, m.nome, AVG(valor) as media
FROM item_ordem_compra as ioc, material as m
WHERE ioc.idMaterial = m.id
GROUP BY m.nome
ORDER BY m.id


-- listar o nome de cada material e o valor médio desse material entre os dias 10/05/2022 e 13/05/2022

SELECT m.id, m.nome, AVG(valor) as media
FROM item_ordem_compra as ioc, material as m, ordem_compra
WHERE ioc.idMaterial = m.id 
AND ordem_compra.id = ioc.idOrdemCompra 
AND ordem_compra.data 
BETWEEN '2022-05-10' AND '2022-05-13'
GROUP BY m.nome
ORDER BY m.id


-- qual é o produto que mais aparece nas compras?

SELECT m.id, m.nome, count(ioc.idMaterial) as contagem
FROM material as m, item_ordem_compra as ioc
WHERE m.id=ioc.idMaterial
GROUP BY ioc.idMaterial
ORDER BY contagem desc;

-- CRUD (insert, select, update, delete)

UPDATE 'material' SET 'nome'= 'Prego' WHERE id=2;

DELETE FROM material WHERE id=2;

------------
DELETE FROM item_ordem_compra 
WHERE item_ordem_compra.idOrdemCompra=5
AND item_ordem_compra.idMaterial = 11