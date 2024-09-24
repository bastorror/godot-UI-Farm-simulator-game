extends Button

var is_pressed : bool
var _name : String
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(button_pressed):
		is_pressed = true
	if !button_pressed and is_pressed:
		print(get_parent().name)
		_name = get_parent().get_child(2).text
		is_pressed = false
	pass
	


