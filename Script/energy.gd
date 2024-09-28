extends Control

@export var current_energy_value : float 
@export var max_energy_value : float 
@onready var label_energy: Label = $"../VBoxContainer_Status/BoxContainer_Energy/VBoxContainer_Energy/Label_Energy"
@onready var progress_bar_energy: ProgressBar = $"../VBoxContainer_Status/BoxContainer_Energy/VBoxContainer_Energy/ProgressBar_Energy"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	display_energy_label()
	display_energy_progressbar()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func display_energy_label() -> void:
	label_energy.text = str(current_energy_value) + "/" + str(max_energy_value)
	pass

func display_energy_progressbar() -> void:
	progress_bar_energy.value = current_energy_value
	progress_bar_energy.max_value = max_energy_value
	pass

func decrease_current_energy_value(value: float) -> void:
	if current_energy_value > 0 :
		current_energy_value -= value
		display_energy_label()
		display_energy_progressbar()
		print(current_energy_value)

func increase_current_energy_value(value: float) -> void:
	current_energy_value += value
	display_energy_label()
	display_energy_progressbar()

func get_max_energy_value() -> float:
	return max_energy_value

func get_current_energy_value() -> float:
	#print("from get ",current_energy_value)
	return current_energy_value

func set_current_energy_value(value : float) -> void:
	current_energy_value = value
	display_energy_label()
	display_energy_progressbar()
