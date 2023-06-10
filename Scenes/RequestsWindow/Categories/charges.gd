extends Control

func _on_show_all_charges_button_up() -> void:
	var url = ("http://localhost:8080/api/charges/")
	$Request.get_request(url)


func _on_show_charge_by_id_button_up() -> void:
	var url = ("http://localhost:8080/api/charges/" + $TabContainer/GET/ChargeId.text)
	$Request.get_request(url)


func _on_add_charge_button_up() -> void:
	var url = "http://localhost:8080/api/charges/"
	var json = {
		"amount": $TabContainer/POST/Amount.text,
		"expenseItem": {
			"id": $TabContainer/POST/ExpenseItemId.text
		}
	}
	$Request.post_request(url, str(json))


func _on_update_charge_button_up() -> void:
	var url = "http://localhost:8080/api/charges/" + $TabContainer/PUT/ChargeId.text
	var json = {
		"amount": $TabContainer/PUT/Amount.text,
		"expenseItem": {
			"id": $TabContainer/PUT/ExpenseItemId.text
		}
	}
	$Request.put_request(url, str(json))


func _on_delete_charge_button_up() -> void:
	var url = "http://localhost:8080/api/charges/" + $TabContainer/DELETE/ChargeId.text
	$Request.delete_request(url)


func _on_back_button_up() -> void:
	get_tree().change_scene_to_file("res://Scenes/RequestsWindow/ChooseCategory.tscn")


func _on_request_response_ready() -> void:
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
