extends Area2D

@export var Door: CollisionShape2D
# This is a flag to check if a character is standing on the button
var is_pressed = false
@onready var button_door: StaticBody2D = $ButtonDoor

# Signal handler for when a body enters the button area
func _on_body_entered(body):
	if body.name.contains("Character"):
		is_pressed = true
		$"../ButtonDoor/CollisionShape2D".set_deferred("disabled", true)
		print("disable")
		

# Signal handler for when a body exits the button area
func _on_body_exited(body):
	if body.name.contains("Character"):
		is_pressed = false
		$"../ButtonDoor/CollisionShape2D".set_deferred("disabled", false)
