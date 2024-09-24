extends GridContainer

var timer = Timer.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.wait_time = 3
	timer.one_shot = true
	add_child(timer)
	timer.start()
	print("timers")
	script_to_button_items()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func script_to_button_items():
	for i in get_children():
		for j in i.get_children():
			if j is Button:
				if j.get_script() == null:
					j.set_process(true)
					j.set_script(load("res://Script/Button_Field.gd"))
