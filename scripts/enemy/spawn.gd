extends EnemyState

@export var timer = 50

func enter():
#	play spawn animation?
	pass

func physics_update(delta: float) -> void:
	timer -= 1*delta
#	idk what im doing this should be replaced with the spawn animation idea that august had? idk idk idk

func check_states():
	if timer < 0:
		state_machine.change_state($"../Idle")
