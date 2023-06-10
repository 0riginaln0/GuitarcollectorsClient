extends Control

func _on_warehouse_button_up() -> void:
	#get_tree().change_scene_to_file("")
	pass

func _on_sales_button_up() -> void:
	#get_tree().change_scene_to_file("")
	pass # Replace with function body.

func _on_expense_items_button_up() -> void:
	get_tree().change_scene_to_file("res://Scenes/RequestsWindow/Categories/ExpenseItems.tscn")
	pass # Replace with function body.

func _on_charges_button_up() -> void:
	get_tree().change_scene_to_file("res://Scenes/RequestsWindow/Categories/charges.tscn")
	pass # Replace with function body.


func _on_back_button_up() -> void:
	get_tree().change_scene_to_file("res://Scenes/StartWindow/StartWindow.tscn")
