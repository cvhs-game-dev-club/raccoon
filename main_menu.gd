extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_button_2_pressed() -> void:
	pass


func _on_button_pressed() -> void:
	$scene_transition.play()
	


func _on_scene_transition_done() -> void:
	get_tree().change_scene_to_file("res://default_layer.tscn")
