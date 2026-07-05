extends Node

var interactable_object = []

var player_reputation := 10.0
var max_reputation := 50
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
#	this button is numpad +
	if Input.is_action_just_pressed("debug_console"):
		print(interactable_object)
		player_reputation = randf_range(0, max_reputation)
	pass
