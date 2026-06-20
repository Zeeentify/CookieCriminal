extends Node
class_name MovementComponent
@export var body : CharacterBody3D
@export var speed := 1.5
@export var gravity_multiplier := 1.0

var direction_vector : Vector3 = Vector3.ZERO

func _physics_process(delta: float) -> void:
	if GameUtils.is_disabled(self): return
	if !body: return
	direction_vector.normalized()
	
	
	body.velocity.x = direction_vector.x * speed
	body.velocity.z = direction_vector.z * speed
	
	if not body.is_on_floor():
		body.velocity += body.get_gravity() * gravity_multiplier * delta
	body.move_and_slide()
	#print(body.velocity)
	
