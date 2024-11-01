extends CanvasLayer

signal shown
signal hidden

@onready var button_continue: Button = $Control/VBoxContainer/button_continue
@onready var button_exit: Button = $Control/VBoxContainer/button_exit
@onready var item_description: Label = $Control/ItemDescription



var is_paused : bool = false



func _ready() -> void:
	hide_pause_menu()
	pass



func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		if is_paused == false:
			show_pause_menu()
		else:
			hide_pause_menu()
		get_viewport().set_input_as_handled()


func show_pause_menu() -> void:
	get_tree().paused = true
	visible = true
	is_paused = true
	shown.emit()

func hide_pause_menu() -> void:
	get_tree().paused = false
	visible = false
	is_paused = false
	hidden.emit()

func _on_button_continue_pressed() -> void:
	if is_paused == false:
		return
	hide_pause_menu()
	pass

func _on_button_exit_pressed() -> void:
	if is_paused == false:
		return
	get_tree().quit()
	pass


func update_item_description( new_text : String ) -> void:
	item_description.text = new_text
