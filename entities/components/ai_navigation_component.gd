class_name AiNavigationComponent extends Node

@export var nav_agent : NavigationAgent3D
@export var body : Node3D

var move_direction : Vector3

func walk_to(target_pos : Vector3) -> void:
	nav_agent.target_position = target_pos
	
func _physics_process(delta: float) -> void:
	move_direction = Vector3.ZERO
	if nav_agent.is_navigation_finished(): return
	
	var current_pos = body.global_position
	var next_path_pos = nav_agent.get_next_path_position()
	move_direction = (next_path_pos - current_pos).normalized()
	
