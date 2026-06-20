class_name CameraSwitcherComponent
extends Node


@export var cameras: Array[PhantomCamera3D] = []

# We use StringName (with a &) because it's faster and acts like a constant ID
func switch_to(camera_name: String) -> void:
	for camera in cameras:
		camera.set_priority(0)
		if camera.name == camera_name:
			camera.set_priority(1)
			#print("Switched to camera: ", camera_name)
			return
			
	# If you make a typo, Godot will instantly yell at you in the debugger
	push_error("Camera switcher error: No camera named", camera_name, "found in the array!")
