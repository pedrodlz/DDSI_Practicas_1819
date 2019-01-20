var canciones

function get_canciones() {
	//document.getElementById("demo").innerHTML = "Hello World!";
	var misCabeceras = new Headers();

	var miInit = { method: 'GET',
			   headers: misCabeceras,
			   mode: 'no-cors',
			   cache: 'default' };
	fetch('http://localhost:5000/music_master/api/v1.0/canciones',miInit)
	.then(function(response) {
		return response.json();
	})
	.then(function(myJson) {
		console.log(myJson);
		canciones = myJson['canciones']
		$('#lista_canciones').empty();   
		for( var i = 0; i < canciones.length; i++ )
		{ 
			o = canciones[i];
			var html = '';
			html='<li class="list-group-item">'+o['nombre']+'</li>';
			html='<button type="button" class="list-group-item list-group-item-action justify-content-between align-items-center" onclick="open_modal(\''+o['id']+'\')">'+o['nombre'];
			if (o['escuchada']!=0) {
				html+='<span class="badge badge-primary badge-pill">E</span>'
			}
			
			html+='</button>';
			$('#lista_canciones').append(html);     
		} 
	});
  }

  $('#cargar_canciones').on('click', function (e) {

	get_canciones();

})

function open_modal(id) {
	var cancion;
	for( var i = 0; i < canciones.length; i++ )
		{ 
			if (canciones[i]['id']==id) {
				cancion = canciones[i];
			}     
		} 
	$('#titulo_cancion').text(cancion['nombre']);
	$('#id_cancion').text(cancion['id']);
	$("#stars").attr("data-rating", cancion['valoracion']);
	$('#myModal').modal('toggle')
}

$(function() {
	return $(".starrr").starrr();
  });
  
  $( document ).ready(function() {
		
	$('#stars').on('starrr:change', function(e, value){
	  $('#count').html(value);
	  post_valoracion();
	});
  });


function post_valoracion() {
	var url = 'http://localhost:5000/music_master/api/v1.0/valorar';
	var data = { id: $('#id_cancion').html(), valoracion: $('#count').html() };

	fetch(url, {
		method: 'POST', // or 'PUT'
		body: JSON.stringify(data), // data can be `string` or {object}!
		headers: {
			'Content-Type': 'application/json'
		}
	}).then(res => res.json())
		.catch(error => console.error('Error:', error))
		.then(function(response) {
			console.log('Success:', response)
			if (response['estado']=='20001') {
				alert("No puedes valorar una canción sin escucharla");
			}
			if (response['estado']=='500') {
				alert("Ya has valorado esta canción");
			}
		});
}
