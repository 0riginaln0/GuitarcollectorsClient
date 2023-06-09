extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func authenticate(email: String, password: String):
	#do post request to "http://localhost:8080/api/auth/authenticate"
	#save JWT
	var data_to_send = {
		"email": email,
		"password": password
	}
	var url := "http://localhost:8080/api/auth/authenticate"
	var json = JSON.stringify(data_to_send, "\t")
	var headers = ["Content-Type: application/json"]
	$HTTPRequest.request(url, headers, HTTPClient.METHOD_POST, json)
	print("Хорошо")
	Jwt.set_token("")
	# Если всё хорошо, переключаемся на сцену выбора категории
	pass

func _on_log_in_button_up() -> void:
	var email: String = $MarginContainer/VBoxContainer/email.text
	var password: String = $MarginContainer/VBoxContainer/password.text
	authenticate(email, password)
	pass # Replace with function body.


func _on_http_request_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	var json = body.get_string_from_utf8()
	var parsed_data = JSON.parse_string(json)
	print(parsed_data)
