class_name MouseWorldInteractor extends Node

@export var interaction_length : float = 100.0
signal clicked(mouse_world_interactable : MouseWorldInteractable)
signal dragged(mouse_world_interactable : MouseWorldInteractable)
signal mouse_downed(mouse_world_interactable : MouseWorldInteractable)
signal mouse_upped(mouse_world_interactable : MouseWorldInteractable)
var mouse_world_interactable : MouseWorldInteractable

func _process(delta: float) -> void:
	mouse_world_interactable = null
	var camera : Camera3D = get_viewport().get_camera_3d()
	var mouse_pos : Vector2 = get_viewport().get_mouse_position()
	
	var ray_origin = camera.project_ray_origin(mouse_pos)
	var ray_end = ray_origin + camera.project_ray_normal(mouse_pos) * interaction_length
	
	var space_state = camera.get_world_3d().direct_space_state
	var query = PhysicsRayQueryParameters3D.create(ray_origin, ray_end)
	var result = space_state.intersect_ray(query)
	if result:
		var hit_object : Node3D = result.collider
		#print("mouse is over:", hit_object.name)
		
		if hit_object.has_node("MouseWorldInteractable"):
			mouse_world_interactable = hit_object.get_node("MouseWorldInteractable")
			if GameUtils.is_disabled(mouse_world_interactable): return
func click()->void:
	if mouse_world_interactable:
		mouse_world_interactable.clicked.emit()
		clicked.emit(mouse_world_interactable)

func mouse_down()->void:
	mouse_downed.emit(mouse_world_interactable)
	print("mouse downed", mouse_world_interactable.name)
func mouse_up()->void:
	mouse_upped.emit(mouse_world_interactable)
	print("mouse upped", mouse_world_interactable.name)
func _dragging()->void:
	if mouse_world_interactable:
		mouse_world_interactable.dragging()
		dragged.emit(mouse_world_interactable)
