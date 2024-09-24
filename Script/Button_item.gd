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
	check_hold_node()
		
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(button_pressed):
		is_pressed = true
	if !button_pressed and is_pressed:
		#print(get_parent().name)
		check_hold_node()		
		_name = get_parent().get_child(1).text
		if(_name == "Flower"):
			Select_item = {
				"name" : "Flower",
				"day" : 9,
				"type" : "seed"
			}
		elif(_name == "Beans"):
			Select_item = {
				"name" : "Beans",
				"day" : 12,
				"type" : "seed"
			} 
		elif(_name == "Holy Basil"):
			Select_item = {
				"name" : "Holy Basil",
				"day" : 5,
				"type" : "seed"
			}
		elif(_name == "Cabbage"):
			Select_item = {
				"name" : "Cabbage",
				"day" : 15,
				"type" : "seed"
			}
		if hold_node != null:
			print("hold")
			hold_node.set_hold_item(get_select_item())
		is_pressed = false
		pass

func get_select_item():
	print("from button_item : " ,Select_item)
	return Select_item

func check_hold_node():
	if get_parent().get_parent().get_parent().get_parent().get_parent() != null:
		hold_node = get_parent().get_parent().get_parent().get_parent().get_parent().get_node("Holding_item")
