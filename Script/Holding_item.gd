extends Node
var hold_item : Dictionary
@onready var control_bag = $"../Control_Bag"
@onready var texture_button_watering = $"../VBoxContainer_Watring/TextureButton_Watering"
var is_hold_watering = false

func set_hold_item(select_item : Dictionary):
	hold_item = select_item
	#print("from holding_item", hold_item)
	
	#check hold_item type
	if hold_item.get("type") == "seed":
		control_bag.visible = false;
			
		print("You hold : ", hold_item.get("name"))
		pass
	pass

func get_hold_item():
	return hold_item

func set_hold_watering():
	is_hold_watering = true
	hold_item.clear()

func get_hold_watering():
	return is_hold_watering

func clear_hold_watering():
	is_hold_watering = false

func get_texture_button_watering():
	return texture_button_watering
