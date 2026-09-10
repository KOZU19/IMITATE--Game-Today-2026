extends Control

@onready var control: Control = $Control

@onready var speaker_label: Label = $Control/SpeakerLabel
@onready var dialog_label_1: Label = $Control/DialogLabel1
@onready var next_button: Button = $"Control/Next Button"
@onready var choice_container: Control = $Choice_container


var current_id := "beginning"


var story = [
	{
		"id": "beginning",
		"type": "dialogue",
		"speaker": "Tahira",
		"text": "So wuttt?",
		"expression": "smile",
		"next": "pooja_talks"
	},

	{
		"id": "pooja_talks",
		"type": "dialogue",
		"speaker": "Pooja",
		"text": "idk mann?",
		"next": "second"
	},

	{
		"id": "second",
		"type": "choice",
		"choices": [
			{
				"text": "This is first choice",
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
	get_tree().change_scene_to_file("res://Scene/Obs_police_bazaar.tscn")
