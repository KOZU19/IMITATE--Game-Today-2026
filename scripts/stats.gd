extends Control
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
		satisfaction =min(value, limit)
		
