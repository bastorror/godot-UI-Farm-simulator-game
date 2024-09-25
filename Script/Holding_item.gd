extends Node
var hold_item : Dictionary
@onready var control_bag = $"../Control_Bag"

func set_hold_item(select_item : Dictionary):
	hold_item = select_item
	print("from holding_item", hold_item)
	
	#check hold_item type
	if hold_item.get("type") == "seed":
		control_bag.visible = false;
		
		print("You hold : ", hold_item.get("name"))
		pass
	pass

func get_hold_item():
	return hold_item
	
