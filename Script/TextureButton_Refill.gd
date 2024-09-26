extends TextureButton

var initial_modulate : Color = Color(0,0,0)
@onready var texture_button_watering = $"../TextureButton_Watering"



# Called when the node enters the scene tree for the first time.
func _ready():
	initial_modulate = self_modulate
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if texture_button_watering.get_current_watering() <= 0:
		visible = true
	else:
		visible = false	
	pass


func _on_pressed():
	texture_button_watering.set_current_watering(texture_button_watering.get_max_watering())
	pass
	
	#print("open bag")
	

func _on_mouse_entered():
	self_modulate = Color(1,1,1,0.5)
	pass # Replace with function body.



func _on_mouse_exited():
	self_modulate = initial_modulate
	#print("exit")
	pass # Replace with function body.
