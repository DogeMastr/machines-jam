extends Node

var spawn_points = []
var spawning = false

@export var timer_length = 2

@onready var employee_enemy = preload("res://scenes/enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in get_children():
		spawn_points.append(child.position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not spawning:
		spawn()
		spawning = not spawning

func spawn():
	await get_tree().create_timer(timer_length).timeout
	var enemy = employee_enemy.instantiate()
	get_tree().root.get_child(0).add_child(enemy)
	enemy.position = spawn_points[randi_range(0, spawn_points.size() - 1)]
	enemy.get_node("StateMachine").player = %Player
	enemy.get_node("StateMachine")._ready()
	spawning = not spawning
