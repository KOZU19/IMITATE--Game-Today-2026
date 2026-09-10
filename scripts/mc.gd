extends CharacterBody3D
@export var speed := 5.0
var can_move = true
@export var mouse_sensivity :=0.003
var camera_yaw := 0.0
@onready var imitate_event: Area3D = $"../ImitateEvent"
@onready var cool_down_timer: Label = $"../CoolDown_timer"
var idle_time := 0.0
@export var idle_limit := 10.0
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
		if input.length()>0:
			idle_time = 0.0
		else:
			idle_time+= delta	
	else:
		velocity.x = 0
		velocity.z = 0	
	
	if Input.is_action_pressed("pose1"):
		if Stats.Anxiety >= 50:
			return
		if imitate_event.cooldown_time <= 0.0:
			idle_time = 0.0
			$AnimatedSprite3D.play("idle_exp")
			imitate_event.try_pose(1)
	elif Input.is_action_pressed("pose2"):
		if Stats.Anxiety >= 50:
			return
		if imitate_event.cooldown_time <= 0.0:
			idle_time = 0.0
			$AnimatedSprite3D.play("squat_exp")
			imitate_event.try_pose(2)
	elif Input.is_action_pressed("pose3"):
		if Stats.Anxiety >= 50:
			return
		if imitate_event.cooldown_time <= 0.0:
			idle_time = 0.0
			$AnimatedSprite3D.play("take_a_pic_exp")
			imitate_event.try_pose(3)
	elif Input.is_action_pressed("pose4"):
		if Stats.Anxiety >= 50:
			return
		if imitate_event.cooldown_time <= 0.0:
			idle_time = 0.0
			$AnimatedSprite3D.play("hand_on_waist_exp")	
			imitate_event.try_pose(4)
	elif velocity.length()>0:
		$AnimatedSprite3D.play("idle_exp")
	if idle_time >= idle_limit:
		show_idle_warning()	
	move_and_slide()
func _input(event: InputEvent) -> void:	
	if event is InputEventMouseMotion:
		camera_yaw -= event.relative.x *mouse_sensivity
		camera_yaw =  clamp(
			camera_yaw, deg_to_rad(-20),
			deg_to_rad(20))
		$"Camera Pivot".rotation.y = camera_yaw	
		
func _ready() -> void:
	$"../Label".hide()
	$AnimatedSprite3D.play("idle_exp")
func show_idle_warning():
	print("udah work")
	$"../Label".show()
	await get_tree().create_timer(3.0).timeout
	$"../Label".hide()
	
