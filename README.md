# Sistema de Información para la gestión y escucha de canciones

Creamos un sistema que gestione canciones desde el punto de vista de los usuarios y de los artistas

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
	
## Requisitos de datos
- RD1. Datos de una cancion
	- Identificador
	- Titulo
	- Genero
	- Album al que pertenece
	- Año
	- Duracion
	- Artista
	- Numero de reproducciones
	
- RD2. Datos de un album
	- Identificador
	- Titulo
	- Canciones que lo componen
	- Genero
	- Año
	- Artista
	
- RD3. Datos de una lista
	- Identificador
	- Nombre
	- Usuario al que pertenece
	- Canciones que la componen
	- Fecha de creacion
	- Seguidores


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
