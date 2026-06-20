class_name MouseModeManagerComponent extends Node

@export var mouse_mode : Input.MouseMode


func _process(delta: float) -> void:
	Input.mouse_mode = mouse_mode
