extends CharacterBody3D
@export var speed := 5.0
var can_move = true
@export var mouse_sensivity :=0.003
var camera_yaw := 0.0
func _physics_process(delta):
	if can_move:
			var input = Input.get_vector(
			"ui_left","ui_right","ui_up", "ui_down"
			)
			var dir = Vector3(input.x, 0, input.y)
			velocity.x = dir.x * speed
			velocity.z = dir.z * speed
			
	else:
		velocity.x = 0
		velocity.z = 0
	if Input.is_action_pressed("pose1"):
		$AnimatedSprite3D.play("idle_exp")
	if Input.is_action_pressed("pose2"):
		$AnimatedSprite3D.play("squat_exp")
	if Input.is_action_pressed("pose3"):
		$AnimatedSprite3D.play("take_a_pic_exp")
	if Input.is_action_pressed("pose4"):
		$AnimatedSprite3D.play("hand_on_waist_exp")	
	if velocity:		
		$AnimatedSprite3D.play("idle_exp")	
	move_and_slide()
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
			camera_yaw, deg_to_rad(-160),
			deg_to_rad(160)
		)
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	$AnimatedSprite3D.play("idle_exp")
