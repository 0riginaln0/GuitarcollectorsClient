extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func _on_all_expense_items_button_up() -> void:
	var url = ("http://localhost:8080/api/expense-items/")
	$RequestPerformer.get_request(url)
	print("in expense item")
	#$RichTextLabel.text = GetRequest.response

func _on_expense_item_by_id_button_up() -> void:
	pass # Replace with function body.


func _on_back_button_up() -> void:
	get_tree().change_scene_to_file("res://Scenes/StartWindow/StartWindow.tscn")


func _on_request_performer_response_ready() -> void:
	$RichTextLabel.text = format_json(Response.get_response())

func format_json(json_string: String) -> String:
	var formatted_string: String = ""
	var indent_level: int = 0
	var in_quotes: bool = false
	
	for i in range(json_string.length()):
		var char: String = json_string.substr(i, 1)
		if char == '"' and json_string.substr(i - 1, 1) != '\\':
			in_quotes = not in_quotes
		if not in_quotes:
			if char == '{' or char == "[":
				formatted_string += char + '\n' + '\t'.repeat(indent_level + 1)
				indent_level += 1
			elif char == '}' or char ==']':
				indent_level -= 1
				formatted_string += '\n' + '\t'.repeat(indent_level) + char
			elif char == ',':
				formatted_string += ',' + '\n' + '\t'.repeat(indent_level)
			else:
				formatted_string += char
		else :
			formatted_string += char
	return formatted_string
