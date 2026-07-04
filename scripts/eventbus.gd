extends Node

var interactable_object = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
#	this button is numpad +
	if Input.is_action_just_pressed("debug_console"):
		print(interactable_object)
	pass
