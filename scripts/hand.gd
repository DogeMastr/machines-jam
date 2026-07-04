extends RigidBody3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _process(delta: float) -> void:
	await get_tree().create_timer(7).timeout

func _on_area_3d_body_entered(body: Node3D) -> void:
	if not body:
		return

	if body.get_collision_layer_value(5):
		if "health" in body:
			body.health -= 1.0
			if body.health <= 0.0:
				body.queue_free()

	elif body.get_collision_layer_value(1):
		await get_tree().create_timer(2).timeout

	$AnimationPlayer.play("delete")
