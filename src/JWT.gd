extends Node

# String field
var token: String = ""

# Function to set the token
func set_token(new_token: String) -> void:
	token = new_token

# Function to get the token
func get_token() -> String:
	return token
