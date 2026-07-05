extends EnemyState

func enter():
	model.current_animation = "Armature|Idle"
	model.play()

func physics_update(delta):
	check_states()
	pass
	
func check_states():
	if player:
		state_machine.change_state($"../Chase")
