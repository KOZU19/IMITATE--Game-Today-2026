extends Control
@onready var background: TextureRect = $Background
@onready var character: TextureRect = $Character

@onready var control: Control = $Control

@onready var speaker_label: Label = $Control/SpeakerLabel
@onready var dialog_label_1: Label = $Control/DialogLabel1
@onready var next_button: Button = $"Control/Next Button"
@onready var choice_container: Control = $Choice_container


var current_id := "beginning"


var story = [
	{
		"id": "Baru Sampe",
		"type": "dialogue",
		"speaker": "Pooja",
		"text": "Taheera!!",
		"background": "right_side",
		"Character": "pooja_talks",
		"next":"pooja_talks"
	},

	{
		"id": "pooja_talks",
		"type": "dialogue",
		"text": "aaaaaaaa",
		"speaker": "Pooja",
		"background": "left_side",
		"character": "Taheera(Sreestha)",
		"next" : "second"
	},

	{
		"id": "second",
		"type": "choice",
		"character":"Swetha",
		"background": "left_side",
		"choices": [
			{
				"text": "Hey There!!!",
				"next": "dialog3",
				"changes": {
					"suspicion": 10,
					"friendship": 5,
					"satisfaction": 4,
					"anxiety": 7
				}
			},

			{
				"text": "This is second choice",
				"next": "dialog3",
				"changes": {
					"suspicion": 10,
					"friendship": 5,
					"satisfaction": 4,
					"anxiety": 7
				}
			},

			{
				"text": "This is third choice",
				"next": "dialog3",
				"changes": {
					"suspicion": 10,
					"friendship": 5,
					"satisfaction": 4,
					"anxiety": 7
				}
			}
		]
	},

	{
		"id": "dialog3",
		"type": "dialogue",
		"speaker": "Swetha",
		"text": "yeahhhh?",
		"next": ""
	}
]
func _ready() -> void:
	next_button.pressed.connect(_on_next_button_pressed)
	show_event(current_id)


func get_event(event_id: String) -> Dictionary:
	for event in story:
		if event["id"] == event_id:
			return event

	return {}

func show_event(event_id: String) -> void:
	current_id = event_id

	var event = get_event(event_id)

	if event.is_empty():
		return

	choice_container.hide()
	next_button.hide()

	if event["type"] == "dialogue":
		show_dialogue(event)

	elif event["type"] == "choice":
		show_choice(event)
	if event.has("background"):
		show_background(event["background"])
	if event.has("character"):
		show_character(event["character"])
func show_background(background_name: String) ->void:
	if background_name == "wait_1":
		background.texture = preload("res://sprite/Game/Untitled1283_20260911140535.png")
	if background_name == "wait_2":
		background.texture = preload("res://sprite/Game/Untitled1283_20260911140545.png")
	if background_name == "road":
		background.texture = preload("res://sprite/Game/Untitled1285_20260911144053.png")
	
func show_character(character_name: String)-> void:
	if character_name== "pooja_talk":
		character.texture = preload("res://sprite/VN-chara/Pooja_talk.png")
	if character_name== "pooja_smile":
		character.texture = preload("res://sprite/VN-chara/Pooja_smile.png")
	if character_name== "pooja_normal":
		character.texture = preload("res://sprite/VN-chara/Pooja_normal.png")	
	if character_name== "sreestha_normal":
		character.texture = preload("res://sprite/VN-chara/S_normal.png")		
	if character_name== "sreestha_smile":
		character.texture = preload("res://sprite/VN-chara/S_smile.png")	
	if character_name== "sreestha_thinking":
		character.texture = preload("res://sprite/VN-chara/S_thinking.png")		
	if character_name== "sreestha_confuse":
		character.texture = preload("res://sprite/VN-chara/S_confuse.png")	
	if character_name== "swetha_normal":
		character.texture = preload("res://sprite/VN-chara/Swetha_normal.png")	
	if character_name== "swetha_smile":
		character.texture = preload("res://sprite/VN-chara/swetha_smile.png")	
	if character_name== "anjali_normal":
		character.texture = preload("res://sprite/VN-chara/Anjali_normal.png")		
	if character_name== "anjali_smile":
		character.texture = preload("res://sprite/VN-chara/Anjali-smile.png")					
func show_dialogue(event: Dictionary) -> void:
	control.show()
	choice_container.hide()
	dialog_label_1.show()
	speaker_label.text= event["speaker"]
	dialog_label_1.text = event["text"]

	next_button.show()

	if event.has("expression"):
		show_expressions(event["expression"])
func show_expressions(expression_name: String) -> void:
	print("Expression:", expression_name)


func show_choice(event: Dictionary) -> void:
	control.hide()
	choice_container.show()
	dialog_label_1.hide()

	var choices = event["choices"]

	$Choice_container/Choice1.text = choices[0]["text"]
	$Choice_container/Choice2.text = choices[1]["text"]
	$Choice_container/Choice3.text = choices[2]["text"]


func select_choice(choice_index: int) -> void:
	var event = get_event(current_id)
	var choices = event["choices"]

	var selected_choice = choices[choice_index]
	var changes = selected_choice["changes"]

	Stats.suspicion += changes["suspicion"]
	Stats.friendship += changes["friendship"]
	Stats.satisfaction += changes["satisfaction"]
	Stats.Anxiety += changes["anxiety"]

	show_event(selected_choice["next"])


func _on_choice_1_pressed() -> void:
	select_choice(0)


func _on_choice_2_pressed() -> void:
	select_choice(1)


func _on_choice_3_pressed() -> void:
	select_choice(2)


func _on_next_button_pressed() -> void:
	var event = get_event(current_id)
	if event.has("next") and event["next"] != "":
		show_event(event["next"])
	else:
		end_vn()


func end_vn() -> void:
	print("VN END")
	get_tree().change_scene_to_file("res://Scene/Experience/Obs_police_bazaar.tscn")
