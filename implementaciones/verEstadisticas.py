#!/usr/bin/python
# -*- coding: utf-8 -*-

import os
import cx_Oracle

def menu():
	print( "Selecciona:" )
	print( "\t1 - Ver las estadísticas de una canción." )
	print( "\t0 - Salir." )

def mostrar_estadisticas( info_cancion ):
	for row in info_cancion:
		print "Nombre de la canción: " + row[0]
		print "Número de reproducciones: " + row[1]
		print "Valoración media: " + row[2]
	print "----------------------------------------------"

conn_str = 'USUARIO/PASSWORD@HOSTNAME:PORT/SERVICENAME'
conn = cx_Oracle.connect( conn_str )

hoy   = '17/09/2017'  # Hipotética fecha actual
c     = conn.cursor( )

while True:
	menu( )

	opcionMenu = str( input( "Selecciona una opción: " ) )

	if opcionMenu == '1': # Ver estadisticas de una canción

		# Primero mostramos una lista con los nombres de todas las canciones
		c.execute( "SELECT nombre_cancion, num_repro, valoracion FROM cancion" )
		lista_canciones = c.fetchall( )
		contador = 1

		for cancion in lista_canciones
			print contador + " - " + cancion[0]
			contador += 1

		# El usuario selecciona una canción
		opcionMenu = str( input( "Selecciona una canción: " ) )
		num_cancion = int( opcionMenu ) - 1

		# Mostramos las estadísticas de dicha canción
		mostrar_estadisticas( lista_canciones[num_cancion] )

	if opcionMenu == '0' # Salir
		conn.close( )
		break
		

		
		

	
