class_name FootstepComponent extends Node


@export_range(0.1, 10.0, 0.1) var distance_before_step := 1.0
@export var audio_stream_player : AudioStreamPlayer3D
var distance_traveled : float
var last_pos : Vector3


func _ready() -> void:
	last_pos = audio_stream_player.global_position
func _physics_process(delta: float) -> void:
	distance_traveled += (audio_stream_player.global_position - last_pos).length()
	
	if distance_traveled > distance_before_step:
		distance_traveled -= distance_before_step
		audio_stream_player.play()
		
		
	last_pos = audio_stream_player.global_position
 
