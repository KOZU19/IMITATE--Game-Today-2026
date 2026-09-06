extends Node3D
var time = 0
var seconds= 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time += delta
	seconds = int(time)
	if seconds == 5:
		$Dialog/Label.text="Woahhh bahut sundar hai"
		#await get_tree().create_timer(2.0).timeout
		#$Dialog/Label.text="Finally we reached Shillong!!"
		await get_tree().create_timer(2.0).timeout
		$Dialog/Label.text="Guys lets take a group pic over there! The view is so cool"
		await get_tree().create_timer(2.0).timeout
		$Dialog/Label.text="sure"
		await get_tree().create_timer(10.0).timeout
		$Dialog/Label.text="well the others seems to explore around, maybe let's just take some walks around "
		await get_tree().create_timer(2.0).timeout
		$Dialog/Label.text="Taheera! Hey ive been thinking just to leave this friend group, you know i-"
		await get_tree().create_timer(2.0).timeout
		$Dialog/Label.text= "Taheera, Shweta come here!! Let's go back to the cab"
		await get_tree().create_timer(2.0).timeout
		$Dialog/Label.text="Uhh nevermind, let's go there!"
		await get_tree().create_timer(2.0).timeout
		get_tree().change_scene_to_file("res://Scene/otw Police Bazaar.tscn")
		
