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
    pais varchar2(20));
    
commit;
    
describe usuario;
select * from usuario;

create table cancion(
    id_cancion char(8) constraint id_cancion_no_nulo not null
    constraint id_cancion_primaria primary key,
    nombre_cancion varchar2(50) constraint nombre_cancion_no_nulo not null,
    id_usuario varchar2(8) constraint artista_c_no_nulo not null foreign key references usuario(id_usuario),
    genero varchar2(20) constraint genero_no_nulo not null,
    duracion_seg number(3) constraint duracion_seg_no_nula not null,
    fecha_c date constraint fecha_no_nula not null,
    ruta_audio varchar2(100),
    num_repro number(10),
    valoracion number(1,2));