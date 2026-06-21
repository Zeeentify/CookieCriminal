extends Node3D

@export var input_component : InputComponent
@export var mouse_world_interactor : MouseWorldInteractor
@export var mouse_world_interactor_enabler_component : ComponentEnablerComponent
func _ready() -> void:
	input_component.input_interacted.connect(mouse_world_interactor.click)
	EventBus.disable_current_world_interactable.connect(func(): mouse_world_interactor_enabler_component.enabled = false)
	
