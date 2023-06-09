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
	Jwt.set_token("")
	print("Зоебис")
	# Если всё хорошо, переключаемся на сцену выбора категории
	pass

func _on_log_in_button_up() -> void:
	var email: String = $MarginContainer/VBoxContainer/email.text
	var password: String = $MarginContainer/VBoxContainer/password.text
	authenticate(email, password)
	pass # Replace with function body.
