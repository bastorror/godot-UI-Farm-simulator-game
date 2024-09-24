extends GridContainer

var field_dic : Dictionary = {0 : null, 1 :null, 2 :null, 3 :null, 4 :null, 5 :null}
var water_status : TextureRect
# Called when the node enters the scene tree for the first time.
func _ready():
	display_field()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func script_to_button_items():
	for i in get_children():
		for j in i.get_children():
			if j is Button:
				if j.get_script() == null:
					j.set_process(true)
					j.set_script(load("res://Script/Button_Field.gd"))
func display_field():
	var count = 0
	
	#acess to each child of this node
	for i in get_children():
		
		#acess to each child of child (Panel) 
		for j in i.get_children():
			if j is TextureRect:
				water_status = j
			#check if that node is Label
			if j is Label:
				
				# check node name
				if j.name == "Label_Plant_Name":
					
					#check if that dictionary key value not null
					if field_dic.get(count) != null:
						
						#set text in Label
						j.text = field_dic.get(count).get("name")
						#print("set name")
						pass
					else:
						j.text = ""
						water_status.texture = null
					
				if j.name == "Label_Plant_Remain":
					if field_dic.get(count) != null:
						j.text = str(field_dic.get(count).get("qty"))
						#print("set qty")
						pass
					else:
						j.text = ""
		water_status = null
		count += 1
	count = 0
	
	pass
