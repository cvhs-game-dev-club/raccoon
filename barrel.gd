extends RigidBody2D

@export var velocityIdeal: Vector2

var entered: bool
var startCheckingBodies: bool
var active: bool = false
var playerStorage

@onready var barrelArea = %BarrelArea2D
var collideWithPlayer: bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(entered and Input.is_action_just_pressed("interact") and global_transform.origin.distance_to(playerStorage.global_transform.origin) <= 180):
		active = true
		print("HERE")
	if(startCheckingBodies):
		var bodiesTemp = barrelArea.get_overlapping_bodies()
		for i in bodiesTemp:
			if(i.name.contains("Character")):
				collideWithPlayer = true
	if(active):
		linear_velocity = velocityIdeal
	if(collideWithPlayer and active):
		linear_velocity = Vector2(0, 0)
func _on_barrel_area_2d_body_entered(body):
	if(body.name.contains("Character")):
		playerStorage = body
		entered = true


func _on_barrel_area_2d_body_exited(body):
	if(body.name.contains("Character") and active):
		startCheckingBodies = true
