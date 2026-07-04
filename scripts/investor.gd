extends RigidBody3D

var interactable = false
var has_been_interacted_with = false

@onready var player = %Player
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not has_been_interacted_with:
		var looking = player.global_position
		looking.y == global_position.y - 5000
		look_at(looking)
		rotation.x = clampf(rotation.x, -.4, .4)
	
	if interactable and not has_been_interacted_with:
		if Eventbus.interactable_object.find(self) == -1:
			Eventbus.interactable_object.append(self)
	else:
		if Eventbus.interactable_object.find(self) != -1:
			Eventbus.interactable_object.pop_at(Eventbus.interactable_object.find(self))
	pass

func _on_interaction_zone_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	interactable = true
	pass # Replace with function body.

func _on_interaction_zone_body_shape_exited(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	interactable = false
	pass # Replace with function body.
	
func run_interaction():
	print(self, " running interaction")
	freeze = false
	$Sprite.billboard = false
	has_been_interacted_with = true
	# snap sprite and collisionshape to face the player
	pass
