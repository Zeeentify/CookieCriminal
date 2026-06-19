extends ProgressBar

@onready var progress_bar: ProgressBar = $"."
@export var drainspeed: float = 0.006

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	progress_bar.value = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if progress_bar.value < 0.5:
		progress_bar.modulate = Color.AQUA
	
	
	if progress_bar.value   > 0.5:
		progress_bar.modulate = Color.RED

	
	
		

	
	
	progress_bar.value -= drainspeed
	
	if Input.is_action_just_pressed("go up"): 
		progress_bar.value += 0.1
		
