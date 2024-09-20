extends Label

var qty = 0
var button_decrease : Button
var button_increase : Button
var is_pressed_decrase = false
var is_pressed_incrase = false
var label_item_name : Label


# Called when the node enters the scene tree for the first time.
func _ready():
	button_decrease = get_parent().get_node("Button_decrease")
	button_increase = get_parent().get_node("Button_increase")
	label_item_name = get_parent().get_node("Label_item_qty")
	
	#print(button_decrease.button_pressed)
	#print(button_increase)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	# one click decrease value
	if button_decrease.button_pressed:
		is_pressed_decrase = true		
	if !button_decrease.button_pressed and is_pressed_decrase:
		#print("press")
		if qty > 0 :
			qty -= 1
		is_pressed_decrase = false
		change_qty_value(qty)
		#print(qty)
	# ---------------------------------------------------------
	
	# one click increase value
	if button_increase.button_pressed:
		is_pressed_incrase = true		
	if !button_increase.button_pressed and is_pressed_incrase:
		#print("press")
		qty += 1
		is_pressed_incrase = false
		change_qty_value(qty)
		#print(qty)
	# ---------------------------------------------------------
	#print(button_decrease.button_pressed)
	
func change_qty_value(qty : int):
	label_item_name.text = str(qty)
	pass

func reset_qty_value():
	qty = 0
	change_qty_value(qty)
