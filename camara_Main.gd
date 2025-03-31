extends Camera3D

@export var move_speed: float = 0.01
@export var zoom_speed: float = 0.5
@export var min_zoom: float = 30.0
@export var max_zoom: float = 90.0

@export var min_x: float = -10.0
@export var max_x: float = 10.0
@export var min_z: float = -10.0
@export var max_z: float = 10.0

var last_touch_position := Vector2()
var dragging := false
var last_distance := 0.0

func _input(event):
	if event is InputEventMouseMotion and dragging:
		var delta = event.relative
		position.x = clamp(position.x - delta.x * move_speed, min_x, max_x)
		position.z = clamp(position.z - delta.y * move_speed, min_z, max_z)
	
	elif event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			dragging = event.pressed
			if dragging:
				last_touch_position = event.position
	
	elif event is InputEventMagnifyGesture:
		var zoom_amount = event.factor * zoom_speed
		fov = clamp(fov - zoom_amount, min_zoom, max_zoom)

func _ready():
	rotation_degrees.x = -30
