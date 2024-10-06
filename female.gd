extends Node2D

var playeInArea := false
var is_chatting := false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if playeInArea and Input.is_action_just_pressed("interact"):
		run_dialogic("female")
		


func _on_chat_detector_body_entered(body: Node2D) -> void:
	if (body.name.contains("Lover")):
		playeInArea = true
		
	
	pass # Replace with function body.


func _on_chat_detector_body_exited(body: Node2D) -> void:
	if (body.name.contains("Lover")):
		playeInArea = false
		
func run_dialogic(dialogue_string):
	is_chatting = true
	var layout = Dialogic.start(dialogue_string)
	layout.register_character(load("res://Dialogic/character.dch"), $Sprite2D/Marker2D)
