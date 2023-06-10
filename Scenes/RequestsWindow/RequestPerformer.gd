extends Node

signal response_ready

func get_request(url: String):
	$HTTPRequest.request(url)

func _on_http_request_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	if response_code != 200:
		print("Вы что-то не так ввели, попробуйте ещё раз")
		return
	# Достаём body в виде json
	var json = body.get_string_from_utf8()
	# Парсим его в dictionary
	var parsed_data = JSON.parse_string(json)
	print(parsed_data)
	Response.set_response(str(parsed_data))
	emit_signal("response_ready")
