extends Control

func _on_all_products_button_up() -> void:
	var url = ("http://localhost:8080/api/warehouse/")
	$Request.get_request(url)

func _on_product_by_id_button_up() -> void:
	var url = ("http://localhost:8080/api/warehouse/" + $"TabContainer/GET/Product id".text)
	$Request.get_request(url)

func _on_products_in_stock_button_up() -> void:
	var url = ("http://localhost:8080/api/warehouse/instock")
	$Request.get_request(url)

func _on_quantity_of_products_button_up() -> void:
	var url = ("http://localhost:8080/api/warehouse/quantity")
	$Request.get_request(url)

func _on_quantity_of_product_button_up() -> void:
	var url = ("http://localhost:8080/api/warehouse/quantity/" + $"TabContainer/GET/Product id".text)
	$Request.get_request(url)

func _on_average_amount_of_all_products_button_up() -> void:
	var url = ("http://localhost:8080/api/warehouse/average")
	$Request.get_request(url)

func _on_by_name_button_up() -> void:
	var url = ("http://localhost:8080/api/warehouse/name/" + $TabContainer/GET/Name.text)
	$Request.get_request(url)

func _on_by_price_from_button_up() -> void:
	var url = ("http://localhost:8080/api/warehouse/from/" + $TabContainer/GET/Price.text)
	$Request.get_request(url)

func _on_by_price_up_to_button_up() -> void:
	var url = ("http://localhost:8080/api/warehouse/upto/" + $TabContainer/GET/Price.text)
	$Request.get_request(url)

func _on_sales_by_product_id_button_up() -> void:
	var url = ("http://localhost:8080/api/warehouse/sales/" + $"TabContainer/GET/Product id".text)
	$Request.get_request(url)

func _on_add_product_button_up() -> void:
	var url = ("http://localhost:8080/api/warehouse/")
	var json = {
		"name": $TabContainer/POST/Name.text,
		"quantity": $TabContainer/POST/Quantity.text,
		"amount": $TabContainer/POST/Amount.text
	}
	$Request.post_request(url, str(json))

func _on_add_repurchased_product_button_up() -> void:
	var url = ("http://localhost:8080/api/warehouse/repurchase/" + $TabContainer/POST/Margin.text)
	var json = {
		"name": $TabContainer/POST/Name.text,
		"quantity": $TabContainer/POST/Quantity.text,
		"amount": $TabContainer/POST/Amount.text
	}
	$Request.post_request(url, str(json))

func _on_update_product_button_up() -> void:
	var url = ("http://localhost:8080/api/warehouse/" + $"TabContainer/PUT/Product id".text)
	var json = {
		"name": $TabContainer/PUT/Name.text,
		"quantity": $TabContainer/PUT/Quantity.text,
		"amount": $TabContainer/PUT/Amount.text
	}
	$Request.put_request(url, str(json))

func _on_delete_product_button_up() -> void:
	var url = ("http://localhost:8080/api/warehouse/" + $"TabContainer/DELETE/Product id".text)
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
