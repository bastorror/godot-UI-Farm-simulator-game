extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	var my_dict = {
		"Godot" : {"A" : 1, "B" : 2},
		210 : null,
	}
	print(my_dict)
	print(my_dict["Godot"]["B"])
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
