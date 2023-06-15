extends Control

func _on_logging_in_button_up() -> void:
	# Переключаемся на сцену аутентификации
	get_tree().change_scene_to_file("res://Scenes/AuthenticationWindow/AuthenticationWindow.tscn")


func _on_continue_as_guest_button_up() -> void:
	# Переходим на сцену выбора категорий (Склад, Продажи, Расходы, Статьи расходов)
	Jwt.set_token("")
	get_tree().change_scene_to_file("res://Scenes/RequestsWindow/ChooseCategory.tscn")


func _on_quit_button_up() -> void:
	# ggwp
	get_tree().quit()
