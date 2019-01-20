create or replace TRIGGER VALORA_TRIGG
AFTER INSERT on valora
DECLARE
	nueva_val NUMBER;
BEGIN
	FOR i IN (SELECT
	"A1"."ID_CANCION"       "ID_CANCION",
	"A1"."NOMBRE_CANCION"   "NOMBRE_CANCION",
	"A1"."GENERO"           "GENERO",
	"A1"."DURACION_SEG"     "DURACION_SEG",
	"A1"."FECHA_C"          "FECHA_C",
	"A1"."RUTA_AUDIO"       "RUTA_AUDIO",
	"A1"."NUM_REPRO"        "NUM_REPRO",
	"A1"."VALORACION"       "VALORACION"
FROM
	"X7151952"."CANCION" "A1") LOOP
		SELECT AVG(puntuacion) INTO nueva_val FROM valora 
		WHERE id_cancion = i.id_cancion;
		IF nueva_val IS NULL THEN
			nueva_val := 0;
		END IF;
		UPDATE cancion SET valoracion = nueva_val 
		WHERE id_cancion = i.id_cancion;
	END LOOP;
   
END;