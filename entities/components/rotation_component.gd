class_name RotationComponent extends Node

enum RotationMode {VELOCITY_DIRECTION, LOOK_AT_TARGET, SHARE_ROTATION}

@export var body : Node3D
@export var target : Node3D
@export var rotation_speed := 1.0
@export var mode : RotationMode = RotationMode.VELOCITY_DIRECTION
@export var yaw_offset : float = 0.0
var velocity : Vector3


func _process(delta: float) -> void:
	
	if !body : return
	if GameUtils.is_disabled(self): return
	
	match mode:
		RotationMode.VELOCITY_DIRECTION:
			
			if velocity.length() < 0.1:
				return
			
			var normalized_velocity = velocity.normalized()
			body.global_rotation.y = lerp_angle(body.global_rotation.y,
			atan2(-normalized_velocity.x, -normalized_velocity.z) + deg_to_rad(yaw_offset), rotation_speed * delta )
		RotationMode.LOOK_AT_TARGET:
			var target_pos := target.global_position
			var target_yaw := body.global_position.direction_to(target_pos)
			body.global_rotation.y = lerp_angle(body.global_rotation.y,
			atan2(-target_yaw.x, -target_yaw.z) + deg_to_rad(yaw_offset)
			, rotation_speed * delta)
			
		RotationMode.SHARE_ROTATION:
			var target_yaw = target.global_rotation.y
			var current = body.global_rotation
			body.global_rotation.y = lerp_angle(current.y, target_yaw + deg_to_rad(yaw_offset), rotation_speed * delta)
			
	
func set_mode(new_mode: RotationMode, new_target : Node3D = null):
	mode = new_mode
	target = new_target
	
		
