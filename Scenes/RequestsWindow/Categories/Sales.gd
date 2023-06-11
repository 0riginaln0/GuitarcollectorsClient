extends Control


func _on_sales_button_up() -> void:
	var url = ("http://localhost:8080/api/sales/")
	$Request.get_request(url)


func _on_sales_by_id_button_up() -> void:
	var url = ("http://localhost:8080/api/sales/" + $TabContainer/GET/SaleId.text)
	$Request.get_request(url)


func _on_add_sale_button_up() -> void:
	var url = ("http://localhost:8080/api/sales/")
	var json = {
		"quantity": $TabContainer/POST/Quantity.text,
		"warehouse": {
			"id": $TabContainer/POST/ProductId.text
		}
	}
	$Request.post_request(url, str(json))


func _on_add_sale_percentage_discount_button_up() -> void:
	var url = ("http://localhost:8080/api/sales/percentage-discount/" + $TabContainer/POST/PercentageDiscount.text)
	var json = {
		"quantity": $TabContainer/POST/Quantity.text,
		"warehouse": {
			"id": $TabContainer/POST/ProductId.text
		}
	}
	$Request.post_request(url, str(json))


func _on_add_sale_absolute_discount_button_up() -> void:
	var url = ("http://localhost:8080/api/sales/absolute-discount/" + $TabContainer/POST/AbsoluteDiscount.text)
	var json = {
		"quantity": $TabContainer/POST/Quantity.text,
		"warehouse": {
			"id": $TabContainer/POST/ProductId.text
		}
	}
	$Request.post_request(url, str(json))


func _on_update_sale_button_up() -> void:
	var url = ("http://localhost:8080/api/sales/" + $TabContainer/PUT/SaleId.text)
	var json = {
		"quantity": $TabContainer/PUT/Quantity.text,
		"warehouse": {
			"id": $TabContainer/PUT/ProductId.text
		}
	}
	$Request.put_request(url, str(json))


func _on_give_persentage_discount_button_up() -> void:
	var url = ("http://localhost:8080/api/sales/" + $TabContainer/PUT/SaleId.text + "/percentage-discount/" + $TabContainer/PUT/PercentageDiscount.text)
	$Request.put_request(url)


func _on_give_absolute_discount_button_up() -> void:
	var url = ("http://localhost:8080/api/sales/" + $TabContainer/PUT/SaleId.text + "/absolute-discount/" + $TabContainer/PUT/AbsoluteDiscount.text)
	$Request.put_request(url)


func _on_delete_sale_button_up() -> void:
	var url = ("http://localhost:8080/api/sales/" + $TabContainer/DELETE/SaleId.text)
	$Request.delete_request(url)


func _on_button_button_up() -> void:
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
