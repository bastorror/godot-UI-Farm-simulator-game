extends Node
var hold_item : Dictionary
@onready var control_bag = $"../Control_Bag"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_hold_item(select_item : Dictionary):
	hold_item = select_item
	print("from holding_item", hold_item)
	if hold_item.get("type") == "seed":
		control_bag.visible = false;
		print("You hold : ", hold_item.get("name"))
		pass
	pass
	
