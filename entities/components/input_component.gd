class_name InputComponent extends Node

signal input_interacted
signal input_interacted_upped
signal input_throw
signal input_escape
signal input_dragged
var input_direction : Vector2
func _input(event: InputEvent) -> void:
	if GameUtils.is_disabled(self): return
	if Input.is_action_just_pressed("interact"):
		input_interacted.emit()
	if Input.is_action_just_released("interact"):
		input_interacted_upped.emit()
func _unhandled_input(event: InputEvent) -> void:
	if GameUtils.is_disabled(self): return
	
	if Input.is_action_just_pressed("escape"):
		input_escape.emit()
	#if Input.is_action_just_pressed("throw"):
		#input_throw.emit()
	if Input.is_action_just_pressed("interact"):
		input_interacted.emit()

#Directional Movement
#func _process(delta: float) -> void:
	#if GameUtils.is_disabled(self): 
		#input_direction = Vector2.ZERO
		#return
	#input_direction = Input.get_vector("left", "right", "forward", "backward")
	#
