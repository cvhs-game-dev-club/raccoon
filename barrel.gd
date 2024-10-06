extends RigidBody2D

@export var velocityIdeal: float = 200.0  # Speed of the barrel
var entered: bool = false
var playerStorage

@onready var barrelArea = $BarrelArea2D
var collideWithPlayer: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if entered and collideWithPlayer:
		var push_direction = Vector2.ZERO
		
		# Check for directional input to determine push direction
		if Input.is_action_pressed("ui_right"):
			push_direction.x += .5
		if Input.is_action_pressed("ui_left"):
			push_direction.x -= 1
			
		if push_direction != Vector2.ZERO:
			push_direction = push_direction.normalized()  # Normalize the direction
			linear_velocity = push_direction * velocityIdeal  # Move the barrel
		else:
			linear_velocity = Vector2.ZERO  # Stop moving if no input

	# Update the collision state
	if entered:
		var bodiesTemp = barrelArea.get_overlapping_bodies()
		collideWithPlayer = false
		for body in bodiesTemp:
			if body.name.contains("Character"):
				collideWithPlayer = true
				playerStorage = body  # Store reference to the player

func _on_barrel_area_2d_body_entered(body):
	if body.name.contains("Character"):
		entered = true

func _on_barrel_area_2d_body_exited(body):
	if body.name.contains("Character"):
		entered = false
		linear_velocity = Vector2.ZERO  # Stop the barrel when the player exits
