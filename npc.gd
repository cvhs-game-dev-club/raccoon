extends Node2D


@export var dialoge: Array[String] = ["SHIFT to talk"]

var ticker: int = 0
var ticker2: int = 0
var target_text: String


func _ready() -> void:
	target_text = dialoge[0]


func _process(delta: float) -> void:
	if $Label.visible == true:
		if Input.is_action_just_pressed("interact") and ticker+1 < len(dialoge):
			$timer.start()
			$Label.text = ""
			ticker += 1
			target_text = dialoge[ticker]
	

func _on_area_2d_body_entered(body:Node2D) -> void:
	$Label.visible = true


func _on_area_2d_body_exited(body:Node2D) -> void:
	$Label.visible = false


func _on_timer_timeout() -> void:
	if $Label.visible == true and $Label.text != target_text:
		$Label.text += target_text[ticker2]
		ticker2 += 1
		$timer.start()
