extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dialogue()

func type_text1(text):
	$Diabox1/Dia1.text = ""
	for i in range(text.length()):
		$Diabox1/Dia1.text = text.substr(0, i + 1)
		await get_tree().create_timer(0.05).timeout
func type_text2(text):
	$Diabox2/Dia2.text =""
	for i in range(text.length()):
		$Diabox2/Dia2.text = text.substr(0, i +1)
		await get_tree().create_timer(0.05).timeout
	
func dialogue():
	$Diabox1.position = $"Point 7".global_position
	await type_text1("aaaa")
	$Diabox2.position = $"Point 5".global_position
	await type_text2("maxiii")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
