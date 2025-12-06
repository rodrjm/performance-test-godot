extends Control

func _ready():
	var stop_button: Button = get_node("../Stop")
	
	stop_button.text = "STOP"
	stop_button.pressed.connect(_on_stop_pressed)

func _on_stop_pressed():
	print("Stop presionado")
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	
