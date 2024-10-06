extends Node2D

@export var rSneakyPath: NodePath
@export var rLoverPath: NodePath
@export var rTallPath: NodePath

@onready var rSneaky = get_node(rSneakyPath)
@onready var rLover = get_node(rLoverPath)
@onready var rTall = get_node(rTallPath)

var counter: int = 0
var characterArr: Array

# Called when the node enters the scene tree for the first time.
func _ready():
	characterArr = [rSneaky, rLover, rTall]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for i in characterArr:
		if(i.onSomeHead):
			counter += 1
	if(counter == 2):
		print("COAT TIME")
	else:
		counter = 0
