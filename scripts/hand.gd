extends RigidBody3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	await get_tree().create_timer(7).timeout
	queue_free()



func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.get_collision_layer_value(1):
		await get_tree().create_timer(2).timeout
		queue_free()
