#!/usr/bin/python
# -*- coding: utf-8 -*-
import os
import cx_Oracle


def menu():
	print ("Opciones disponibles:")
	print ("\t1 - Ver que han escuchado mis amigos hoy.")
	print ("\t0 - Salir")

def mostrar_info_amigo(info_amigo):
	for row in info_amigo:
		print "Usuario: " + row[0]
		print "Nombre: " + row[1] + " " + row[2]
	print "-----------------------------------------"

###########################################################

conn_str = 'USUARIO/PASSWORD@HOSTNAME:PORT/SERVICENAME'
conn = cx_Oracle.connect(conn_str)

my_id = 'UN000002' # Hipotético usuario logueado en el sistema
hoy = '17/09/2017' # Hipotécica fecha actual

c = conn.cursor()

while True:
	menu()

	opcionMenu = str(input("Selecciona una acción: "))

	if opcionMenu == '1':
	#Listamos los amigos
		c.execute("SELECT id_usuario2 FROM amigo 
						      WHERE id_usuario1 = '%s'" % (my_id))
		id_amigos = c.fetchall()
		
		contador = 1
		info_amigo = []
		#MOSTRAR LISTA DE AMIGOS
		print "-----------------------------------------"
		for ID in id_amigos: 
			c.execute("SELECT nombre_usuario, nombre_per, apellidos_per 
			              FROM usuario WHERE id_usuario = '%s'" % (ID))
			info_amigo = c.fetchall()
			print "Amigo " + str(contador)
			mostrar_info_amigo(info_amigo)
			contador += 1

		opcionMenu = str(input("Selecciona un amigo: "))
		num_usuario = int(opcionMenu)-1

		#RECUPERAR ID AMIGO SELECCIONADO
		c.execute("SELECT id_usuario2 FROM amigo 
		               WHERE id_usuario1 = '%s'" % (my_id))
		id_amigos = c.fetchall()
		amigo = id_amigos[num_usuario]

		#Recuperamos nombre de amigo
		c.execute("SELECT nombre_usuario FROM usuario 
		               WHERE id_usuario = '%s'" % (amigo[0]))
		nombre_amigo = c.fetchone()
		
		#Consultamos las canciones escuchadas hoy por el amigo 
		#seleccionado
		c.execute("SELECT * FROM escucha WHERE id_usuario = '%s' 
				and fecha = to_date('%s','DD/MM/YYYY')" % (amigo[0], hoy))
		canciones = c.fetchall()


		#Mostramos lista de canciones escuchadas por el amigo 
		#seleccionado
		print "\n-----------------------------------------"				
		print "Lista de canciones escuchadas hoy por %s:" 
		                                              % (nombre_amigo)
		for cancion in canciones:
			c.execute("SELECT nombre_cancion FROM cancion 
			          WHERE id_cancion = '%s'" % (cancion[1]))
			nombre_cancion = c.fetchone()[0]
			print "- " + nombre_cancion

		print "\n\n"
	

	if opcionMenu == '0':
		conn.close()
		break