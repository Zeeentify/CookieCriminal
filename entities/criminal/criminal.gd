extends CharacterBody3D

@export var ai_navigation_component : AiNavigationComponent
@export var movement_component : MovementComponent
@export var rotation_component : RotationComponent
@export var possible_locations : Array[Node3D]


func _ready() -> void:
	choose_new_random_location()

func choose_new_random_location()->void:
	var picked_location = possible_locations.pick_random().global_position
	print(picked_location)
	ai_navigation_component.walk_to(picked_location)
	
func _process(delta: float) -> void:
	rotation_component.velocity = velocity
	movement_component.direction_vector = ai_navigation_component.move_direction
