extends Button

var is_pressed : bool
var _name : String
var planting_dic : Dictionary
var holding_item : Node
var grid_container_bag : Node
var water_status : TextureRect
var is_planted : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if(button_pressed):
		is_pressed = true
	if !button_pressed and is_pressed:
		print(get_parent().name)
		print(holding_item)
		
		water_plant()
		
		if holding_item != null and water_status != null:
			if !is_planted and holding_item.get_hold_item() != {}:
				assign_hold_item_to_field()
		else:
			#if holding_item variable is null then assign holding_item node to variable
			print("assign hold node")
			grid_container_bag = get_parent().get_parent().get_parent().get_node("Control_Bag").get_node("Panel_Bag").get_child(0)
			holding_item = get_parent().get_parent().get_parent().get_node("Holding_item")
			water_status = get_parent().get_child(1)
			assign_hold_item_to_field()
		is_pressed = false
	pass

func assign_hold_item_to_field():
	var is_found_item : bool
	if !is_planted:
		if holding_item.get_hold_item() != null:
			planting_dic = holding_item.get_hold_item()
			print("this is pland dic : ",planting_dic)
			if planting_dic.get("type") == "seed":
				get_parent().get_child(2).text = planting_dic.get("name")
				get_parent().get_child(3).text = str(planting_dic.get("day")) + " " + "days"
				#print(grid_container_bag.get_bag_dic())
				grid_container_bag.decrease_item_qty_bag_dic(planting_dic.get("name"))
				water_status.visible = true	
				is_planted = true
				
				#check if hold item is empty clear hold item
				for i in grid_container_bag.get_bag_dic().size():
					if grid_container_bag.get_bag_dic().get(i) != null:
						if grid_container_bag.get_bag_dic().get(i).get("name") == planting_dic.get("name"):
							is_found_item = true
							break
				if !is_found_item :
					planting_dic.clear()

func water_plant():
	if holding_item != null:
		if holding_item.get_hold_watering():
			if water_status.visible:
				water_status.visible = false
				pass
			
			pass
		pass
