-- Llista el nom de tots els productos que hi ha en la taula producto.
SELECT nombre FROM producto;

-- Llista els noms i els preus de tots els productos de la taula producto.
SELECT nombre, precio FROM producto;

-- Llista totes les columnes de la taula producto.
SELECT * FROM producto;

-- Llista el nom dels productos, el preu en euros i el preu en dòlars estatunidencs (USD).
SELECT nombre, precio, precio*1.12  FROM producto;

-- Llista el nom dels productos, el preu en euros i el preu en dòlars estatunidencs (USD). Utilitza els següents àlies per a les columnes: nom de producto, euros, dolars.
SELECT nombre AS `nom de producto`, precio AS `euros`, precio*1.12 AS `dolars` FROM producto;

-- Llista els noms i els preus de tots els productos de la taula producto, convertint els noms a majúscula.
SELECT UPPER (nombre), precio FROM producto;

-- Llista els noms i els preus de tots els productos de la taula producto, convertint els noms a minúscula.
SELECT LOWER (nombre), precio FROM producto;

-- Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant.
SELECT nombre, UPPER (left (nombre,2)) FROM fabricante;

-- Llista els noms i els preus de tots els productos de la taula producto, arrodonint el valor del preu.
SELECT nombre, ROUND(precio), precio FROM producto;

-- Llista els noms i els preus de tots els productos de la taula producto, truncant el valor del preu per a mostrar-lo sense cap xifra decimal.
SELECT nombre, TRUNCATE(precio,0) FROM producto;

-- Llista el codi dels fabricants que tenen productos en la taula producto.
SELECT codigo_fabricante FROM producto;

-- Llista el codi dels fabricants que tenen productos en la taula producto, eliminant els codis que apareixen repetits.
SELECT codigo_fabricante FROM producto GROUP BY codigo_fabricante;

-- Llista els noms dels fabricants ordenats de manera ascendent.
SELECT nombre FROM fabricante ORDER BY nombre ASC;

-- Llista els noms dels fabricants ordenats de manera descendent.
SELECT nombre FROM fabricante ORDER BY nombre DESC;

-- Llista els noms dels productos ordenats en primer lloc pel nom de manera ascendent i en segon lloc pel preu de manera descendent.
SELECT nombre FROM producto ORDER BY nombre ASC, precio DESC;

-- Retorna una llista amb les 5 primeres files de la taula fabricante.
SELECT * FROM fabricante LIMIT 5;

-- Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. La quarta fila també s'ha d'incloure en la resposta.
SELECT * FROM fabricante LIMIT 2 OFFSET 3;

-- Llista el nom i el preu del producto més barat. (Utilitzi solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MIN(preu), necessitaria GROUP BY
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;

-- Llista el nom i el preu del producto més car. (Utilitzi solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MAX(preu), necessitaria GROUP BY.
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

-- Llista el nom de tots els productos del fabricant el codi de fabricant del qual és igual a 2.
SELECT * FROM fabricante  JOIN producto WHERE fabricante.codigo = '2';

-- Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.
SELECT producto.nombre AS nombreProducto, producto.precio AS precioProducto, fabricante.nombre AS nombreFabricante FROM producto LEFT JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;

-- Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordeni el resultat pel nom del fabricador, per ordre alfabètic.
-- Retorna una llista amb el codi del producte, nom del producte, codi del fabricador i nom del fabricador, de tots els productes de la base de dades.
-- Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.
-- Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.
-- Retorna una llista de tots els productes del fabricador Lenovo.
-- Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200€.
-- Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard i Seagate. Sense utilitzar l'operador IN.
-- Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard i Seagate. Utilitzant l'operador IN.
-- Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.
-- Retorna un llistat amb el nom i el preu de tots els productes el nom de fabricant dels quals contingui el caràcter w en el seu nom.
-- Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180€. Ordeni el resultat en primer lloc pel preu (en ordre descendent) i en segon lloc pel nom (en ordre ascendent)
-- Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades.
-- Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.
-- Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat.
-- Retorna tots els productes del fabricador Lenovo. (Sense utilitzar INNER JOIN).
-- Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricador Lenovo. (Sense utilitzar INNER JOIN).
-- Llista el nom del producte més car del fabricador Lenovo.
-- Llista el nom del producte més barat del fabricant Hewlett-Packard.
-- Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricador Lenovo.
-- Llesta tots els productes del fabricador Asus que tenen un preu superior al preu mitjà de tots els seus productes.
