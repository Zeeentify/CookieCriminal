@tool
class_name ConstRotationComponent extends Node

@export var rotation_angle : Vector3
@export var object : Node3D
@export var speed : float = 1.0
func _ready() -> void:
	rotation_angle = rotation_angle.normalized()
	
	
func _process(delta: float) -> void:
	object.rotate(rotation_angle, speed * delta)
