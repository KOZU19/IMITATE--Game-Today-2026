class_name Experience extends Node
var current_experience = 3
@onready var shreesta: AnimatedSprite3D = $Shreesta/AnimatedSprite3D
enum Context {
	EXPLORE,
	TRAVEL,
	SIT
}
var context_opt = {
	Context.EXPLORE: ["idle", "Squat", "leaning", "take pic", "i"],
	Context.TRAVEL : ["look_phone", "sleep", "hand_on_chin", "idle"],
	Context.SIT: ["look_phone", "open_artbook", "hand_on_chin", "idle"]
}
#
#var exp ={
	 ##in the car
	#
	#1: {"con": Context.TRAVEL,
		#"pose" : "sit",
		#"can_move" : false},
	##eat	
	#2: {"con": Context.SIT,
		#"pose" : "sit",
		#"can_move" : false},
	##lake	
	#3: {"con": Context.EXPLORE,
		#"pose" : "stand",
		#"can_move" : true},	
	##police	
	#4: {"con": Context.EXPLORE,
		#"pose" : "stand",
		#"can_move" : true}				
#}
