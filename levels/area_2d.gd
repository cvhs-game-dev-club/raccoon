extends Area2D
var entered: bool = false
var playerStorage

@export var groundPath: NodePath

@onready var ground = get_node(groundPath)



# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#leverRight.visible = true
	#leverUp.visible = true
	#leverLeft.visible = true
	if(entered):
		ground.check = true


func _on_body_entered(body):
	if(body.name.contains("Character")):
		print("ENTERAIWIUYYHKFDS")
		entered = true
		playerStorage = body
