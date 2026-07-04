extends EnemyState

func physics_update(delta):
	check_states()
	pass
	
func check_states():
	#print(player)
	if player:
		state_machine.change_state($"../Chase")
