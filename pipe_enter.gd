extends Node2D

var dontEnterAgain: bool = false

@export var pipeExitPath: NodePath

@onready var pipeExitlocation = %PipeEnterArea2D
@onready var pipeExit = get_node(pipeExitPath)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pipe_enter_area_2d_body_entered(body):
	if(body.name.contains("Character") and !dontEnterAgain):
		body.global_transform.origin = pipeExit.pipeExitlocation.global_transform.origin
		pipeExit.dontEnterAgain = true


func _on_pipe_enter_area_2d_body_exited(body):
	if(body.name.contains("Character") and dontEnterAgain):
		dontEnterAgain = false
