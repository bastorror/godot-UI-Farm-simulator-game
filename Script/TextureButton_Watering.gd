extends TextureButton

var initial_modulate : Color = Color(0,0,0)
var is_holded_watering = false
@onready var watering_can_hold = $"../../Watering-can_hold"
@onready var holding_item = $"../../Holding_item"

# Called when the node enters the scene tree for the first time.
func _ready():
	initial_modulate = self_modulate
	for _i in self.get_children():
		_i.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_holded_watering:
		icon_at_mouse()
	pass


func _on_pressed():
	
	if watering_can_hold != null and holding_item != null:
		if !is_holded_watering:
			is_holded_watering = true
			holding_item.set_hold_watering()
		else:
			clear_icon_at_mouse()
			holding_item.clear_hold_watering()
			is_holded_watering = false

	else:
		watering_can_hold = $"../../Watering-can_hold"
		holding_item = $"../../Holding_item"
		is_holded_watering = true
	
	pass

func _on_mouse_entered():
	self_modulate = Color(1,1,1,0.5)
	pass # Replace with function body.



func _on_mouse_exited():
	self_modulate = initial_modulate
	#print("exit")
	pass # Replace with function body.

func icon_at_mouse():
	var currentMousePos = get_global_mouse_position()
	var offsetVector = Vector2(30, 10)
	var finalTexturePos = currentMousePos + offsetVector
	watering_can_hold.set_position(finalTexturePos)
	watering_can_hold.visible = true

func clear_icon_at_mouse():
	print(watering_can_hold)
	watering_can_hold.visible = false
	is_holded_watering = false

func get_holding_watering():
	return is_holded_watering

