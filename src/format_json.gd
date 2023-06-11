extends Node


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
