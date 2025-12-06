extends Node

@export var interval_seconds: float = 10.0
@export var speed_separation: float = 5000.0
@export var max_distance: float = 50000000.0
@export var test_name: String

@onready var camera: Camera3D = get_node("../Camera3D")


var elapsed_time: float = 0.0
var movement_array: Vector3 = Vector3(0, 0, -speed_separation)


func _ready():
	print("Spacer: test_name = ", test_name)


func _process(delta):
	elapsed_time += delta
	
	if elapsed_time >= interval_seconds:
		if (camera.global_position.z > -max_distance):
			print("Spacer: Alejando")
			camera.global_position -= movement_array
		
		elapsed_time = 0.0
		
