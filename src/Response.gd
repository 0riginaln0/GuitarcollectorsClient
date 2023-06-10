extends Node

# String field
var response: String = ""

# Function to set the response
func set_response(_response: String) -> void:
	response = _response

# Function to get the response
func get_response() -> String:
	return response
