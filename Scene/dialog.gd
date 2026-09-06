extends Control
func _ready() -> void:
	
	$Button.hide()
	$Button2.hide()
		
func type_text(text):
	$Label.text=""
	for i in range(text.length()):
		$Label.text = text.substr(0, i + 1)
		await get_tree().create_timer(0.05).timeout


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_a_pressed() -> void:
	Stats.suspicion += 5
	$Button.hide()
	$Button2.hide()
	$ColorRect.show()
	$Label.show()
	$NameLabel.text="Taheera"
	await type_text("Probably a 2d artist, i'm trying to build my portfolio currently")
	await get_tree().create_timer(2.0).timeout
	await type_text("It's okay")
	await get_tree().create_timer(2.0).timeout
	$".".hide()
	await get_tree().create_timer(10.0).timeout
	$".".show()
	type_text("Pooja how long left to reach Shillong?")
	await get_tree().create_timer(2.0).timeout
	type_text("Still around 1.5 hour left to reach the Police Bazaar.
	But we are stopping at the Umiam Lake first for now")
	 
	await get_tree().create_timer(2.0).timeout
	get_tree().change_scene_to_file("res://Scene/Umiam_lake.tscn")
func _on_button_b_pressed() -> void:
	$Button.hide()
	$Button2.hide()
	$ColorRect.show()
	$Label.show()
	Stats.friendship +=5
	$NameLabel.text="Taheera"
	await type_text("Uhh i dont know yet actually, you know me, maybe i just wanna do everything?")
	await get_tree().create_timer(2.0).timeout
	await type_text("It's okay")
	await get_tree().create_timer(2.0).timeout
	$".".hide()
	await type_text("Now its the awkward time, what should i do?")
	await get_tree().create_timer(10.0).timeout
	$".".show()
	await type_text("Pooja how long left to reach Shillong?")
	await get_tree().create_timer(2.0).timeout
	await type_text("Still around 1.5 hour left to reach the Police Bazaar.
	But we are stopping at the Umiam Lake first for now")
	 
	await get_tree().create_timer(2.0).timeout
	get_tree().change_scene_to_file("res://Scene/Umiam_lake.tscn")
	
