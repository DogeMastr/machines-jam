extends Sprite3D

var interactable = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if interactable:
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
	pass
