extends TileMapLayer
var idealHeight
var check: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	idealHeight = global_transform.origin.y - 200


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(check):
		global_transform.origin.y = easyLerp(global_transform.origin.y, idealHeight, 50, delta)
func easyLerp(from: float, to: float, weight: float, delta: float):
	from = move_toward(from, to, weight * delta)
	return from
