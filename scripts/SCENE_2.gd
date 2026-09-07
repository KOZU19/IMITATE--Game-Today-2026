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
	await type_text1("Years passes now, after leaving my hometown and moved here
	I kinda regained my ability to speak")
	type_text2("I finally can talk again.. but it's obvious that i'm still struggling to talk normally")
	$Diabox1.position = $"Point 7".global_position
	await type_text1("Despite the condition..I actually managed to get  a job at a restaurant near my place.")
	$Diabox2.position = $"Point 5".global_position
	await type_text2("I worked as a cashier there..
	Even i'm still struggling at socializing with clients")
	await type_text1("For once in my life, i feel kind of accepted there.
	My boss and coworkers are pretty good to me")
	await type_text2("It's been 3 months already since i work here,
	and so far i'm enjoying the environment")

	await type_text1("But the thing is yeah many customers complain about my service")
	type_text2("Some said that i'm not friendly,or maybe that i'm too cold")
	type_text1("Some said that they hardly can hear my voice")
	type_text1("Some noticed that i'm just very awkward and not suitable for the job")
	type_text2("I can do well at the taking notes and calculating the orders ,
	but my struggles at interacting with the clients overrides my performances")
	type_text2("And of course, that affecting the restaurant service rating too")
	type_text2("So the boss called me and signing me out from the job")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
