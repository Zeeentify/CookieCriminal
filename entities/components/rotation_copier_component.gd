class_name RotationCopierComponent extends Node

@export var copier_x : Node3D
@export var copier_y : Node3D
@export var copiee : Node3D


func copy()->void:
	copier_x.global_rotation.x = copiee.global_rotation.x
	copier_y.global_rotation.y = copiee.global_rotation.y
