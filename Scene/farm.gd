extends Control
var bag_scene = preload("res://Scene/Control_Bag.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var instance = bag_scene.instantiate()
	instance.visible = false
	add_child(instance)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
