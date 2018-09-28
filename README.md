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
	
## Requisitos de datos
    • RD3. Datos de una lista:
        ◦ Identificador
        ◦ Nombre
        ◦ Usuario al que pertenece
        ◦ Canciones que la componen
        ◦ Fecha de creación
        ◦ Seguidores
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
El documento debe tener formato pdf e incluir:

   - Portada.
   - Índice.
   - Descripción completa del problema de gestión de información que resolverá el sistema de información propuesto.
   - Análisis de requisitos extraídos de la descripción completa, proporcionando:
       - Requisitos de datos.
       - Requisitos funcionales.
       - Restricciones semánticas.
       - Validación cruzada de requisitos.

El sistema de información propuesto debe garantizar lo siguiente:

   - Los requisitos deben poder agruparse en cuatro áreas funcionales.
   - Cada área funcional debe tener al menos cuatro requisitos funcionales.
   - Las funciones básicas (altas, bajas y modificaciones de datos básicos) no deben realizarse en más de un área funcional (por ejemplo, un alta de datos básicos solamente aparecerá en un área funcional y no se podrán proponer altas de datos básicos en más áreas funcionales).
