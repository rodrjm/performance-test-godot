extends Control

# Instance variables
var delta_time: float = 0.0
var last_frames_fps_sum: float = 0.0
var last_frames_fps_avg: float = 0.0
var last_frames_count: int = 0
var last_frames_max: int = 100
var elapsed_time: float = 0.0
var interval_seconds: float = 1.0
var quality: float = 0
var quantity: int = 0

@onready var fps_label: Label = get_node("../FPS")

func _ready():
	pass

func _process(delta):
	elapsed_time += delta
	if elapsed_time >= interval_seconds:
		#Global.new_log_entry = true
		elapsed_time = 0.0
	
	delta_time += (delta - delta_time) * 0.1
	
	var msec = delta_time * 1000.0
	var fps = 1.0 / delta_time if delta_time > 0 else 0.0
	
	last_frames_fps_sum += fps
	last_frames_count += 1
	if last_frames_count == last_frames_max:
		last_frames_fps_avg = last_frames_fps_sum / float(last_frames_max)
		last_frames_count = 0
		last_frames_fps_sum = 0.0
	
	var quality_text = "Lo" if quality == 0 else "Hi"
	var text = "%.1f ms (%.0f fps %.0f avg %s qty) %s" % [msec, fps, last_frames_fps_avg, quantity, quality_text]

	fps_label.text = text
	
