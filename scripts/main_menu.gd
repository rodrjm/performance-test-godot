extends Control

# Maximum frame rate
@export var target_frame_rate: int = 1000

func _ready():
	print("Main Menu: Funcion _ready()")
	
	# Set target frame rate
	Engine.max_fps = target_frame_rate
	
	# Get UI elements
	var test1_button = $Container/Test1
	var test2_button = $Container/Test2
	var test3_button = $Container/Test3
	var test4_button = $Container/Test4
	var test5_button = $Container/Test5
	var test6_button = $Container/Test6
	var quality_min_button = $Container/QualityMin
	var quality_max_button = $Container/QualityMax
	var log_button = $Container/SaveLog
	
	# Connect button signals
	if test1_button:
		test1_button.pressed.connect(_on_test1_pressed)
		print("Test1 conectado")
	if test2_button:
		test2_button.pressed.connect(_on_test2_pressed)
		print("Test2 conectado")
	if test3_button:
		test3_button.pressed.connect(_on_test3_pressed)
		print("Test3 conectado")
	if test4_button:
		test4_button.pressed.connect(_on_test4_pressed)
		print("Test4 conectado")
	if test5_button:
		test5_button.pressed.connect(_on_test5_pressed)
		print("Test5 conectado")
	if test6_button:
		test6_button.pressed.connect(_on_test6_pressed)
		print("Test6 conectado")
	if quality_min_button:
		quality_min_button.pressed.connect(_on_quality_min_pressed)
		print("Quality: MIN conectado")
	if quality_max_button:
		quality_max_button.pressed.connect(_on_quality_max_pressed)
		print("Quality: MAX conectado")
	if log_button:
		log_button.pressed.connect(_on_log_pressed)
		print("Save Log conectado")

func save_log_file(test_name: String):
	var timestamp = Time.get_datetime_string_from_system()
	var file_name = test_name + "_log-" + timestamp + ".txt"
	var full_path = "user://" + file_name
	
	var file = FileAccess.open(full_path, FileAccess.WRITE)
	if file:
		file.store_string("")
		file.close()
		print("Log guardado en: " + full_path)

func _on_test1_pressed():
	print("Test1 presionado")
	print("Cambiando escena a test1.tscn")
	
	# Check if file exists
	var file_path = "res://scenes/test1.tscn"
	var file = FileAccess.open(file_path, FileAccess.READ)
	if file:
		print("El archivo existe y es legible")
		file.close()
	else:
		print("ERROR - Archivo no existente o no legible: ", file_path)
		return
	
	var result = get_tree().change_scene_to_file(file_path)
	print("Resultado de cambio de escena: ", result)
	
	if result != 0:
		print("ERROR - Fallo al cargar la escena! Código de error: ", result)
	else:
		print("Escena cargada correctamente!")

func _on_test2_pressed():
	print("Test2 presionado")
	get_tree().change_scene_to_file("res://scenes/test2.tscn")

func _on_test3_pressed():
	print("Test3 presionado")
	get_tree().change_scene_to_file("res://scenes/test3.tscn")

func _on_test4_pressed():
	print("Test4 presionado")
	get_tree().change_scene_to_file("res://scenes/test4.tscn")

func _on_test5_pressed():
	print("Test5 presionado")
	get_tree().change_scene_to_file("res://scenes/test5.tscn")

func _on_test6_pressed():
	print("Test6 presionado")
	get_tree().change_scene_to_file("res://scenes/test6.tscn")

func _on_quality_min_pressed():
	print("Quality: MIN presionado")
	#FPS.set_quality(0)

func _on_quality_max_pressed():
	print("Quality: MAX presionado")
	#FPS.set_quality(5)

func _on_log_pressed():
	print("Save Log presionado")
	save_log_file("No Name")
