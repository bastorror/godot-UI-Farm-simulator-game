extends Button

var is_pressed : bool
var _name : String
var planting_dic : Dictionary
var holding_item : Node
var grid_container_bag : Node
var water_status : TextureRect
var is_planted : bool
var is_watered : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if(button_pressed):
		is_pressed = true
	if !button_pressed and is_pressed:
		#print(get_parent().name)
		#print(holding_item)
		
		#check that plant over field
		if is_planted:
			water_plant()
		
		#check if holding item and water_status node not null
		if holding_item != null and water_status != null:
			
			#check not plant over field and hold dic not empty
			if !is_planted and holding_item.get_hold_item() != {}:
				assign_hold_item_to_field()
		else:
			#if holding_item variable is null then assign holding_item node to variable and etc
			grid_container_bag = get_parent().get_parent().get_parent().get_node("Control_Bag").get_node("Panel_Bag").get_child(0)
			holding_item = get_parent().get_parent().get_parent().get_node("Holding_item")
			water_status = get_parent().get_child(1)
			assign_hold_item_to_field()
		is_pressed = false
	pass

func assign_hold_item_to_field():
	var is_found_item : bool
	
	#check if field not plant yet
	if !is_planted:
		
		# check if hold dic not empty
		if holding_item.get_hold_item() != {}:
			
			# assign hold dic to planting_dic variable
			planting_dic = holding_item.get_hold_item()
			
			#check planting_dic value of "type" key is "seed" 
			if planting_dic.get("type") == "seed":
				
				# assign value in planting_dic to label
				get_parent().get_child(2).text = planting_dic.get("name")
				get_parent().get_child(3).text = str(planting_dic.get("day")) + " " + "days"
				
				# decrease qty in bag dic then visible water icon and mark this field as planted
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
	
	# check if hold node not null
	if holding_item != null:
		
		# check if hold node is hold watering
		if holding_item.get_hold_watering():
			
			# check if field need water and hold item qty is more than 0
			if water_status.visible and (holding_item.get_texture_button_watering().get_current_watering() > 0):
				print("watering")
				
				#decrease water in watering can by 1 then invisiblle water status and mark field as watered
				holding_item.get_texture_button_watering().decrease_curent_watring(1)
				water_status.visible = false
				is_watered = true
				if holding_item.get_texture_button_watering().get_current_watering() <= 0:
					print("out of water...")
					pass
			else:
					print("out of water...")
				
			pass
		pass
