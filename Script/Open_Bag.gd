extends TextureButton

var initial_modulate : Color = Color(0,0,0)
@onready var panel_bag = $Panel_Bag

# Called when the node enters the scene tree for the first time.
func _ready():
	initial_modulate = self_modulate
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	print("open bag")
	if !panel_bag.visible:
		panel_bag.visible = true
		print("visible")
	else:
		panel_bag.visible = false
	pass # Replace with function body.

func _on_mouse_entered():
	self_modulate = Color(1,1,1,0.5)
	pass # Replace with function body.



func _on_mouse_exited():
	self_modulate = initial_modulate
	print("exit")
	pass # Replace with function body.
