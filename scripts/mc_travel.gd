
extends CharacterBody3D
@export var speed := 5.0
var timer:float = 0.0
var can_move = true
@export var mouse_sensivity :=0.003
var camera_yaw := 0.0

func _physics_process(delta):
	
	if Input.is_action_pressed("pose1"):
		$AnimatedSprite3D.play("idle_tra")
	if Input.is_action_pressed("pose2"):
		$AnimatedSprite3D.play("sleep_tra")
	if Input.is_action_pressed("pose3"):
		$AnimatedSprite3D.play("look_phone_tra")
	if Input.is_action_pressed("pose4"):
		$AnimatedSprite3D.play("hand_on_chin_tra")		
	
func _input(event: InputEvent) -> void:
	var sec = int(timer)
	if sec <= 15:
			
		if Input.is_action_pressed("pose1"):
			$AnimatedSprite3D.play("idle_tra")
			Stats.suspicion +=5
			
		if Input.is_action_pressed("pose2"):
			$AnimatedSprite3D.play("sleep_tra")
			Stats.satisfaction+=5
		if Input.is_action_pressed("pose3"):
			$AnimatedSprite3D.play("look_phone_tra")
		if Input.is_action_pressed("pose4"):
			$AnimatedSprite3D.play("hand_on_chin_tra")		
		
		
		
func _ready() -> void:
	
	$AnimatedSprite3D.play("idle_tra")
