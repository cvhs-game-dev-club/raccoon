extends Node

var current = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("rotate_foward"):
		if (current == 3):
			current = 1
		else:
			current += 1
	if Input.is_action_just_pressed("rotate_backward"):
		if (current == 1):
			current = 3
		else:
			current -= 1
	pass
