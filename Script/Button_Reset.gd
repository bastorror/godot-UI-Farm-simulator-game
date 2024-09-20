extends Button

@onready var v_box_container_list_item = $"../../VBoxContainer_List_Item"

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	reset_all_value()
		
	pass # Replace with function body.

func reset_all_value():
	for i in v_box_container_list_item.get_child_count():
		get_node("../../VBoxContainer_List_Item/VBoxContainer_Item"+str(i+1)+"/HBoxContainer_Item_1/Label_item_qty").reset_qty_value()
