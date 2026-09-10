extends Node2D
@export var vn: Control
@export var dialogue_text: Label
@export var observation: Node2D
var dialogue:= [
	"aaaaaaa", "masih blom tau", "observation", "capek dah"
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
	var current_line : String= dialogue[dialogue_index]
	if current_line == "observation":
		vn.visible = false
		observation.visible = true
		return
	
	dialogue_text.text = current_line
func next_dialogue():
	dialogue_index += 1
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
