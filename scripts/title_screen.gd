extends Node3D

var main_scene = preload("res://scenes/test_level.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Enemy/Model/AnimationPlayer.current_animation = "Armature|Walk"
	pass


func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_packed(main_scene)
	pass # Replace with function body.
