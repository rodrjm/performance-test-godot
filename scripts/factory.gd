extends Node3D

@export var random_range_x: float = 0.09
@export var random_range_y: float = 0.09
@export var random_range_z: float = 1.0
@export var interval_seconds: float = 10.0
@export var increment_factor: int = 2
@export var max_objects: int = 32768
@export var test_name: String
@export var object_to_create: PackedScene

@onready var fps_label: Label = get_node("../FPS")

var instance_qty: int = 0
var elapsed_time: float = 0.0


func _ready():
	print("Factory: test_name = ", test_name)
		
		
func _process(delta):
	if instance_qty > max_objects:
		#Global.save_log_file(test_name)
		instance_qty = 0
		fps_label.quantity = instance_qty
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	
	elapsed_time += delta
	if elapsed_time >= interval_seconds:
		var old_qty = instance_qty
		if instance_qty == 0:
			instance_qty = 1
		
		instance_qty = instance_qty * increment_factor
		if increment_factor == 1:
			instance_qty += 1
		
		# Create objects
		for i in range(instance_qty - old_qty):
			create_object()
			
		elapsed_time = 0.0
		fps_label.quantity = instance_qty
		print("Qty: " + str(instance_qty))
		

func create_object():	
	if object_to_create != null:
		var new_object = object_to_create.instantiate()
		
		# Random position
		var random_pos = Vector3(
			randf_range(-random_range_x, random_range_x),
			randf_range(-random_range_y, random_range_y),
			randf_range(-random_range_z, 0)
		)
	
		new_object.position = random_pos
	
		# Add rotation script
		new_object.set_script(load("res://scripts/rotator.gd"))
		
		#Add to scene
		get_parent().add_child(new_object)
		
		print("Factory: Objeto creado en la posición: ", random_pos)
	else:
		print("Objeto es null")
	
