extends Camera2D

@export var targets: Array[Node2D]
@export var boundary_top_left: Vector2 = Vector2(-1000, -1000)  # Define the top-left corner of the boundary
@export var boundary_bottom_right: Vector2 = Vector2(1000, 1000)  # Define the bottom-right corner of the boundary
@export var min_zoom: float = 0.5  # Define the minimum zoom level
@export var max_zoom: float = 2.0  # Define the maximum zoom level

var target_pos: Vector2 = Vector2.ZERO

func _ready() -> void:
	# Set initial zoom to the maximum zoom level for testing
	zoom.x = max_zoom
	zoom.y = max_zoom

func _process(delta: float) -> void:
	target_pos = Vector2.ZERO

	# Calculate the average position of all targets
	for i in targets:
		target_pos += i.position / len(targets)

	var max_distance: Vector2 = Vector2.ZERO

	# Calculate the maximum distance between targets on the x-axis
	targets.sort_custom(func(a, b): return a.position.x > b.position.x)
	max_distance.x = (targets[0].position.x - targets[-1].position.x)
	
	# Calculate the maximum distance between targets on the y-axis
	targets.sort_custom(func(a, b): return a.position.y > b.position.y)
	max_distance.y = (targets[0].position.y - targets[-1].position.y)

	# Adjust the zoom based on the maximum distances between the players
	zoom.x = min(600.0 / max_distance.x, max_zoom)
	zoom.y = min(336.0 / max_distance.y, max_zoom)

	# Make sure zoom is uniform
	if zoom.x > zoom.y:
		zoom.x = zoom.y
	if zoom.y > zoom.x:
		zoom.y = zoom.x

	# Clamp the zoom to the defined min and max limits
	zoom.x = clamp(zoom.x, min_zoom, max_zoom)
	zoom.y = clamp(zoom.y, min_zoom, max_zoom)

	# Clamp the position to keep it within the defined boundary
	position = target_pos
	position.x = clamp(position.x, boundary_top_left.x, boundary_bottom_right.x)
	position.y = clamp(position.y, boundary_top_left.y, boundary_bottom_right.y)
