
/*Vamos a intentar crear una valoración de una canción que no hemos escuchado */

INSERT INTO valora(id_usuario, id_cancion, puntuacion) values('UN000003', 'C0000001', 5.0);

/*Nos da un mensaje de error, ya que no hemos escuchado la canción (el disparador genera una excepción)*/
/*
INSERT INTO valora(id_usuario, id_cancion, puntuacion) values('UN000003', 'C0000001', 5)
Informe de error -
ORA-20001: No puedes valorar una cancion que no has escuchado
ORA-06512: en "X7151952.JAVIER_TRIGG", línea 11
ORA-04088: error durante la ejecución del disparador 'X7151952.JAVIER_TRIGG'
*/

/*Insertamos ahora una escucha por el usuario que desea valorar*/
INSERT INTO escucha(id_usuario, id_cancion, fecha) values('UN000003', 'C0000001', to_date('19/01/2019','DD/MM/YYYY'));

/*Si insertamos ahora una valoración funciona sin problemas.*/
/*
1 fila insertadas
*/

/*Devolvemos la BD a su estado original */
DELETE FROM escucha where id_usuario = 'UN000003' and ID_CANCION = 'C0000001';
DELETE FROM valora where id_usuario = 'UN000003' and ID_CANCION = 'C0000001';
commit;


create or replace TRIGGER javier_trigg
BEFORE INSERT ON valora
FOR EACH ROW
DECLARE
no_escuchada EXCEPTION;
existe number;
BEGIN
SELECT count(*) INTO existe FROM escucha WHERE 
			id_cancion = :new.id_cancion and id_usuario = :new.id_usuario;
    IF (existe = 0) THEN
           RAISE no_escuchada;
    END IF;
    EXCEPTION
    WHEN no_escuchada THEN
    RAISE_APPLICATION_ERROR(-20001,'No puedes valorar una cancion que 
														no has escuchado');
END;

INSERT INTO valora(id_usuario, id_cancion, puntuacion) values('UN000003', 'C0000001', 5.0);