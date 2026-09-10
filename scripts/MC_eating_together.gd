extends CharacterBody3D
@export var speed := 5.0
var can_move = true
@export var mouse_sensivity :=0.003
var camera_yaw := 0.0
@onready var imitate_event: Area3D = $"../ImitateEvent"
@onready var cool_down_timer: Label = $"../CoolDown_timer"

func _physics_process(delta):
	if Stats.Anxiety >= 70:
		return
		print("cant move")
	if can_move:
		var input := Input.get_vector(
			"ui_left",
			"ui_right",
			"ui_up",
			"ui_down"
		)
		var dir := Vector3(input.x, 0, input.y)
		velocity.x = dir.x *speed
		velocity.z = dir.z *speed
	else:
		velocity.x = 0
		velocity.z = 0	
		
	if Input.is_action_pressed("pose1"):
		if imitate_event.cooldown_time <= 0.0:
			$AnimatedSprite3D.play("idle_exp")
			imitate_event.try_pose(1)
	elif Input.is_action_pressed("pose2"):
		if imitate_event.cooldown_time <= 0.0:
			$AnimatedSprite3D.play("squat_exp")
			imitate_event.try_pose(2)
	elif Input.is_action_pressed("pose3"):
		if imitate_event.cooldown_time <= 0.0:
			$AnimatedSprite3D.play("take_a_pic_exp")
			imitate_event.try_pose(3)
	elif Input.is_action_pressed("pose4"):
		if imitate_event.cooldown_time <= 0.0:
			$AnimatedSprite3D.play("hand_on_waist_exp")	
			imitate_event.try_pose(4)
	elif velocity.length()>0:
		$AnimatedSprite3D.play("idle_exp")
	move_and_slide()
func _input(event: InputEvent) -> void:	
	if event is InputEventMouseMotion:
		camera_yaw -= event.relative.x *mouse_sensivity
		$"Camera Pivot".rotation.y = camera_yaw
		camera_yaw =  clamp(
			camera_yaw, deg_to_rad(-90),
			deg_to_rad(90)
		)
func _ready() -> void:
	$AnimatedSprite3D.play("idle_exp")
