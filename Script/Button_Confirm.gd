extends Button
@onready var v_box_container_list_item = $"../../VBoxContainer_List_Item"
var commit_item : Dictionary
var current_node :Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	for i in v_box_container_list_item.get_child_count():
		current_node = get_node("../../VBoxContainer_List_Item/VBoxContainer_Item"+str(i+1)+"/HBoxContainer_Item_1")
		for j in current_node.get_children():
			
			var name
			var qty
			
			if j is Label:
				if j.name == "Label_item_name":
					name = j.text
					
				if j.name == "Label_item_qty":
					qty = j.text
			if qty != null and name != null and qty != 0:
				commit_item[name] = qty
				print("found")
				#commit_item[j.text] = 
	print(commit_item)
	pass # Replace with function body.
