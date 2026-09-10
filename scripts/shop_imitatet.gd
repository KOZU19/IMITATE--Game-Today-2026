extends Area3D
@onready var player = get_tree().get_first_node_in_group("player")

@export var event_duration := 45.0
@export var pose_cooldown := 3.0
@export var window_1_start := 0.0
@export var window_1_end :=  15.0
@export var window_2_start := 15.0
@export var window_2_end := 30.0
@export var window_3_start :=30.0
@export var window_3_end := 45.0
var idle_time := 0.0
@export var idle_limit := 10.0

@export var w1_pose1:={
	"suspicion":5,
	"friendship":5,
	"satisfaction": 5,
	"anxiety": 10
}
@export var w1_pose2:={
	"suspicion":5,
	"friendship":5,
	"satisfaction": 5,
	"anxiety": 10
}
@export var w1_pose3:={
	"suspicion":5,
	"friendship":5,
	"satisfaction": 5,
	"anxiety": 10
}
@export var w1_pose4:={
	"suspicion":1,
	"friendship":5,
	"satisfaction": 5,
	"anxiety": 10
}
@export var w2_pose1:={
	"suspicion":0,
	"friendship":10,
	"satisfaction": 5,
	"anxiety": 10
}
@export var w2_pose2:={
	"suspicion":0,
	"friendship":10,
	"satisfaction": 5,
	"anxiety": 10
}
@export var w2_pose3:={
	"suspicion":7,
	"friendship":10,
	"satisfaction": 5,
	"anxiety": 10
}
@export var w2_pose4:={
	"suspicion":0,
	"friendship":10,
	"satisfaction": 5,
	"anxiety": 10
}
@export var w3_pose1:={
	"suspicion":0,
	"friendship":10,
	"satisfaction": 5,
	"anxiety": 10
}
@export var w3_pose2:={
	"suspicion":0,
	"friendship":10,
	"satisfaction": 5,
	"anxiety": 10
}
@export var w3_pose3:={
	"suspicion":0,
	"friendship":10,
	"satisfaction": 5,
	"anxiety": 10
}
@export var w3_pose4:={
	"suspicion":0,
	"friendship":10,
	"satisfaction": 5,
	"anxiety": 10
}

var is_active:=true
var elapsed_time := 0.0
var cooldown_time := 0.0
var score := 0
var current_window := 0
@export var imitate_time := 45.0
@onready var timer: Timer = $Timer
@onready var ui = $Imitate_ui
func _on_body_entered(body: Node3D) -> void:
	if body is CharacterBody3D:
		start_imitate()
func start_imitate() -> void:
	is_active = true 
	print("imitate starts")
	elapsed_time = 0.0
	cooldown_time = 0.0
	score = 0
	ui.show()
	current_window= 1
func end_imitate()->void:
	if not is_active:
		return
	is_active = false
	print("imitate end")
	ui.hide()
	get_tree().change_scene_to_file("res://Scene/Experience/eating.tscn")

func choose_pose(pose_name: String)->void:
	if not is_active:
		return
	print("player choose", pose_name)	
	
func _on_timer_timeout() -> void:
	if not is_active:
		return
	print("timeout")
	await get_tree().create_timer(1.5).timeout
	end_imitate()
func _process(delta):
	if Stats.Anxiety >= 50:
		$"../Anxiety_notice".show()
	else:
		$"../Anxiety_notice".hide()	
	var cooldown_text = int(cooldown_time)
	if not is_active:
		return
	elapsed_time += delta	
	if cooldown_time > 0.0:
		cooldown_time -= delta
	update_window()
	if elapsed_time >= event_duration:
		end_imitate()
func update_window()-> void:
	if elapsed_time >= window_1_start and elapsed_time <window_1_end:
		if current_window != 1:
			current_window  =1
		return

	if elapsed_time >= window_2_start and elapsed_time< window_2_end:		
		if current_window != 2:
			current_window = 2
		return
	if elapsed_time >= window_3_start and elapsed_time < window_3_end:		
		if current_window != 3:
			current_window = 3
		return	
func try_pose(pose_number:int)->void:
	if not is_active:
		return
	if cooldown_time > 0.0:
		print("pose ignored-cool down time")
		return
	var changes :Dictionary
	
	if current_window == 1:
		if pose_number ==1:
			changes = w1_pose1
		elif pose_number ==2:
			changes = w1_pose2
		elif pose_number == 3:
			changes = w1_pose3
		elif pose_number == 4:
			changes = w1_pose4
	if current_window == 2:
		if pose_number ==1:
			changes = w2_pose1	
		elif pose_number ==2:
			changes = w2_pose2	
		elif pose_number ==3:
			changes = w2_pose3
		elif pose_number ==4:
			changes = w2_pose4		
	if current_window == 3:
		if pose_number ==1:
			changes = w3_pose1	
		elif pose_number ==2:
			changes = w3_pose2	
		elif pose_number ==3:
			changes = w3_pose3
		elif pose_number ==4:
			changes = w3_pose4							
	if changes.is_empty():
		return
	Stats.suspicion += changes["suspicion"]
	Stats.friendship += changes["friendship"]
	Stats.satisfaction += changes["satisfaction"]
	Stats.Anxiety += changes["anxiety"]
	cooldown_time = pose_cooldown
	
	cooldown_time = pose_cooldown
	
func _ready():
	pass


	
