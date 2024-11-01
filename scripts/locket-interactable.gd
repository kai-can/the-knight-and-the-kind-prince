@tool
class_name LocketInteractable extends Node2D

@export var item_data : ItemData : set = _set_item_data
@export var quantity : int = 1 : set = _set_quantity

var is_open: bool = false

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D
@onready var interact_area: Area2D = $Area2D

func _ready() -> void:
	
	if Engine.is_editor_hint():
		return
	interact_area.area_entered.connect( _on_area_enter )
	interact_area.area_exited.connect( _on_area_exit )
	animation_player.play( "default" )
	pass

func player_interact() -> void:
	if is_open == true:
		return
	is_open = true
	if item_data and quantity > 0:
		PlayerManager.INVENTORY_DATA.add_item( item_data, quantity )
		visible = false
		queue_free()
	else:
		printerr("No Items in Chest!")
		push_error( "No items in chest", name)
	pass


func _on_area_enter( _a : Area2D ) -> void:
	PlayerManager.interact_pressed.connect( player_interact )
	pass

func _on_area_exit( _a : Area2D ) -> void:
	PlayerManager.interact_pressed.disconnect( player_interact )
	pass


func _set_item_data( value : ItemData ) -> void:
	item_data = value
	pass


func _set_quantity( value : int ) -> void:
	quantity = value
	pass
