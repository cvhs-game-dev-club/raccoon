extends Node2D


var entered: bool = false
var playerStorage

@onready var leverLeft = %leverLeft
@onready var leverUp = %leverUp
@onready var leverRight = %leverRight

var leverArr: Array
var arrIndex: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	leverArr = [leverLeft, leverUp, leverRight]
	leverArr[0].visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#leverRight.visible = true
	#leverUp.visible = true
	#leverLeft.visible = true
	if(entered and Input.is_action_just_pressed("interact") and global_transform.origin.distance_to(playerStorage.global_transform.origin) <= 40 and playerStorage.index == Global.current):
		for i in leverArr:
			i.visible = false
		arrIndex += 1
		if(arrIndex > 2):
			arrIndex = 0
		leverArr[arrIndex].visible = true


func _on_lever_area_2d_body_entered(body):
	if(body.name.contains("Character")):
		entered = true
		playerStorage = body
	
