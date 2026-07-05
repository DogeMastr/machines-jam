extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Eventbus.interactable_object.size() > 0:
		%Crosshair.set_frame(1)
		if Input.is_action_just_pressed("ui_accept"):
			#print("INTERACTED WITH ", Eventbus.interactable_object[0])
			Eventbus.interactable_object[0].run_interaction()
	else:
		%Crosshair.set_frame(0)
	pass
