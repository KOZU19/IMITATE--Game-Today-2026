class_name berangkat extends Node3D
var time  := 0.0
@export_category("dialog") 
@export var timer_per_lines = 2.0
var paused:= false
func _ready():
	show_scene()
	
func type_text(text):
	$Dialog/Label.text=""
	for i in range(text.length()):
		$Dialog/Label.text = text.substr(0, i + 1)
		await get_tree().create_timer(0.05).timeout
func _process(delta):
	
	time +=delta
	var seconds:int = time
func show_dialogue(text, suspicion_ch=0, friendship_ch = 0):
	await type_text(text)
	Stats.suspicion += suspicion_ch
	Stats.friendship +=suspicion_ch
	
func show_scene():
		
		$Dialog/NameLabel.text="Pooja"
		await show_dialogue("Hey Taheera!", 2, 5)
		await get_tree().create_timer(2.0).timeout
		$Dialog/NameLabel.text="Swetha"
		await show_dialogue("Heyyyy",1, 2)
		await get_tree().create_timer(2.0).timeout
		$Dialog/NameLabel.text="Taheera"
		await show_dialogue("Uhm- oh- eee- hey guyss", 5,1)
		await get_tree().create_timer(2.0).timeout
		$Dialog/NameLabel.text="Anjali"
		await show_dialogue("Hey Taheera! How's your project going?", 0, 3)
		await get_tree().create_timer(2.0).timeout
		$Dialog/NameLabel.text="Taheera"
		await show_dialogue("Ah-ummm it's going pretty well-i i suppose?", 10, -4)
		await get_tree().create_timer(2.0).timeout
		$Dialog/NameLabel.text="Anjali"
		await show_dialogue("Thats kinda weird hearing that from you, 
		are you alright?", 5, -3)
		await get_tree().create_timer(2.0).timeout
		$Dialog/NameLabel.text="Taheera"
		await show_dialogue("Uh-uhh yea im good, i'm good.", 10, 0)
		await get_tree().create_timer(2.0).timeout
		$Dialog/NameLabel.text="Pooja"
		await show_dialogue("Anyways guys, have u all decided what role you guys wanna pursue?.", 0, 0)
		await get_tree().create_timer(2.0).timeout
		$Dialog/NameLabel.text="Anjali"
		await show_dialogue("Well probably a game programmer even with my messy broken coding", 5,1)
		await get_tree().create_timer(2.0).timeout
		$Dialog/NameLabel.text="Shweta"
		await show_dialogue("Dk yet.. but maybe a 3D generalist like i always do with y'all in projects", 5,1)
		await get_tree().create_timer(2.0).timeout
		$Dialog/NameLabel.hide()
		await show_dialogue("Well i probably should say something too, but what i should say?", 0,0)
		await get_tree().create_timer(2.0).timeout
		await show_dialogue("Duh i don't know what she really doin' but maybe an artist? That shall be right,
		 but what would she actually say about it?", 0,0)
		#$Dialog/Label.text= "Anyways guys, have u all decided what role you guys wanna pursue?"
		#await get_tree().create_timer(2.0).timeout
		#$Dialog/Label.text= "Hmm i'm thinking about 3d generalist as what i always do when making project with y'all"
		#await get_tree().create_timer(2.0).timeout
		#$Dialog/Label.text= "Yeah for me maybe game programmer though i'm not an IT student but who cares, i make masterpieces with my broken coding
		#"
		#await get_tree().create_timer(2.0).timeout
		#$Dialog/Label.text= "Wow u guys have decided?? Honestly im still confused na."
		#
		#await get_tree().create_timer(2.0).timeout
		#$Dialog/Label.text= "Hmm what about you, Taheera?"
		
		$Dialog.show()
		$Dialog/ColorRect.hide()
		$Dialog/Label.hide()
		
		$Dialog/Button.show()
		$Dialog/Button2.show()
		
		$Dialog/Button.text = "Probably a 2d artist, i'm trying to build my portfolio currently"
		$Dialog/Button2.text= "Uhh i dont know yet actually, you know me, maybe i just wanna do everything?"
		
		#
		##await get_tree().create_timer(5.0).timeout
		#$Dialog/Label.text= "Hmm okay"
		#await get_tree().create_timer(2.0).timeout
		#$Dialog.hide()

		
		
