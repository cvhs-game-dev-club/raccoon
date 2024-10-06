extends Node2D

var Equipped: bool = false
var entered: bool = false
var playerStorage

@export var itemName: String

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if(entered and Input.is_action_just_pressed("interact") and global_transform.origin.distance_to(playerStorage.global_transform.origin) <= 40):
		Equipped = true
		playerStorage.holdItemName = itemName
	if(Equipped):
		global_transform.origin = easyLerp(global_transform.origin, playerStorage.holdItemPos.global_transform.origin, 200, delta)
		#global_transform.origin = playerStorage.holdItemPos.global_transform.origin
	if(Equipped and Input.is_action_just_pressed("drop")):
		Equipped = false
		playerStorage.holdItemName = ""

func _on_key_area_2d_body_entered(body):
	if(body.name.contains("SneakyCharacter")):
		entered = true
		playerStorage = body
func easyLerp(from: Vector2, to: Vector2, weight: float, delta: float):
	from.x = move_toward(from.x, to.x, weight * delta)
	from.y = move_toward(from.y, to.y, weight * delta)
	return from
