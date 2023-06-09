extends Control

func _on_logging_in_button_up() -> void:
	# Переключаемся на сцену аутентификации
	get_tree().change_scene_to_file("res://Scenes/AuthenticationWindow/authentication_window.tscn")


func _on_continue_as_guest_button_up() -> void:
	# Переходим на сцену выбора категорий (Склад, Продажи, Расходы, Статьи расходов)
	pass # Replace with function body.


func _on_quit_button_up() -> void:
	# ggwp
	get_tree().quit()
