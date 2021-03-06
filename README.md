# Sistema de Información para la gestión y escucha de canciones

 :musical_note: Creamos un sistema que gestione canciones desde el punto de vista de los usuarios y de los artistas  :musical_note:

## Subsistemas:

###### Escuchar canciones (Pedro)
	- Escuchar una canción/album/lista
	- Buscar una canción/album/lista
	- Crear listas de reproducción
	- Añadir/quitar canciones a una lista de reproducción
	- Borrar lista
	- Valorar canciones (se hace junto a administracion de usuarios)*

###### Subir canciones (Juan Fran)
	- Crear álbum
	- Crear canción
	- Ver estadísticas de canción
	- Destacar canciones individuales
	- Borrar canciones/albumes
	
###### Administración de usuarios (Javi)
	- Crear usuarios
	- Recuperar contraseña
	- Modificar perfil
	- Borrar usuarios
	- *
	
###### Social (Darío)
	- Seguir amigos/artistas/listas
	- Recomendar canciones a amigos
	- Ver lo que están escuchando los amigos
	- Ver recomendaciones entrantes.
	- Canciones mejor valoradas por un usuario
	
## Requisitos Funcionales
    • RF1. Crear álbum: un artista registra en el sistema un nuevo álbum.
        ◦ Entrada: RD1
        ◦ El sistema consulta RDE1
        ◦ El sistema actualiza RD2
        ◦ Salida: ninguna

    • RF2. Crear canción: un artista introduce en el sistema una nueva canción.
        ◦ Entrada: RD3
        ◦ El sistema consulta RD2, RDE1
        ◦ El sistema actualiza RD4
        ◦ Salida: RD5

    • RF3. Ver estadísticas de canción: un artista consulta las estadísticas de una de sus canciones buscándola con su identificador.
        ◦ Entrada: RD6
        ◦ El sistema consulta RD4
        ◦ Salida: RD7

    • RF4. Destacar canciones individuales: un artista selecciona una canción a través de su identificador y la añade a su lista de canciones destacadas.
        ◦ Entrada: RD8
        ◦ El sistema consulta RD4, RDE1
        ◦ El sistema actualiza RDE1
        ◦ Salida: RD9

    • RF5. Borrar canciones/álbumes: un artista introduce en el sistema si quiere eliminar una canción o un álbum y el identificador de su elección y el sistema elimina los datos asociados al mismo.
        ◦ Entrada: RD10
        ◦ El sistema consulta RD2, RD4, RDE1
        ◦ El sistema actualiza: RD2, RD4, RDE1
        ◦ Salida: ninguno
	
    • RF6. Escuchar una canción/album/lista: un usuario introduce el identificador de la canción, album o lista que quiere escuchar.
	◦ Entrada: RD11
	◦ El sistema consulta: RD2, RD4, RD12
	◦ Salida: RD13
	
    • RF7. Buscar una canción/album/lista: a traves del nombre de una cancion, album o lista se elige el identifcador que se considere el adecuado con los criterios de busqueda. 
    	◦ Entrada: RD14
	◦ El sistema consulta: RD2, RD4, RD12
	◦ Salida: RD15
    
    • RF8. Crear listas de reproducción: un usuario puede crear una lista donde añade canciones y las tiene todas en un mismo lugar.
    	◦ Entrada: RD16
	◦ El sistema actualiza: RD12
    	◦ Salida: RD17
    
    • RF9. Añadir/quitar canciones a una lista de reproducción: un usaurio puede añadir o eliminar las canciones de su lista a traves del identificador.
    	◦ Entrada: RD17
	◦ El sistema consulta: RD12
	◦ El sistema actualiza: RD12
    
    • RF10. Borrar lista: un usuario puede eliminar su lista.
        ◦ Entrada: RD17
	◦ El sistema consulta: RD12
	◦ El sistema actualiza: RD12
	
## Requisitos de datos

    • RD1. Datos nuevo álbum:
        ◦ Nombre del álbum
        ◦ Nombre del artista
        ◦ Fecha de introducción

    • RD2. Datos de álbum almacenado:
        ◦ Identificador del álbum
        ◦ Nombre del álbum
        ◦ Nombre del artista
        ◦ Fecha de introducción
        ◦ Número de canciones
        ◦ Duración

    • RD3. Datos nueva canción:
        ◦ Nombre de la canción
        ◦ Nombre del artista
        ◦ Nombre del álbum
        ◦ Estilo de la canción
        ◦ Duración de la canción
        ◦ Fecha de introducción
        ◦ Archivo de audio

    • RD4. Datos de canción almacenada:
        ◦ Identificador de la canción
        ◦ Nombre de la canción
        ◦ Nombre del artista
        ◦ Nombre del álbum
        ◦ Estilo de la canción
        ◦ Duración de la canción
        ◦ Fecha de introducción
        ◦ Archivo de audio
        ◦ Número de reproducciones
        ◦ Valoración media

    • RD5. Identificador de la canción introducida:
        ◦ Identificador de la canción

    • RD6. Identificador de la canción para ver sus estadístcas:
        ◦ Identificador de la canción

    • RD7. Estadísticas de la canción:
        ◦ Nombre de la canción
        ◦ Número de reproducciones
        ◦ Valoración media

    • RD8. Identificador de la canción para añadirla a canciones destacadas:
        ◦ Identificador de la canción

    • RD9. Lista de las canciones destacadas actualizada:
        ◦ Canciones destacadas

    • RD10. Identificador de la canción o álbum para eliminarlo:
        ◦ Elección (canción o álbum)
        ◦ Identificador
	
    • RD11. Identificador de la canción, álbum o lista para escuchar:
        ◦ Elección (canción, álbum o lista)
        ◦ Identificador

    • RD12. Datos de lista almacenada:
        ◦ Identificador de la lista
        ◦ Nombre de la lista
        ◦ Canciones que contiene
        ◦ Duración de la lista
        ◦ Fecha de creacion
        ◦ Usuario al que pertenece
        ◦ Seguidores
	
    • RD13. Reproduccion de una lista:
    	◦ Audio de las canciones de la lista
	
    • RD14. Nombre para la busqueda de una cancion, album o lista:
	◦ Nombre
	
    • RD15. Lista con los posibles identificadores según el resultado de la busqueda
    	◦ Identificador
	◦ Tipo: cancion, album, lista
	◦ Nombre
	◦ Usuario o artista
	◦ Fecha de publicacion o de creacion
	◦ Duracion
	
    • RD16. Datos para crear una lista nueva.
	◦ Nombre
    	◦ Usuario
    	◦ Fecha de creacion
	
    • RD17. Identificador de la nueva lista creada.
    	◦ Identificador de la lista
	
## Instrucciones

    • Diseño:
	-Esquema de caja negra.
    	-Esquema armazón F (DFD0), esquema armazón D (ED0) y esquemas externos (EE0).
    	-Para cada nivel de refinamiento desde el 1 en adelante, con 2 planos de refinamiento para cada una de las áreas funcionales:
        	+Los refinamientos parciales (separados) de cada elemento refinable del plano de refinamiento DFD anterior.
        	+El plano de refinamiento DFD como unión de todos los refinamientos del plano de refinamiento DFD anterior.
        	+Esquemas externos del plano de refinamiento DFD.
        	+El plano de refinamiento E/R como unión de todos los esquemas externos del plano de refinamiento DFD.
    	-Esquemas DFD y E/R finales (como copia del último refinamiento realizado). El esquema E/R final deberá contar con todos los atributos, participaciones y cardinalidades.

