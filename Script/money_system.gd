extends Control

@onready var label_money: Label = $"../BoxContainer_Money/Label_Money"

@export var money : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if label_money != null:
		pass
	else:
		label_money = $"../BoxContainer_Money/Label_Money"
	display_money()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func display_money() -> void:
	label_money.text = str(money) + " " + "$"
	pass

func get_money() -> int:
	return money

func set_money(value : int) -> void:
	money = value

func increase_money(value : int ) -> void:
	money += value
	display_money()

func decrease_money(value: int) -> void:
	money -= value
