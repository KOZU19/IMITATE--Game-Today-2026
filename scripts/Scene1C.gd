extends Node2D
@export var vn: Control
@export var dialogue_text: Label
@onready var button: Button = $VN/Button
@onready var background: TextureRect = $Background
@onready var character: TextureRect = $Character

@export var observation: Node2D
var dialogue:= [
	{"speaker": "Sreestha",
		"text":"Now i gotta find a job again, but really tho..
	It's really a struggle with this condition" ,
	"character": "sreestha_normal",
	 "background":"bg_1" }, 
	{"speaker": "Sreestha",
		"text":"Honestly i'm jealous of all other people who can interact with others just fine" ,
	"character": "sreestha_normal",
	 "background":"bg_1" },
	{"speaker": "Sreestha",
		"text":"If possible, i wanna borrow their life for like a day or something...",
	 "background":"bg1" },
	{"speaker": "Sreestha",
		"text":"If possible, i wanna borrow their life for like a day or something...",
	 "background":"bg1" },
	{"speaker": "Sreestha",
		"text":"I want to experience how it feels to live a life like a normal people....",
	 "background":"bg1" },
	{"speaker": "Sreestha",
		"text":"Hey i'm Taheera, what's your name?",
	 "background":"bg2" },
	{"speaker": "Sreestha",
		"text":"Hmm hi im Sreestha",
	 "background":"bg2" },
	{"speaker": "Sreestha",
		"text":"um sorry for eavesdropping.. but uh wanna borrow my life?",
	 "background":"bg2" },
	{"speaker": "Sreestha",
		"text":"uhmm ehh i was just joking about that",
	 "background":"bg2" },
	{"speaker": "Sreestha",
		"text":"no seriously.. you can if you want",
	 "background":"bg2" },
	{"speaker": "Sreestha",
		"text":"actually tommorow i have an upcoming trip with my friend,
	but well i'm too lazy honestly",
	 "background":"bg2" },
	{"speaker": "Sreestha",
		"text":"so i would be very glad if someone able to replace me there haha",
	 "background":"bg2" },
	{"speaker": "Sreestha",
		"text":"no seriously.. you can if you want",
	 "background":"bg2" },
	{"speaker": "Sreestha",
		"text":"You need money right?, how about..i'll give you 500 lakh
	if youre able to imitate me without getting caught?",
	 "background":"bg2" },
	{"speaker": "Sreestha",
		"text":"hmm this seems like a good deal but is she serious about that?",
	 "background":"bg2" },
	{"speaker": "Sreestha",
		"text":"are you serious about that?",
	 "background":"bg2" },
	{"speaker": "Sreestha",
		"text":"Of course, you want to? The rules is simple, i won't give you any clue..
	You have to observe me all yourself, if youre able to the money is yours",
	 "background":"bg2" },
	{"speaker": "Sreestha",
		"text":"but well.. if not then the money's gone, but it's such a good deal right?",
	 "background":"bg2" },
	{"speaker": "Sreestha",
		"text":"it's true.., i do need the money to keep living here on my own",
	 "background":"bg2" },
	{"speaker": "Sreestha",
		"text":"okay sure i'll take the deal",
	 "background":"bg2" },
	{"speaker": "Sreestha",
		"text":"Great then!",
	 "background":"bg2" },
	{"speaker": "Sreestha",
		"text":"Okay so now i need to observe her ",
	 "background":"bg2" },
	"observation", 
	{"speaker": "Sreestha",
		"text":"Hey Sreestha? Do you hear me?",
	 "background":"bg2" },
	{"speaker": "Sreestha",
		"text":"Uh-huh yeahh?",
	 "background":"bg2" },
	{"speaker": "Sreestha",
		"text":"Don't forget, tommorow at the Police Bazaar at 10 am",
	 "background":"bg2" },
	{"speaker": "Sreestha",
		"text":"See ya, contact me again after the trip, for your reward.. well if you make it",
	 "background":"bg2" }
]

var dialogue_index := 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	observation.visible = false
	show_dialogue()
func show_dialogue() ->void:
	if dialogue_index >= dialogue.size():
		finish_1c()
		return
	var current_line = dialogue[dialogue_index]
	if current_line is String and current_line== "observation":
		vn.visible = false
		observation.visible = true
		return
	if current_line is String:
		dialogue_text.text = current_line
	elif current_line is Dictionary:
		dialogue_text.text = str(current_line["text"])
		if current_line.has("character"):
			show_character(current_line["character"])
		if current_line.has("background"):
			show_bg(current_line["background"])	
func show_character(character_name: String):
		match character_name:
			"sreestha_normal":
				character.texture = preload("res://sprite/VN-chara/S_normal.png")
			"sreestha_smile":
				character.texture = preload("res://sprite/VN-chara/S_smile.png")
			"sreestha_confuse":
				character.texture = preload("res://sprite/VN-chara/S_confuse.png")
			"sreestha_thinking":
				character.texture = preload("res://sprite/VN-chara/S_thinking.png")	
			"Taheera_worried":
				character.texture  =preload("res://sprite/VN-chara/T_worried.png")			
			"Taheera_smile":
				character.texture  =preload("res://sprite/VN-chara/T_worried.png")
			"Taheera_close_eyes":
				character.texture  =preload("res://sprite/VN-chara/T_close_eyes.png")		
func show_bg(background_type: String):
	match background_type:
		"bg_1":
			background.texture = preload("res://sprite/Game/bg1.png")
		"bg_2":
			background.texture = preload("res://sprite/Game/bg2.png")
func next_dialogue():
	dialogue_index+=1
	show_dialogue()
#func start_observation(observation_number: int) -> void:
	#vn.visible =  false
	#observation.visible  = true
	#dialogue_index += 1 
	#show_dialogue()
	
func finish_1c() -> void:
	print("finish")
	get_tree().change_scene_to_file("res://Scene/Experience/berangkat.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_next_button_pressed() -> void:
	next_dialogue()
func observation_finished():
	print("parent finished")

	observation.visible = false
	print("obs visible:", observation.visible)
	
	vn.visible = true
	print("vn visible:", vn.visible)
	
	
	dialogue_index += 1
	print("index: ", dialogue_index)
	#get_tree().change_scene_to_file("res://Scene/Scene1C.tscn")
	show_dialogue()
