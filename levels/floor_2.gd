extends TileMapLayer
var idealHeight
var check: bool = false
@export var moveTo: int
# Called when the node enters the scene tree for the first time.
func _ready():
	idealHeight = global_transform.origin.y + moveTo


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(check):
		global_transform.origin.y = easyLerp(global_transform.origin.y, idealHeight, 400, delta)
func easyLerp(from: float, to: float, weight: float, delta: float):
	from = move_toward(from, to, weight * delta)
	return from
