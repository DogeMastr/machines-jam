extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
#	this is in place of an enemy manager
	$Enemy/StateMachine.player = $Player
	$Enemy/StateMachine._ready()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
