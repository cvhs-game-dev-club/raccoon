extends Node2D

@onready var doorCollider = %DoorCollision

func _on_door_area_2d_body_entered(body):
	if(body.name.contains("SneakyCharacter")):
		if(body.holdItemName.contains("key")):
			print("OPEN DOOR")
			doorCollider.disabled = true
