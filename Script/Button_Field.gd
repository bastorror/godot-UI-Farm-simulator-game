extends Button

var is_pressed : bool
var _name : String
var planting_dic : Dictionary
var holding_item : Node
var grid_container_bag : Node
var water_status : TextureRect
var is_planted : bool
var is_watered : bool
var energy_node : Node
var plant_day : int
var count = 0
var money_system : Node
var count_to_dead : int = 0



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
			#planting_dic = holding_item.get_hold_item()
			
			#check planting_dic value of "type" key is "seed" 
			if holding_item.get_hold_item().get("type") == "seed":
				
				# assign value in planting_dic to label and display
				if planting_dic == { }:
					planting_dic = holding_item.get_hold_item()
				display_plant()
				
				# decrease qty in bag dic then visible water icon and mark this field as planted
				grid_container_bag.decrease_item_qty_bag_dic(planting_dic.get("name"))
				water_status.visible = true	
				is_planted = true
				
				#check if hold item is empty clear hold item
				for i in grid_container_bag.get_bag_dic().size():
					if grid_container_bag.get_bag_dic().get(i) != null:
						if grid_container_bag.get_bag_dic().get(i).get("name") == holding_item.get_hold_item().get("name"):
							is_found_item = true
							
							break
				if !is_found_item :
					holding_item.set_hold_item({})
					print(planting_dic)
					
					

func water_plant():
	
	# check if hold node not null
	if holding_item != null:
		
		# check if hold node is hold watering
		if holding_item.get_hold_watering():
			
			# check if field need water and hold item qty is more than 0
			if water_status.visible and (holding_item.get_texture_button_watering().get_current_watering() > 0):
				check_energy_node()
				if energy_node.get_current_energy_value() - 20 >= 0:
					use_energy()
					#print("watering")
					
					#decrease water in watering can by 1 then invisiblle water status and mark field as watered
					holding_item.get_texture_button_watering().decrease_curent_watring(1)
					water_status.visible = false
					is_watered = true
					if holding_item.get_texture_button_watering().get_current_watering() <= 0:
						print("out of water...")
						pass
				else:
					print("out of energy")
			else:
					print("water already")
				
			pass
		pass

func check_energy_node() -> void:
	if energy_node != null:
		pass
	else:
		energy_node = get_parent().get_parent().get_parent().get_node("Energy")
func use_energy() -> void:
	check_energy_node()
	energy_node.decrease_current_energy_value(20)

func plant_progress() -> void:
	if planting_dic != {}:
		if is_watered:
			count_to_dead = 0
			var one_num = get_parent().get_child(3).text[0]
			var two_num = get_parent().get_child(3).text[0] + get_parent().get_child(3).text[1]
			if two_num is String:
				print(two_num)
				planting_dic["day"] = int(two_num)
			else:
				print(one_num)
				planting_dic["day"] = int(one_num)
			#planting_dic["day"] = get_parent().get_child(3).text[0]
			planting_dic["day"] = planting_dic.get("day") - 1
			if planting_dic["day"] <= 0:
				fully_plant()
			else:
				need_water()
			display_plant()
		else:
			count_to_dead += 1
			print(count_to_dead)
			if count_to_dead > 3 :
				dead_plant()
	pass


func display_plant() -> void:
	if planting_dic != {}:
		get_parent().get_child(2).text = planting_dic.get("name")
		get_parent().get_child(3).text = str(planting_dic.get("day")) + " " + "days"
	else:
		get_parent().get_child(2).text = ""
		get_parent().get_child(3).text = ""
		
	pass

func fully_plant() -> void:
	auto_sell_plant()
	reset_field()
	pass

func auto_sell_plant() -> void:
	if money_system != null:
		money_system.increase_money(planting_dic.get("profit"))
		print(planting_dic)
	else:
		money_system = get_parent().get_parent().get_parent().get_node("Money_system")
		auto_sell_plant()
	print(money_system)
	pass

func need_water() -> void:
	is_watered = false
	water_status.visible = true

func dead_plant() -> void:
	reset_field()
	pass

func reset_field() -> void:
	planting_dic = {}
	count_to_dead = 0
	is_planted = false
	is_watered = false
	water_status.visible = false
	display_plant()
	pass
