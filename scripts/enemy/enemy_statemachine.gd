extends StateMachine

# enemies should be spawned by an enemy manager that lives in the level scene, that should pass the player object to the enemy on creation
@export var player: CharacterBody3D

func _ready() -> void:
#	they wanna know the machine
	for child in get_children():
		if child is EnemyState:
			child.state_machine = self
			child.player = player
			child.nav_agent = %NavigationAgent3D
			child.body = self.get_parent()
			child.model = %Model/AnimationPlayer
			
	if inital_state:
		current_state = inital_state
		current_state.enter()
		
func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_update(delta)
	
	#print(%Model/AnimationPlayer.current_animation)
