extends Control

@onready var button: Button = $Button
@onready var button_2: Button = $Button2
@export var camera_3d: Camera3D 
@export var turn_speed: float = 0.1
var is_hovering: bool = false
var is_hovering2:bool = false


# Called when the node enters the scene tree for the first time.




func _lookleft(delta: float)-> void:
	if camera_3d.rotation.y  > deg_to_rad(40):
		return
	print(camera_3d.rotation.y)
	if is_hovering:
		camera_3d.rotate_y(1.45 * delta)
	
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	_lookleft(delta)
		
	if camera_3d.rotation.y  < deg_to_rad(-40):
		return
		
	if is_hovering2:
		camera_3d.rotate_y(-1.45 * delta)
		


func _on_button_mouse_entered() -> void:
	
	
	is_hovering = true 

func _on_button_mouse_exited() -> void:
	is_hovering = false 


 # Replace with function body.


		
func _on_button_2_mouse_entered() -> void:
	
	if camera_3d.rotation.y  <-40:
		return
	is_hovering2 = true


func _on_button_2_mouse_exited() -> void:
	is_hovering2 = false # Replace with function body.
