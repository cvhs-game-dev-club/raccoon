extends Node2D

var entered: bool = false
var playerStorage

@export var groundPath: NodePath

@onready var ground = get_node(groundPath)

@onready var up = %up
@onready var down = %down

var buttonArr: Array
var arrIndex: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	buttonArr = [up, down]
	buttonArr[0].visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#leverRight.visible = true
	#leverUp.visible = true
	#leverLeft.visible = true
	if(entered and Input.is_action_just_pressed("interact") and global_transform.origin.distance_to(playerStorage.global_transform.origin) <= 40):
		ground.check = true
		for i in buttonArr:
			i.visible = false
		buttonArr[1].visible = true


func _on_button_area_2d_body_entered(body):
	if(body.name.contains("Character")):
		entered = true
		playerStorage = body
