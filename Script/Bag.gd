extends Node
var bag_max_size : int = 9
var bag_dic : Dictionary = {0 : null, 1 :null, 2 :null, 3 :null, 4 :null, 5 :null, 6 :null, 7 :null, 8 :null}

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func receive_item(items : Dictionary):
	# count items size
	for i in items.size():
		
		# count bag_dic size
		for j in bag_dic.size():
			
			#check every key value if there is that item name already in bag dic
			if bag_dic.get(j) != null:
				if bag_dic.get(j).get("name") == items.get(i).get("name"):
					bag_dic[j]["qty"] += int(items.get(i).get("qty"))
					break
			else:
				
				#if check every and there is no exist name item then assign new item to bag dic
				if j >= bag_dic.size()-1:
					for k in bag_dic.size():
						
						##check if current key not null
						#if bag_dic.get(k) != null:
							#
							##check if name in bag
							#if bag_dic.get(k).get("name") == items.get(i).get("name"):
								#
								##add plus value to qty in dictionary
								#bag_dic[k]["qty"] += int(items.get(i).get("qty"))
								#break
						
						if bag_dic.get(k) == null:
							#change string qty to int
							items[i]["qty"] = int(items.get(i).get("qty"))
							
							#add value dictionary to bag_dic
							bag_dic[k] = items.get(i)
							break
				
	print(bag_dic)
	display_items()
	pass

func display_items():
	var count = 0
	
	#acess to each child of this node
	for i in get_children():
		
		#acess to each child of child (Panel) 
		for j in i.get_children():
			
			#check if that node is Label
			if j is Label:
				
				# check node name
				if j.name == "Label_Item_Name":
					
					#check if that dictionary key value not null
					if bag_dic.get(count) != null:
						
						#set text in Label
						j.text = bag_dic.get(count).get("name")
						#print("set name")
						pass
					else:
						j.text = ""
					
				if j.name == "Label_Item_Remain":
					if bag_dic.get(count) != null:
						j.text = str(bag_dic.get(count).get("qty"))
						#print("set qty")
						pass
					else:
						j.text = ""
		count += 1
	count = 0
	
	pass
	

func _on_visibility_changed():
	display_items()	
	script_to_button_items()	
	print("check")
	pass # Replace with function body.

func script_to_button_items():
	for i in get_children():
		for j in i.get_children():
			if j is Button:
				if j.get_script() == null:
					j.set_process(true)
					j.set_script(load("res://Script/Button_item.gd"))
					#print(j.name)
					#print(j.get_script())
				#else:
					#print(j.get_script())	

func get_bag_dic():
	return bag_dic
func decrease_item_qty_bag_dic(name : String):
	#access to every item in bag_dic
	for i in bag_dic:
		
		#check if that key value not null
		if bag_dic.get(i) != null:
			
			#check if name in parameter is match with name in dictionary
			if bag_dic.get(i).get("name") == name:
				print("found ", name, " in bag")
				
				#decrease one qty
				bag_dic[i]["qty"] -= 1
				
				#if it reach 0 set that value to null
				if bag_dic.get(i).get("qty") <= 0:
					bag_dic[i] = null;
				#pass
	
