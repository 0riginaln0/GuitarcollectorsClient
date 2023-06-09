extends Control

func _on_warehouse_button_up() -> void:
	get_tree().change_scene_to_file("res://Scenes/CategoriesWindow/WarehouseWindow/WarehouseWindow.tscn")

func _on_sales_button_up() -> void:
	get_tree().change_scene_to_file("res://Scenes/CategoriesWindow/SalesWindow/SalesWindow.tscn")

func _on_charges_button_up() -> void:
	get_tree().change_scene_to_file("res://Scenes/CategoriesWindow/ChargesWindow/ChargesWindow.tscn")

func _on_expense_items_button_up() -> void:
	get_tree().change_scene_to_file("res://Scenes/CategoriesWindow/ExpenseItemsWindow/ExpenseItemsWindow.tscn")
