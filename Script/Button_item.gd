extends Button
var _name : String
var qty : int
var days : int
var energy : int

var Select_item : Dictionary

var is_pressed : bool

var hold_node : Node
# Called when the node enters the scene tree for the first time.
func _ready():
	if get_parent().get_parent().get_parent().get_parent().get_parent() != null:
		hold_node = get_parent().get_parent().get_parent().get_parent().get_parent().get_node("Holding_item")
		
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(button_pressed):
		is_pressed = true
	if !button_pressed and is_pressed:
		#print(get_parent().name)
		_name = get_parent().get_child(1).text
		if(_name == "Flower"):
			Select_item = {
				"name" : "Flower",
				"day" : 9,
			}
			pass
		hold_node.set_hold_item(get_select_item())
		is_pressed = false
		pass

func get_select_item():
	print("from button_item : " ,Select_item)
	return Select_item
