class_name StateMachine
extends Node

@export var inital_state: State
var current_state: State

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
#	they wanna know the machine
	for child in get_children():
		if child is State:
			child.state_machine = self
	
	if inital_state:
		current_state = inital_state
		current_state.enter()

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_update(delta)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if current_state:
		current_state.update(delta)

func change_state(new_state: State):
	if current_state == new_state:
		return
	
	current_state.exit()
	current_state = new_state
	current_state.enter()
