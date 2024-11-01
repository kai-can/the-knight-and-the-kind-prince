extends Node


var current_save : Dictionary = {
	scene_path = "",
	player = {
		pos_x = 0,
		pos_y = 0
	},
	items = [],
	persistence = [],
	quests = [],
}


func add_persistent_value( value : String ) -> void:
	if check_persistent_value( value ) == false:
		current_save.persistence.append( value )
	pass

func check_persistent_value( value : String ) -> bool:
	var p = current_save.persistence as Array
	return p.has( value )
