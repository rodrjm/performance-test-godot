extends Node3D

var speed: int = 1

func _ready():
	pass

func _process(delta):
	# Rotate around Y axis
	rotation.y += speed * delta
