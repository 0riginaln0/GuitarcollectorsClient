extends Control

func _on_log_in_button_up() -> void:
	# Составляем dictionary (словарь) email, password
	var data_to_send = {
		"email": $MarginContainer/VBoxContainer/email.text,
		"password": $MarginContainer/VBoxContainer/password.text
	}
	# url по которому будет выполняться request
	var url := "http://localhost:8080/api/auth/authenticate"
	# Делаем json из словаря
	var json = JSON.stringify(data_to_send, "\t")
	# Подготавливаем заголовок
	var headers = ["Content-Type: application/json"]
	# Отправляем request
	$HTTPRequest.request(url, headers, HTTPClient.METHOD_POST, json)


func _on_http_request_request_completed(_result: int, response_code: int, _headers: PackedStringArray, body: PackedByteArray) -> void:
	if response_code != 200:
		print("Вы что-то не так ввели, попробуйте ещё раз")
		return
	# Достаём body в виде json
	var json = body.get_string_from_utf8()
	# Парсим его в dictionary
	var parsed_data = JSON.parse_string(json)
	# Кладём полученный токен в память
	Jwt.set_token(str(parsed_data.token))
	print(str(parsed_data.token))
	# Переходим на сцену отправки запросов (Склад, Продажи, Расходы, Статьи расходов)
	get_tree().change_scene_to_file("res://Scenes/RequestsWindow/RequestsWindow.tscn")


func _on_back_button_up() -> void:
	get_tree().change_scene_to_file("res://Scenes/StartWindow/StartWindow.tscn")
