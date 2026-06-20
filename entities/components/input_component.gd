class_name InputComponent extends Node

signal input_interacted
signal input_throw
signal input_escape
var input_direction : Vector2

func _unhandled_input(event: InputEvent) -> void:
	if GameUtils.is_disabled(self): return
	
	if Input.is_action_just_pressed("escape"):
		input_escape.emit()
	if Input.is_action_just_pressed("throw"):
		input_throw.emit()
	if Input.is_action_just_pressed("interact"):
		input_interacted.emit()

func _process(delta: float) -> void:
	if GameUtils.is_disabled(self): 
		input_direction = Vector2.ZERO
		return
	input_direction = Input.get_vector("left", "right", "forward", "backward")
	
