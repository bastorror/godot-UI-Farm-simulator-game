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
	#print("from Bag.gd(non-signal)", items)
	for i in items.size():
		for j in bag_dic.size():
			if bag_dic.get(j) != null:
				
				if bag_dic.get(j).get("name") == items.get(i).get("name"):
					bag_dic[j]["qty"] += int(items.get(i).get("qty"))
					break

			else:
				items[i]["qty"] = int(items.get(i).get("qty"))
				bag_dic[j] = items.get(i)
				break
				
	print(bag_dic)
	pass
