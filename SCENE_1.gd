extends Node2D
func _ready() -> void:
	dialogue()
func type_text(text):
	$Label.text=""
	for i in range(text.length()):
		$Label.text = text.substr(0, i +1)
		await get_tree().create_timer(0.05).timeout
func dialogue():
	await type_text("Imagine you have a very very brilliant mind")
	await get_tree().create_timer(2.0).timeout
	await type_text("You could generate thousands unique ideas")
	await get_tree().create_timer(2.0).timeout
	await type_text("With all that qualities, you could be a very powerful person, right?")
	await get_tree().create_timer(2.0).timeout
	await type_text("But  the thing is that...")
	await get_tree().create_timer(2.0).timeout
	await type_text("You lost your ability to talk at the young age")
	await get_tree().create_timer(4.0).timeout
	await type_text("Well that happened to me actually...")
	await get_tree().create_timer(2.0).timeout
	await type_text("At my childhood, i developed selective mutism. It's a condition 
	where one lost their ability to speak at certain situations")
	await get_tree().create_timer(2.0).timeout
	await type_text("In my case, it specifically happened at schools. 
	In means that throughout my school years, i'm almost never talking to anyone everyday for years")
	await get_tree().create_timer(2.0).timeout
	await type_text("It started as a self defense at first, i tried not to talk for some days
	 just so they would leave me alone")
	await get_tree().create_timer(2.0).timeout
	await type_text("But then before i know it, it got me instead. 
	My shoulder and my throat starting to stiffen everytime i'm in social situation")
	await get_tree().create_timer(2.0).timeout
	await type_text("Slowly that made me unable to speak, even if i tried my voice just won't come out,
	or like very low volume, it feels like there is a blockage in my throat")
	await get_tree().create_timer(2.0).timeout
	await type_text("If anything, i'd mostly used body language like nodding or shaking my head.
	Or just write it down on paper or something")
	await get_tree().create_timer(2.0).timeout
	await type_text("You know, seeing others, i often wonder..how does it feels to have friends? 
	How does it feels to have the ability to socialize with others?")
	await get_tree().create_timer(2.0).timeout
	await type_text("But mostly.. with that condition, it closed many doors of opportunities in my life.
	 especially for career wise ")
	await get_tree().create_timer(2.0).timeout
	await type_text("I mean almost everything in the world requiring ability to talk and communicate")
	await get_tree().create_timer(2.0).timeout
	await type_text("And here's my story begin")
	await get_tree().create_timer(2.0).timeout
	get_tree().change_scene_to_file("res://Scene/SCENE_2.tscn")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
