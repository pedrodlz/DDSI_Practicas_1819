create table usuario(
    id_usuario char(8) constraint id_usuario_no_nulo not null
    constraint id_usuario_primaria primary key,
    nombre_usuario varchar2(15) constraint nombre_usuario_no_nulo not null
    constraint nombre_usuario_candidata unique,
    email_u varchar2(40) constraint email_no_nulo not null,
    contrasenia_u varchar2(40) constraint contrasenia_no_nula not null,
    nombre_per varchar2(15) constraint nombre_no_nulo not null,
    apellidos_per varchar2(30),
    tipo varchar2(7) constraint tipo_correcto check (tipo in ('artista','usuario')),
    pais varchar2(20),
    nombre_artistico varchar2(50));
    
commit;
    
describe usuario;
select * from amigo;

create table cancion(
    id_cancion char(8) constraint id_cancion_no_nulo not null
    constraint id_cancion_primaria primary key,
    nombre_cancion varchar2(50) constraint nombre_cancion_no_nulo not null,
    genero varchar2(20) constraint genero_no_nulo not null,
    duracion_seg number(3) constraint duracion_seg_no_nula not null,
    fecha_c date constraint fecha_cancion_no_nula not null,
    ruta_audio varchar2(100),
    num_repro number(10),
    valoracion number(3,1));
    
create table lista(
    id_lista char(8) constraint id_lista_no_nulo not null
    constraint id_lista_primaria primary key,
    nombre_lista varchar2(50) constraint nombre_lista_no_nulo not null,
    fecha_l date constraint fecha_lista_no_nula not null,
    duracion_seg number(6));
    
select * from user_tables;

drop table crea;

commit;

create table pertenece(
    id_lista,
    id_cancion,
    constraint pertenece_clave_primaria primary key (id_lista,id_cancion),
    constraint id_lista_ext_pertenece foreign key(id_lista) references lista(id_lista),
    constraint id_cancion_ext_pertenece foreign key(id_cancion) references cancion(id_cancion));
    
create table crea(
    id_usuario,
    id_lista,
    constraint crea_clave_primaria primary key (id_usuario,id_lista),
    constraint id_usuario_ext_crea foreign key(id_usuario) references usuario(id_usuario),
    constraint id_lista_ext_crea foreign key(id_lista) references lista(id_lista));

insert into usuario (id_usuario,nombre_usuario,email_u,contrasenia_u,nombre_per,apellidos_per,tipo,pais)
    values ('UN000001','pedrodlz','pedrodlz_email@gmail.com','pedrodlz_pass','Pedro','Domínguez López','usuario','españa');
   
insert into usuario (id_usuario,nombre_usuario,nombre_artistico,email_u,contrasenia_u,nombre_per,apellidos_per,tipo,pais)
    values ('UA000001','lil_peep','Lil Peep','lil_peep@gmail.com','lil_peep_pass','Gustav','Elijah Ahr','artista','eeuu');
    
insert into cancion (id_cancion,nombre_cancion,genero,duracion_seg,fecha_c,ruta_audio,num_repro)
    values ('C0000001','U Said','Trap','224','15/08/2017','/audio/C0000001','0');

insert into lista (id_lista,nombre_lista,fecha_l)
    values ('L0000001','Lista 1','01/01/2019');
    
insert into pertenece (id_lista,id_cancion) values ('L0000001','C0000001');

insert into crea (id_usuario,id_lista) values ('UN000001','L0000001');

insert into cancion (id_cancion,nombre_cancion,genero,duracion_seg,fecha_c,ruta_audio,num_repro)
values ('C0000002','All I want for Christmas is you','Pop','241',to_date('01/10/1994','DD/MM/YYYY'),'/audio/C0000002','0');

insert into usuario (id_usuario,nombre_usuario,nombre_artistico,email_u,contrasenia_u,nombre_per,apellidos_per,tipo,pais)
values ('UA000002','mariah_car','Mariah Carey','mariah_car@gmail.com','mariah_pass','Mariah','Carey','artista','eeuu');

describe pertenece;
    
select * from lista;

select * from pertenece;
                                                                        
CREATE
  TABLE amigo
  (
    id_usuario1,
    id_usuario2,
    CONSTRAINT clave_primaria PRIMARY KEY (id_usuario1,id_usuario2),
    CONSTRAINT id_usuario1_ext_pertenece FOREIGN KEY(id_usuario1) REFERENCES
    usuario(id_usuario),
    CONSTRAINT id_usuario2_ext_pertenece FOREIGN KEY(id_usuario2) REFERENCES
    usuario(id_usuario)
  );
                                                                        
INSERT
INTO
  usuario
  (
    id_usuario,
    nombre_usuario,
    email_u,
    contrasenia_u,
    nombre_per,
    apellidos_per,
    tipo,
    pais
  )
  VALUES
  (
    'UN000002',
    'darahh',
    'darahh@mail.com',
    'pass_secreto',
    'Dario',
    'Abad Tarifa',
    'usuario',
    'españa'
  );
                                                                        
create table recomienda(
  id_usuario1,
  id_usuario2,
  id_cancion,
  fecha date not null,
  constraint clave_pri primary key (id_usuario1,id_usuario2,id_cancion,fecha),
  foreign key (id_usuario1,id_usuario2) references amigo(id_usuario1,id_usuario2),
  foreign key (id_cancion) references cancion(id_cancion)
);
                                                                        
create table valora(
  id_usuario,
  id_cancion,
  puntuacion number(3,1),
  primary key (id_usuario,id_cancion),
  foreign key (id_usuario) references usuario(id_usuario),
  foreign key (id_cancion) references cancion(id_cancion)
);
                                                                        
create table escucha(
  id_usuario,
  id_cancion,
  fecha date not null,
  primary key (id_usuario,id_cancion,fecha),
  foreign key (id_usuario) references usuario(id_usuario),
  foreign key (id_cancion) references cancion(id_cancion)
);
                               

create table album(
    id_album char(8) constraint id_album_no_nulo not null
    constraint id_album_primaria primary key,
    nombre_album varchar2(50) 
    	constraint nombre_album_no_nulo not null,
    fecha_a date constraint fecha_album_no_nula not null,
    num_canciones number(5),
    duracion number(6)); 

create table formado(
  id_album,
  id_cancion,
  primary key (id_album,id_cancion),
  foreign key (id_album) references album(id_album),
  foreign key (id_cancion) references cancion(id_cancion)
);

create table desarrolla(
  id_usuario,
  id_cancion,
  primary key (id_usuario,id_cancion),
  foreign key (id_usuario) references usuario(id_usuario),
  foreign key (id_cancion) references cancion(id_cancion)
);

create table produce(
  id_usuario,
  id_album,
  primary key (id_usuario,id_cancion),
  foreign key (id_usuario) references usuario(id_usuario),
  foreign key (id_album)   references album(id_album)
);

create table destacadas(
  id_usuario,
  id_cancion,
  primary key (id_usuario,id_cancion),
  foreign key (id_usuario) references usuario(id_usuario),
  foreign key (id_cancion) references cancion(id_cancion)
);
                                         
                                                                        
