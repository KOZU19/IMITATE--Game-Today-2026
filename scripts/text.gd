extends Control

@export_multiline var dialogue_text: String = ""
@export var dialogue_separator: String = "---"

@export_category("Typing")
@export var typing_speed: float = 0.05
@export var punctuation_delay: float = 0.2

var dialogues= []
var dialogue_index: int = 0
var character_index: int = 0

var typing: bool = false

@onready var label: Label = $Label
@onready var timer: Timer = $Label/Timer


func _ready():
	
	timer.one_shot = true
	
	# Pisahkan semua dialogue berdasarkan ---
	dialogues = dialogue_text.split(dialogue_separator)
	
	# Buang dialogue kosong
	for i in range(dialogues.size() - 1, -1, -1):
		dialogues[i] = dialogues[i].strip_edges()
		
		if dialogues[i] == "":
			dialogues.remove_at(i)
	start_dialogue()
func start_dialogue():
	if dialogue_index >= dialogues.size():
		return
	character_index =0
	typing = true
	label.text = ""	
	type_next_character()


func type_next_character():
	
	var current_text = dialogues[dialogue_index]
	
	# Kalau semua karakter sudah diketik
	if character_index >= current_text.length():
		
		typing = false
		timer.stop()
		
		return
	
	# Ambil satu karakter
	var character = current_text[character_index]
	
	# Tambahkan karakter ke Label
	label.text += character
	
	character_index += 1
	
	# Tentukan delay
	if character in [".", ",", "!", "?", ":", ";"]:
		timer.start(punctuation_delay)
	else:
		timer.start(typing_speed)


func _on_timer_timeout():
	
	type_next_character()


func _unhandled_input(event):
	
	if event.is_action_pressed("ui_accept"):
		
		if typing:
			finish_current_dialogue()
		else:
			next_dialogue()


func _gui_input(event):
	
	if event is InputEventMouseButton:
		
		if event.button_index == MOUSE_BUTTON_LEFT:
			
			if event.pressed:
				
				if typing:
					finish_current_dialogue()
				else:
					next_dialogue()


func finish_current_dialogue():
	
	timer.stop()
	
	label.text = dialogues[dialogue_index]
	
	character_index = dialogues[dialogue_index].length()
	
	typing = false


func next_dialogue():
	
	dialogue_index += 1
	
	if dialogue_index < dialogues.size():
		start_dialogue()
	else:
		print("All dialogue finished!")
