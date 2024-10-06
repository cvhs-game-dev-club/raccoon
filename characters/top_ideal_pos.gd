extends Node2D

var ogPos
# Called when the node enters the scene tree for the first time.
func _ready():
	ogPos = transform.origin


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	transform.origin = easyLerp(transform.origin, ogPos, 300, delta)
	
func easyLerp(from: Vector2, to: Vector2, weight: float, delta: float):
	from.x = move_toward(from.x, to.x, weight * delta)
	from.y = move_toward(from.y, to.y, weight * delta)
	return from
