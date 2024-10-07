extends Node2D

var previousPos: float
var rotationOG = rotation
var locationIdeal: float = 0
var entered: bool = false
var playerStorage
var previousPlatformPos: float

@export var locationLeft: float
@export var locationMid: float
@export var locationRight: float

@export var leverPath: NodePath

@onready var lever = get_node(leverPath)
@onready var platform = %platformPhys

# Called when the node enters the scene tree for the first time.
func _ready():
	rotationOG = rotation


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if(lever.arrIndex == 0):
		platform.global_transform.origin.x = easyLerp(platform.global_transform.origin.x, locationLeft, 20, delta)
		locationIdeal = locationLeft
	if(lever.arrIndex == 1):
		platform.global_transform.origin.x = easyLerp(platform.global_transform.origin.x, locationMid, 20, delta)
		locationIdeal = locationMid
	if(lever.arrIndex == 2):
		platform.global_transform.origin.x = easyLerp(platform.global_transform.origin.x, locationRight, 20, delta)
		locationIdeal = locationRight
	if(abs(previousPos - platform.global_transform.origin.x) <= 0.1):
		#print(previousPos, platform.global_transform.origin.x)
		rotation = rotationOG
	else:
		if(abs(locationIdeal - platform.global_transform.origin.x) >= 1):
			if(previousPos > platform.global_transform.origin.x):
				rotation = rotationOG - deg_to_rad(3.5)
			if(previousPos < platform.global_transform.origin.x):
				rotation = rotationOG + deg_to_rad(3.5)
	previousPos = platform.global_transform.origin.x
	if(entered and global_transform.origin.distance_to(playerStorage.global_transform.origin) <= 80):
		playerStorage.global_transform.origin.x += platform.global_transform.origin.x - previousPlatformPos 
	previousPlatformPos = platform.global_transform.origin.x
func easyLerp(from: float, to: float, weight: float, delta: float):
	from = move_toward(from, to, weight * delta)
	return from

func _on_platform_area_2d_body_entered(body):
	entered = true
	playerStorage = body
	
