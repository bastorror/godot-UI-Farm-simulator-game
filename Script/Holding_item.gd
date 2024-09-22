extends Node
var hold_item : Dictionary

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_hold_item(select_item : Dictionary):
	hold_item = select_item
	print("from holding_item", hold_item)
	pass
	
