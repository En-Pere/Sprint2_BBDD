-- Si us plau, descàrrega la base de dades del fitxer schema_universidad.sql, visualitza el diagrama E-R en un editor i efectua les següents consultes:

-- Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.
SELECT apellido1, apellido2, nombre FROM persona ORDER BY apellido1, apellido2, nombre ASC;

-- Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades
SELECT apellido1, apellido2, nombre, telefono FROM persona WHERE telefono IS NULL;

-- Retorna el llistat dels alumnes que van néixer en 1999.
SELECT apellido1, apellido2, fecha_nacimiento FROM persona;

-- Retorna el llistat de professors que no han donat d'alta el seu número de telèfon en la base de dades i a més la seva nif acaba en K.
SELECT nombre, tipo, telefono, nif FROM persona WHERE nif LIKE '%K' AND tipo = 'profesor' AND telefono IS NULL;

-- Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.
SELECT nombre, cuatrimestre, curso, id_grado FROM asignatura WHERE cuatrimestre = '1' AND curso = '3' AND id_grado = '7';

-- Retorna un llistat dels professors juntament amb el nom del departament al qual estan vinculats. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.
SELECT persona.apellido1, persona.apellido2, persona.nombre AS persona_nombre, departamento.nombre AS departamento_nombre FROM profesor INNER JOIN departamento ON profesor.id_departamento = departamento.id INNER JOIN persona ON profesor.id_profesor = persona.id ORDER BY persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;

-- Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne amb nif 26902806M.
SELECT asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin FROM alumno_se_matricula_asignatura INNER JOIN asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id INNER JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id INNER JOIN persona ON alumno_se_matricula_asignatura.id_alumno = persona.id WHERE persona.nif = '26902806M';

-- Retorna un llistat amb el nom de tots els departaments que tenen professors que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).
SELECT departamento.nombre FROM departamento INNER JOIN profesor ON departamento.id = profesor.id_departamento INNER JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor WHERE asignatura.id_grado = '4';

-- Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.
SELECT * FROM persona INNER JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno INNER JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id WHERE curso_escolar.id = '5';

-- Resolgui les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.
-- Retorna un llistat amb els noms de tots els professors i els departaments que tenen vinculats. El llistat també ha de mostrar aquells professors que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.
SELECT departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre FROM persona LEFT JOIN departamento ON persona.id = departamento.id WHERE persona.tipo = 'profesor' ORDER BY departamento.nombre ASC, persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;

-- Retorna un llistat amb els professors que no estan associats a un departament.
SELECT departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre FROM persona LEFT JOIN departamento ON persona.id = departamento.id WHERE persona.tipo = 'profesor' AND departamento.nombre IS NULL ORDER BY departamento.nombre ASC, persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;

-- Retorna un llistat amb els departaments que no tenen professors associats.
SELECT * FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento WHERE id_profesor IS NULL;

-- Retorna un llistat amb els professors que no imparteixen cap assignatura.
SELECT asignatura.id AS id_asignatura, persona.nombre, persona.apellido1, persona.apellido2, persona.nif, persona.tipo FROM  asignatura RIGHT JOIN persona ON asignatura.id_profesor = persona.id WHERE asignatura.id_profesor IS NULL AND persona.tipo = 'profesor';

-- Retorna un llistat amb les assignatures que no tenen un professor assignat.
SELECT nombre, id_profesor FROM asignatura WHERE id_profesor IS NULL;

-- Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.
SELECT DISTINCT departamento.nombre AS departamento FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor WHERE asignatura.id IS NULL;

-- Consultes resum --
-- Retorna el nombre total d'alumnes que hi ha:
SELECT COUNT(*) FROM persona WHERE tipo = 'alumno';

-- Calcula quants alumnes van néixer en 1999.
SELECT * FROM persona WHERE tipo = 'alumno' AND fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31';

-- Calcula quants professors hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors associats i haurà d'estar ordenat de major a menor pel nombre de professors.
SELECT departamento.nombre, COUNT(profesor.id_profesor) AS numero_profesores FROM profesor LEFT JOIN departamento ON profesor.id_departamento = departamento.id GROUP BY profesor.id_departamento ORDER BY numero_profesores DESC;

-- Retorna un llistat amb tots els departaments i el nombre de professors que hi ha en cadascun d'ells. Tingui en compte que poden existir departaments que no tenen professors associats. Aquests departaments també han d'aparèixer en el llistat.
SELECT departamento.nombre, COUNT(profesor.id_departamento) AS numero_profesores FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento GROUP BY departamento.id;

-- Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. Tingui en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.
SELECT grado.id, grado.nombre, COUNT(asignatura.id) AS numero_asignaturas FROM grado LEFT JOIN asignatura ON grado.id = asignatura.id_grado GROUP BY grado.id ORDER BY numero_asignaturas DESC;

-- Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades.
SELECT grado.id, grado.nombre, COUNT(asignatura.id) AS numero_asignaturas FROM grado LEFT JOIN asignatura ON grado.id = asignatura.id_grado  GROUP BY grado.id HAVING COUNT(asignatura.id) > 40;

-- Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus.
SELECT grado.id, grado.nombre, sum(asignatura.creditos) AS numero_asignaturas FROM grado LEFT JOIN asignatura ON grado.id = asignatura.id_grado 
GROUP BY grado.nombre 

-- Retorna un llistat que mostri quants alumnes s'han matriculat d'alguna assignatura en cadascun dels cursos escolars. El resultat haurà de mostrar dues columnes, una columna amb l'any d'inici del curs escolar i una altra amb el nombre d'alumnes matriculats.
-- Retorna un llistat amb el nombre d'assignatures que imparteix cada professor. El llistat ha de tenir en compte aquells professors que no imparteixen cap assignatura. El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d'assignatures. El resultat estarà ordenat de major a menor pel nombre d'assignatures.
-- Retorna totes les dades de l'alumne més jove.
-- Retorna un llistat amb els professors que tenen un departament associat i que no imparteixen cap assignatura.