extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var someoneOnHead: bool = false
var onSomeHead: bool = false
var playerStorage

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var vent: Area2D 

@export var index : int = 0
@export var height : int = 30

func _physics_process(delta: float) -> void:
	# Add gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	if (Global.current == index):
		animation_player.play("select")
		$select.visible = true

		# Handle jump.
		if Input.is_action_just_pressed("ui_up") and is_on_floor() and !someoneOnHead:
			velocity.y = JUMP_VELOCITY

		# Handle movement input.
		var direction := Input.get_axis("ui_left", "ui_right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		if Input.is_action_just_pressed("ui_down") and vent.has_overlapping_bodies() and index == 3:
			$CollisionShape2D.disabled = true
	else:
		animation_player.play("idle_right")
		$select.visible = false
		
	if someoneOnHead and Global.current == index:
		# Align the character on top to the character below
		playerStorage.position.x = transform.origin.x
		playerStorage.position.y = transform.origin.y - playerStorage.height
	if (Global.current != index):
		velocity.x = 0
	move_and_slide()

	

func _on_area_2d_body_entered(body):
	if body.name.contains("Character") and body.index != index:
		someoneOnHead = true
		playerStorage = body
		playerStorage.onSomeHead = true

func _on_area_2d_body_exited(body):
	if body.name.contains("Character") and body.index != index:
		someoneOnHead = false
		playerStorage.onSomeHead = false
