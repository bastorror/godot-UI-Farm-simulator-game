extends Node
var bag_max_size : int = 9
var bag_dic : Dictionary = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func receive_item(items : Dictionary):
	print("from Bag.gd(non-signal)", items)
	#print(items.size())
	for i in items.size():
		#print(i)
		
		if bag_dic.size() < bag_max_size:
			if bag_dic.has(i):
				bag_dic[i]["qty"] += int(items.get(i).get("qty"))
				#bag_dic[i].merge(items.get(i),true)
				
				pass
			else:
				bag_dic.merge({i : null})
				items[i]["qty"] = int(items.get(i).get("qty"))
				print(items.get(i))
				bag_dic[i] = items.get(i)
				#print(bag_dic.get(i))
				
				#bag_dic.merge(items[i])	
				pass
			#print("add this item : ",items[i])
			#bag_dic.merge(items[i] , true)
	print(typeof(bag_dic))	
	print(bag_dic)
	pass
