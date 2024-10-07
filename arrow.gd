extends Node2D

var entered: bool = false
var playerStorage

@onready var arrow = %Arrow
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if(entered):
		arrow.visible = true
		arrow.global_transform.origin.x = playerStorage.global_transform.origin.x
	else:
		arrow.visible = false


func _on_air_area_2d_body_entered(body):
	print("ENTERED AIR")
	if(body.name.contains("Character")):
		#print("ENTERED AIR")
		entered = true
		playerStorage = body


func _on_air_area_2d_body_exited(body):
	print("EXITED AIR")
	entered = false
