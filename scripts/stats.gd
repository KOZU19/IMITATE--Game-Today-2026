extends Control
var anxiety_timer := 0.0
var anxiety_interval:= 5.0
var anxiety_decay := 3
const limit:int = 100
var suspicion:int = 0:
	set(value):
		suspicion =min(value, limit)
var friendship:int = 38:
	set(value):
		friendship =min(value, limit)
var satisfaction:int = 0:
	set(value):
		satisfaction =min(value, limit)
var Anxiety:int = 0:
	set(value):
		Anxiety =min(value, limit)
func _process(delta):
	anxiety_timer += delta
	
	if anxiety_timer>= anxiety_interval :
		anxiety_timer = 0.0
		Stats.Anxiety -= anxiety_decay
