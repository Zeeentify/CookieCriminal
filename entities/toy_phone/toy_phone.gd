extends Node3D


@export var mouse_world_interactable : MouseWorldInteractable
@export var phantom_cam : PhantomCamera3D

@export var mouse_world_interactor: MouseWorldInteractor
@export var mouse_world_interactor_enabler_component : ComponentEnablerComponent

var is_active : bool
func _ready() -> void:
	mouse_world_interactable.clicked.connect(clicked)
	
func clicked()->void:
	if is_active : return
	print("clicied on phone")
	phantom_cam.priority = 2
	EventBus.disable_current_world_interactable.emit()
	await phantom_cam.tween_completed
	EventBus.disable_current_world_interactable.connect(func(): mouse_world_interactor_enabler_component.enabled = false)
	is_active = true


	
	
