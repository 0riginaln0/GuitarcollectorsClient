extends Node

signal response_ready

func get_request(url: String):
	$HTTPRequest.request(url)
	
func post_request(url: String, json: String):
	var headers: PackedStringArray = ["Authorization: Bearer " + Jwt.get_token(), "Content-Type: application/json"]
	$HTTPRequest.request(url, headers, HTTPClient.METHOD_POST, json)
	
func put_request(url: String, json: String = "no json") -> void:
	if json != "no json":
		var headers: PackedStringArray = ["Authorization: Bearer " + Jwt.get_token(), "Content-Type: application/json"]
		$HTTPRequest.request(url, headers, HTTPClient.METHOD_PUT, json)
	else:
		var headers: PackedStringArray = ["Authorization: Bearer " + Jwt.get_token(), "Content-Length: 0"]
		$HTTPRequest.request(url, headers, HTTPClient.METHOD_PUT, "")
		

func delete_request(url: String):
	var headers: PackedStringArray = ["Authorization: Bearer " + Jwt.get_token()]
	$HTTPRequest.request(url, headers, HTTPClient.METHOD_DELETE)

func _on_http_request_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	if response_code != 200 and response_code != 201:
		# Ошибка. Заносим её в response
		Response.set_response(body.get_string_from_utf8())
		emit_signal("response_ready")
		return
	# Достаём body в виде json
	var json = body.get_string_from_utf8()
	# Парсим его в dictionary
	var parsed_data = JSON.parse_string(json)
	# Потому что JSON.parse_string возвращает null, когда парс не удался. А парс не удаётся когда в body уже лежит строка
	if parsed_data == null:
		print(json)
		Response.set_response(json)
		emit_signal("response_ready")
	else:
		print(parsed_data)
		Response.set_response(str(parsed_data))
		emit_signal("response_ready")
