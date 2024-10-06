extends Camera2D


@export var targets: Array[Node2D]

var target_pos: Vector2 = Vector2.ZERO


func _process(delta: float) -> void:
	target_pos = Vector2.ZERO

	for i in targets:
		target_pos += i.position / len(targets)

	var max_distance: Vector2 = Vector2.ZERO

	targets.sort_custom(func(a, b): return a.position.x > b.position.x)
	max_distance.x = (targets[0].position.x - targets[-1].position.x)
	
	targets.sort_custom(func(a, b): return a.position.y > b.position.y)
	max_distance.y = (targets[0].position.y - targets[-1].position.y)


	position = target_pos

	zoom.x = min(600.0 / (max_distance.x), 2)
	zoom.y = min(336.0 / (max_distance.y), 2) 
	
	if zoom.x > zoom.y:
		zoom.x = zoom.y
	if zoom.y > zoom.x:
		zoom.y = zoom.x
