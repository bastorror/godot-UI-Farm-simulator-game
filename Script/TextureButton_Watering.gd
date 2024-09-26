extends TextureButton

var initial_modulate : Color = Color(0,0,0)
var is_holded_watering = false

@export var max_watering = 3
@export var current_watering = 3

@onready var watering_can_hold = $"../../Watering-can_hold"
@onready var holding_item = $"../../Holding_item"
@onready var label_watering = $"../Label_Watering"

# Called when the node enters the scene tree for the first time.
func _ready():
	initial_modulate = self_modulate
	display_label_watering()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_holded_watering:
		icon_at_mouse()
	pass


func _on_pressed():
	#check if watering icon not null and holding node not null
	if watering_can_hold != null and holding_item != null:
		
		#check if current not holding watering  
		if !is_holded_watering :
			is_holded_watering = true
			holding_item.set_hold_watering()
		else:
			clear_icon_at_mouse()

	else:
		#if one of them null assign value to it then call set_hold_watering function
		watering_can_hold = $"../../Watering-can_hold"
		holding_item = $"../../Holding_item"
		is_holded_watering = true
		holding_item.set_hold_watering()		
	pass

func _on_mouse_entered():
	self_modulate = Color(1,1,1,0.5)
	pass # Replace with function body.



func _on_mouse_exited():
	self_modulate = initial_modulate
	#print("exit")
	pass # Replace with function body.

func icon_at_mouse():
	
	#this function make watering icon at mouse
	var currentMousePos = get_global_mouse_position()
	var offsetVector = Vector2(30, 10)
	var finalTexturePos = currentMousePos + offsetVector
	watering_can_hold.set_position(finalTexturePos)
	watering_can_hold.visible = true

func clear_icon_at_mouse():
	
	#clear watering icon from mouse
	watering_can_hold.visible = false
	is_holded_watering = false
	holding_item.clear_hold_watering()
	is_holded_watering = false
	
func display_label_watering():
	label_watering.text = str(current_watering) + "/" + str(max_watering)
	
func decrease_curent_watring(value : int):
	current_watering -= value
	display_label_watering()

func get_current_watering():
	return current_watering

func get_holding_watering():
	return is_holded_watering

func get_label_watering():
	return label_watering

func get_max_watering():
	return max_watering

func set_current_watering(value : int):
	current_watering = value
	display_label_watering()
