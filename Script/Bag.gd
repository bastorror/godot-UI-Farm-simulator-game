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
			
			#check if current key not null
			if bag_dic.get(j) != null:
				
				#check if name in bag
				if bag_dic.get(j).get("name") == items.get(i).get("name"):
					
					#add plus value to qty in dictionary
					bag_dic[j]["qty"] += int(items.get(i).get("qty"))
					break

			else:
				#change string qty to int
				items[i]["qty"] = int(items.get(i).get("qty"))
				
				#add value dictionary to bag_dic
				bag_dic[j] = items.get(i)
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
						print("set name")
						pass
					else:
						j.text = ""
					
				if j.name == "Label_Item_Remain":
					if bag_dic.get(count) != null:
						j.text = str(bag_dic.get(count).get("qty"))
						print("set qty")
						pass
					else:
						j.text = ""
		count += 1
	count = 0
	pass


func _on_visibility_changed():
	display_items()	
	pass # Replace with function body.
