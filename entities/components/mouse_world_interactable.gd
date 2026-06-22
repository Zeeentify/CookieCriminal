class_name MouseWorldInteractable extends Node

signal clicked
signal dragged
@export var object : Node3D
@export var reparent_to_object : bool = false
func _ready() -> void:
	await get_tree().create_timer(1.0)
	if reparent_to_object:
		reparent.call_deferred(object)


func dragging()->void:
	dragged.emit()
