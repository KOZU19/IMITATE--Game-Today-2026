
extends CharacterBody3D
@export var speed := 5.0
var can_move = true
@export var mouse_sensivity :=0.003
var camera_yaw := 0.0
func _physics_process(delta):
	
	if Input.is_action_pressed("pose1"):
		$AnimatedSprite3D.play("idle_eat")
	if Input.is_action_pressed("pose2"):
		$AnimatedSprite3D.play("artbook_eat")
	if Input.is_action_pressed("pose3"):
		$AnimatedSprite3D.play("look_phone_eat")
	if Input.is_action_pressed("pose4"):
		$AnimatedSprite3D.play("hand_on_chin_eat")		
	
func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.keycode == KEY_ESCAPE and event.pressed:
			if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
				Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
			else:
				Input.mouse_mode = Input.MOUSE_MODE_CAPTURED	
	if event is InputEventMouseMotion:
		camera_yaw -= event.relative.x *mouse_sensivity
		$"Camera Pivot".rotation.y = camera_yaw
		camera_yaw =  clamp(
			camera_yaw, deg_to_rad(-45),
			deg_to_rad(45)
		)
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
