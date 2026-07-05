extends Control

var data_array := []

# drawing a graph, value = y, index = x

@export var xPos = 100
@export var yPos = 100
@export var width = 300
@export var height = 100
@export var weight = 10
@export var colorUp = Color.GREEN
@export var colorDown = Color.RED
@export var steps = 15

func _draw():
	var line_set = []
	var color_set = []
	if data_array.size() < 2:
		return
	for n in data_array.size():
		if n == data_array.size() -1:
			break
		var x1 = remap_range(n, 0, steps, xPos, xPos + width)
		var y1 = remap_range(data_array[n], 0, Eventbus.max_reputation, yPos, yPos + height)
		
		if data_array[n] < data_array[n+1]:
			color_set.append(colorDown)
		else:
			color_set.append(colorUp)
		line_set.append(Vector2(x1,y1))
		
	draw_polyline_colors(line_set, color_set, weight)
	

func _on_update_timer_timeout() -> void:
	data_array.append(Eventbus.player_reputation)
	#print(data_array)
	queue_redraw()
	if data_array.size() > 15:
		data_array.pop_front()
	

func remap_range(value: float, InputA: float, InputB: float, OutputA: float, OutputB: float):
	return(value - InputA) / (InputB - InputA) * (OutputB - OutputA) + OutputA
