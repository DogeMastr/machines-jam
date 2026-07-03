extends CharacterBody3D

@export var walk_speed = 5.0
@export var gravity = 20.8
@export var jump_strength = 7.0

@export var mouse_sensitivity = 0.002

# Node References
@onready var head = $Head

# This function runs once when the game starts.
func _ready():
	# This hides our mouse cursor and keeps it locked to the game window.
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	

func _input(event):
	if event is InputEventMouseMotion:
		# To look left and right, we rotate the entire player body.
		rotate_y(-event.relative.x * mouse_sensitivity)
		
		# To look up and down, we only rotate our "Head" pivot.
		head.rotate_x(-event.relative.y * mouse_sensitivity)
		
		# We need to prevent the head from looking too far and flipping over.
		# This line clamps the rotation between straight up (-90 degrees) and straight down (90 degrees).
		head.rotation.x = clamp(head.rotation.x, -PI/2, PI/2)

func _physics_process(delta):
	# First, apply gravity so wew  don't float.
	if not is_on_floor():
		velocity.y -= gravity * delta
	else:
		# Jumping 
		velocity.y += float(Input.is_action_pressed("jump")) * jump_strength
	
	# Get our WASD input.
	var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	
	# This bit of math translates our local "forward" into the world's "forward"
	# based on the direction our player is facing.
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()

	# Set our horizontal velocity.
	velocity.x = direction.x * walk_speed
	velocity.z = direction.z * walk_speed

	# This is the Godot function that does moving and colliding.
	move_and_slide()
