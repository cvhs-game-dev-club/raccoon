extends Sprite2D

@export var topIdealPosPath: NodePath

@onready var topIdealPosNode = get_node(topIdealPosPath)
var topIdealPos
var rotationOG
var jumpEffect: bool = false
var startJumpEffectTime: float

@export var jumpEffectTime: float

# Called when the node enters the scene tree for the first time.
func _ready():
	rotationOG = rotation

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	topIdealPos = topIdealPosNode.topIdealPos
	#print(topIdealPosNode.topIdealPos.global_transform.origin)
	if(Time.get_ticks_msec() * 0.001 < startJumpEffectTime + jumpEffectTime):
		topIdealPos.global_transform.origin.y = topIdealPosNode.topIdealPos.global_transform.origin.y + 5
	global_transform.origin = easyLerp(global_transform.origin, topIdealPos.global_transform.origin, 200, delta)
	#IM REALLY TIRED BUT YOU CAN PROBABLY USE A CLAMP HERE!!!
	if(global_transform.origin.y < topIdealPos.global_transform.origin.y):
		global_transform.origin.y = topIdealPos.global_transform.origin.y
	if(global_transform.origin.y > topIdealPos.global_transform.origin.y + 10):
		global_transform.origin.y = topIdealPos.global_transform.origin.y + 10
	if(global_transform.origin.x > topIdealPos.global_transform.origin.x + 2):
		global_transform.origin.x = topIdealPos.global_transform.origin.x + 2
	if(global_transform.origin.x < topIdealPos.global_transform.origin.x - 2):
		global_transform.origin.x = topIdealPos.global_transform.origin.x - 2
	if(Global.current == topIdealPosNode.index):
		if(Input.is_action_pressed("ui_left")):
			rotation = rotationOG + deg_to_rad(5)
		elif(Input.is_action_pressed("ui_right")):
			rotation = rotationOG - deg_to_rad(5)
		else:
			rotation = rotationOG
	if(topIdealPosNode.inAir):
		jumpEffect = true
	if(jumpEffect and !topIdealPosNode.inAir):
		startJumpEffectTime = Time.get_ticks_msec() * 0.001
		jumpEffect = false
func easyLerp(from: Vector2, to: Vector2, weight: float, delta: float):
	from.x = move_toward(from.x, to.x, weight * delta)
	from.y = move_toward(from.y, to.y, weight * delta)
	return from
