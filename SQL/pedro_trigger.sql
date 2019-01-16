insert into lista (id_lista,nombre_lista,fecha_l)
    values ('L0000002','Lista 2','28/07/1998');
    
insert into lista (id_lista,nombre_lista,fecha_l)
    values ('L0000003','Lista 3','25/06/2003');
    
insert into pertenece (id_lista,id_cancion) values ('L0000002','C0000001');

insert into pertenece (id_lista,id_cancion) values ('L0000002','C0000002');

insert into pertenece (id_lista,id_cancion) values ('L0000003','C0000001');

delete from pertenece where(id_lista = 'L0000003' and id_cancion = 'C0000001');

select * from pertenece;

CREATE OR REPLACE TRIGGER pedro_trigg
BEFORE INSERT ON pertenece
FOR EACH ROW
DECLARE
num_canciones number := 0;
BEGIN
    SELECT count(id_cancion) 
    INTO num_canciones 
    FROM pertenece  
    where id_cancion = :new.id_cancion;
    
	if (num_canciones > 1) THEN
		DBMS_OUTPUT.PUT_LINE('La cancion pertenece a mas de dos listas');
	END IF;    
END;
