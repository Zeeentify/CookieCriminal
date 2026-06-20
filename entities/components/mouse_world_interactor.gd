class_name MouseWorldInteractor extends Node

@export var interaction_length : float = 100.0

func _process(delta: float) -> void:
	var camera : Camera3D = get_viewport().get_camera_3d()
	var mouse_pos : Vector2 = get_viewport().get_mouse_position()
	
	var ray_origin = camera.project_ray_origin(mouse_pos)
	var ray_end = ray_origin + camera.project_ray_normal(mouse_pos) * interaction_length
	
	var space_state = camera.get_world_3d().direct_space_state
	var query = PhysicsRayQueryParameters3D.create(ray_origin, ray_end)
	var result = space_state.intersect_ray(query)
	
	if result:
		var hit_object = result.collider
		print("mouse is over:", hit_object.name)
		if hit_object.name == "Criminal":
			pass
			
