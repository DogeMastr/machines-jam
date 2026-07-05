extends EnemyState

@export var speed = 4.5

func enter():
	model.current_animation = "Armature|Walk"
	model.get_animation("Armature|Walk").loop_mode = (Animation.LOOP_LINEAR)
	model.play()

func physics_update(delta: float) -> void:
	if not player:
		return
	
	nav_agent.set_target_position(player.global_position)
	
	var next_pos := nav_agent.get_next_path_position()
	var direction := (next_pos - body.global_position).normalized()

	body.velocity = direction * speed
	body.look_at(body.global_position - direction)

	# THIS DOESNT WORK? I THINK I NEED A NAVIGATION ZONE OR SOMETHING I DONT KNOWWWWW
	#print(direction)
	body.move_and_slide()
	check_states()
	
func check_states():
	if not player:
		state_machine.change_state($"../Idle")
		return
	
	var distance := body.global_position.distance_to(player.global_position)
	if distance < 2:
		state_machine.change_state($"../Explode")
