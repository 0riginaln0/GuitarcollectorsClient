extends Control

func _on_all_expense_items_button_up() -> void:
	var url = ("http://localhost:8080/api/expense-items/")
	$RequestPerformer.get_request(url)

func _on_expense_item_by_id_button_up() -> void:
	var url = ("http://localhost:8080/api/expense-items/" + $TabContainer/GET/IDInput.text)
	$RequestPerformer.get_request(url)

func _on_charges_by_expense_item_id_button_up() -> void:
	var url = ("http://localhost:8080/api/expense-items/charges/" + $TabContainer/GET/IDInput.text)
	$RequestPerformer.get_request(url)


func _on_add_expense_item_button_up() -> void:
	var url = "http://localhost:8080/api/expense-items/"
	var json = {
		"name": $TabContainer/POST/Name.text
	}
	$RequestPerformer.post_request(url, str(json))
	
func _on_update_expense_item_button_up() -> void:
	var url = "http://localhost:8080/api/expense-items/" + $TabContainer/PUT/ID.text
	var json = {
		"name": $TabContainer/PUT/Name.text
	}
	$RequestPerformer.put_request(url, str(json))

func _on_delete_expense_item_button_up() -> void:
	var url = "http://localhost:8080/api/expense-items/" + $TabContainer/DELETE/ID.text
	$RequestPerformer.delete_request(url)

func _on_back_button_up() -> void:
	get_tree().change_scene_to_file("res://Scenes/RequestsWindow/ChooseCategory.tscn")


func _on_request_performer_response_ready() -> void:
	$RichTextLabel.text = format_json(Response.get_response())

func format_json(json_string: String) -> String:
	var formatted_string: String = ""
	var indent_level: int = 0
	var in_quotes: bool = false
	
	for i in range(json_string.length()):
		var ch: String = json_string.substr(i, 1)
		if ch == '"' and json_string.substr(i - 1, 1) != '\\':
			in_quotes = not in_quotes
		if not in_quotes:
			if ch == '{' or ch == "[":
				formatted_string += ch + '\n' + '\t'.repeat(indent_level + 1)
				indent_level += 1
			elif ch == '}' or ch ==']':
				indent_level -= 1
				formatted_string += '\n' + '\t'.repeat(indent_level) + ch
			elif ch == ',':
				formatted_string += ',' + '\n' + '\t'.repeat(indent_level)
			else:
				formatted_string += ch
		else :
			formatted_string += ch
	return formatted_string
