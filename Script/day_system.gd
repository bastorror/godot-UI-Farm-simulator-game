extends Control

var time_period_icon_array : Array = ["res://Art/Icon/sunny_icon.png", "res://Art/Icon/evening.png", "res://Art/Icon/night.png"]
var time_period_array : Array = ["Day", "Evening", "Night"]
var month_array : Array = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
var current_month : int = 11
var current_time_period : int = 0
var date_value : int = 1
var year_value : int = 2024
@onready var box_container_time: BoxContainer = $"../BoxContainer_Time"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	display_date()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_skip_day_pressed() -> void:
	date_progress()
	pass # Replace with function body.
	
func _on_button_skip_period_pressed() -> void:
	day_progress()
	pass # Replace with function body.

func date_progress() -> void:
	date_value += 1
	if date_value > 31:
		current_month += 1
		if current_month >= month_array.size() - 1:
			year_value += 1
			current_month = 0
		date_value = 1
	current_time_period = 0
	display_date()

func display_date() -> void:
	var date = box_container_time.get_child(1).get_child(1)
	var time_period = box_container_time.get_child(1).get_child(0)
	var time_period_icon = box_container_time.get_child(0)
	
	date.text = month_array[current_month]+ "/" + str(date_value) + "/" + str(year_value)
	time_period.text = time_period_array[current_time_period]
	time_period_icon.texture = load(time_period_icon_array[current_time_period])
	pass

func day_progress() -> void:
	current_time_period += 1
	if current_time_period > time_period_array.size()-1:
		current_time_period = 0
		date_progress()
	display_date()
	pass
