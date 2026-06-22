extends Node3D


@export var mouse_world_interactable : MouseWorldInteractable
@export var phantom_cam : PhantomCamera3D
@export var rotating_thing_mouse_world_interactable : MouseWorldInteractable
@export var mouse_world_interactor: MouseWorldInteractor
@export var mouse_world_interactor_enabler_component : ComponentEnablerComponent
@export var input_component : InputComponent
var is_active : bool
func _ready() -> void:
	mouse_world_interactable.clicked.connect(clicked)
	rotating_thing_mouse_world_interactable.dragged.connect(dragging_phone)
	## Input -> interactor
	input_component.input_interacted.connect(mouse_world_interactor.mouse_down)
	input_component.input_interacted_upped.connect(mouse_world_interactor.mouse_up)
	
	#interactor -> self
	
func clicked()->void:
	if is_active : return
	print("clicied on phone")
	phantom_cam.priority = 2
	EventBus.disable_current_world_interactable.emit()
	EventBus.input_disabled.emit()
	await phantom_cam.tween_completed
	EventBus.disable_current_world_interactable.connect(func(): mouse_world_interactor_enabler_component.enabled = false)
	#Connect to signal
	EventBus.input_disabled.connect(func(): GameUtils.toggle_enabled(input_component, false), CONNECT_ONE_SHOT)
	#Toggle own input component
	GameUtils.toggle_enabled(input_component, true)
	is_active = true


func dragging_phone()->void:
	if !is_active : return
	print("dragging")
	
	
	
