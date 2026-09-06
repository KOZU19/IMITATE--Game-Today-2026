extends Control
@export_category("Dialogue")
@export_multiline var dia : String = ""
@export var dia_separator: String="---"


@export_category("typing")
@export_range(0.001, 1.0, 0.001)
var typing_speed : float = 0.05
@export_range(0.0, 2.0, 0.01)
var punc_del :float = 0.2

@export_category("Input")
@export var allow_mouse_click:bool = true 
@export var allow_space:bool= true
@export var allow_enter:bool=true

@export_category("Audio")
@export var typing_sound: AudioStream

var dialogue: Array[String]=[]
var current_dialogue: int = 0
var current_character: int = 0
var current_ind:int = 0
var is_typing:bool= false
var dialogue_finished:bool =false
@onready var label: Label = $Label
@onready var timer: Timer = $Label/Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.one_shot=true
	label.text = ""
	prepare_dialogue()
	if dialogue.size() >0:
		start_typing()
func prepare_dialogue():
	dialogue.clear()
	var separated_dia := dia.split(dia_separator)
	for dia in separated_dia:
		var cleaned_text := dia.strip_edges()
		if cleaned_text != "":
			dialogue.append(cleaned_text)
		
func start_typing():
	if current_ind >= dia.length():
		return
	current_ind=0
	label.text=""
	is_typing = true
	dialogue_finished = false
	type_next_chara()
func type_next_chara():
	if current_dialogue >= dia.length():
		return
	var current_text : = dialogue[current_dialogue]
	if current_character >= current_text.length():
		fin_typing()
		return
		
	var chara := dia[current_ind]
	label.text += chara
	current_character +=1
	
	if typing_sound != null:
		var player := AudioStreamPlayer.new()
		add_child(player)
		player.stream = typing_sound
		player.play()
		player.finished.connect(player.queue_free)
	if chara in [".", ",", "!", "?", ":", ";"]:
		timer.start(punc_del)
	else:
		timer.start(typing_speed)	
func _on_timer_timeout() -> void:
	type_next_chara()
func fin_typing():
	timer.stop()
	var current_text := dialogue[current_dialogue]
	label.text= current_text
	current_character = current_text.length()
	label.text = dia
	current_ind = dia.length()
	is_typing= false
	
func next_dia():
	if current_dialogue+ 1 >=dialogue.size():
		print("wes bar")
		return
	current_dialogue += 1
	start_typing()	
	
func _input(event):	
	var pressed := false
	if allow_space and event.is_action_pressed("ui_accept"):
		pressed = true
	if allow_enter and event is InputEventKey:
		if event.pressed and event.keycode ==KEY_ENTER:
			pressed = true
	if allow_mouse_click and event is InputEventMouseButton:
			if event.pressed and event.buttonindex == MOUSE_BUTTON_LEFT:
				pressed = true
	if pressed:
		if is_typing:
			fin_typing()
		else:
			next_dia()	
