extends TextureButton

var initial_modulate : Color = Color(0,0,0)
@onready var panel_bag = $Panel_Bag


# Called when the node enters the scene tree for the first time.
func _ready():
	initial_modulate = self_modulate
	for _i in self.get_children():
		_i.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	var control_bag = get_parent().get_node("Control_Bag")
	if control_bag != null:
		if !control_bag.visible:
			control_bag.visible = true
		else:
			control_bag.visible = false
	else:
		pass
	
	#print("open bag")
	

func _on_mouse_entered():
	self_modulate = Color(1,1,1,0.5)
	pass # Replace with function body.



func _on_mouse_exited():
	self_modulate = initial_modulate
	#print("exit")
	pass # Replace with function body.
