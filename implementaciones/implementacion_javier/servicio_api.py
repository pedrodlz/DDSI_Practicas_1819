#!flask/bin/python
from flask import Flask, jsonify, request

import cx_Oracle
import datetime
# Conexión a la BD
conn_str = 'USUARIO/PASSWORD@HOSTNAME:PORT/SERVICENAME'
conn_str = 'x7151952/x7151952@oracle0.ugr.es:1521/practbd.oracle0.ugr.es'
conn = cx_Oracle.connect(conn_str)

my_id = 'UN000003' # Hipotético usuario logueado en el sistema
hoy = '17/09/2017' # Hipotécica fecha actual
hoy = datetime.date.today().strftime("%d/%m/%Y")

c = conn.cursor()

app = Flask(__name__,static_url_path='', static_folder='')

canciones = [
	{
		'id':'ID',
		'nombre': 'Hola',
		'valoracion': 5,
		'escuchada': 0
	}
]

@app.route('/')
def root():
	return app.send_static_file('index.html')

@app.route('/music_master/api/v1.0/canciones', methods=['GET'])
def get_canciones():
	c.execute("SELECT id_cancion, nombre_cancion, valoracion FROM cancion")
	query_canciones = c.fetchall()
	canciones = []
	for cancion in query_canciones:
		d = {}
		d['id'] = cancion[0]
		d['nombre'] = cancion[1]
		d['valoracion'] = str(int(int(cancion[2])/2))
		consulta = "SELECT count(*) FROM escucha WHERE \
		(id_cancion = '"+ cancion[0]+ "' and id_usuario = '"+my_id+"')"
		print(consulta)
		c.execute(consulta)
		cuenta = c.fetchall()
		print(cuenta)
		d['escuchada'] = int(cuenta[0][0])
		canciones.append(d)
	print(canciones)
	return jsonify({'canciones': canciones})


# Mando por POST un objeto en un json [id]
@app.route('/music_master/api/v1.0/escuchar', methods=['POST'])
def escuchar_cancion():
	if not request.json or not 'id' in request.json:
		abort(400)
	id = request.json['id']
	estado=True
	try:
		consulta = "INSERT INTO escucha(id_usuario, id_cancion, fecha) \
		values('"+my_id+"', '"+id+"', to_date('"+hoy+"','DD/MM/YYYY'))"
		c.execute(consulta)
	except cx_Oracle.DatabaseError as e:
		error, = e.args
		estado = False

	return jsonify({'resuelto': estado})

# Mando por POST dos objetos en un json [id, valoracion]
@app.route('/music_master/api/v1.0/valorar', methods=['POST'])
def valorar_cancion():
	id = request.json['id']
	valoracion = request.json['valoracion']
	estado=200
	try:
		consulta = "INSERT INTO valora(id_usuario, id_cancion, puntuacion)\
		 values('"+my_id+"', '"+id+"', "+str(int(valoracion)*2.0)+")"
		c.execute(consulta)
		conn.commit()
	except cx_Oracle.DatabaseError as e:
		error, = e.args
		if error.code == 20001:
			estado = 20001
		else:
			estado = 500
		print(error)
		

	return jsonify({'estado': estado})

if __name__ == '__main__':
	app.run(debug=True)
	c.execute("SELECT * FROM cancion")
	canciones_prueba = c.fetchall()
	print(canciones_prueba)
	conn.close()