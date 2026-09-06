extends Node3D
var time=0
var seconds
func _ready() -> void:
	$Dialog.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time += delta
	seconds= int(time)
	if seconds == 5:
		$Dialog.show()
		$Dialog/Label.text = "Next we go to police bazaar, it'll take us about 50 minutes"
		await get_tree().create_timer(3.0).timeout
		$Dialog/Label.text = "Anyways guys.. we've made like 6 games together, do you guys want to turn us into an actual studio or something?"
		await get_tree().create_timer(3.0).timeout
		$Dialog/Label.text = "Uhmm for me im not sure yet you know, i'm thinking of pairing up with someone else actually, but for now sure"
		await get_tree().create_timer(3.0).timeout
		$Dialog/Label.text = "Same here"
		await get_tree().create_timer(3.0).timeout
		$Dialog/Label.text = "Well i need to say something too, duh realTaheera seems like she doesn't wanna continue with them though.
		What shall i say?"
		$Dialog/Button.show()
		$Dialog/Button2.show()
		$Dialog/Button.text="for me, same i dont think i wanna continue it with y'all"
		$Dialog/Button2.text = "Hmm Swetha, if you want to pair up with me i'll help"
		

func _on_button_pressed() -> void:
	$Dialog/Label.text="for me, same i dont think i wanna continue it with y'all"
	$Dialog/Button.hide()
	$Dialog/Button2.hide()
	await get_tree().create_timer(3.0).timeout
	$Dialog/Label.text = "Uhhh then it's okay guys..."
func _on_button_2_pressed() -> void:
	$Dialog/Label.text="Hmm Swetha, if you want to pair up with me i'll help"
	$Dialog/Button.hide()
	$Dialog/Button2.hide()
	await get_tree().create_timer(3.0).timeout
	$Dialog/Label.text = "Uhhh then it's okay guys..."
