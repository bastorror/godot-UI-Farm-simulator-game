extends Button
@onready var v_box_container_list_item = $"../../VBoxContainer_List_Item"
var commit_item : Dictionary = {}
var current_node :Node
var _name : String
var qty : String
@onready var grid_container_bag = $"../../../../Panel_Bag/GridContainer_Bag"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	#get all select item qty to Diction and send it to Bag.gd
	
	#count all child
	for i in v_box_container_list_item.get_child_count():
		
		#access to each child
		current_node = get_node("../../VBoxContainer_List_Item/VBoxContainer_Item"+str(i+1)+"/HBoxContainer_Item_1")
		for j in current_node.get_children():
			
			#check if that child is Label
			if j is Label:
				
				#check child name
				if j.name == "Label_item_name":
					#store item name to _name
					_name = j.text
					
				#check child name
				if j.name == "Label_item_qty":
					
					#store item name to qty	
					qty = j.text
					
		#check if qty or name is not null and qty != 0
		if qty != null and _name != null and qty != "0":
			commit_item[commit_item.size()] = {}
			commit_item[commit_item.size()-1].merge({"name" : _name})
			commit_item[commit_item.size()-1].merge({"qty" : qty})
		get_node("../../VBoxContainer_List_Item/VBoxContainer_Item"+str(i+1)+"/HBoxContainer_Item_1/Label_item_qty").reset_qty_value()
	grid_container_bag.receive_item(commit_item)
	#print("commit size " ,commit_item.size())
	
	commit_item.clear()
	pass # Replace with function body.
