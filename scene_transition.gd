extends Node2D


signal done

var exitting = false

func _ready() -> void:
	$animation_player.play("enter")


func play() -> void:
	exitting = true
	$animation_player.play_backwards('enter')

func _on_animation_player_animation_finished(anim_name:StringName) -> void:
	if exitting:
		done.emit()
