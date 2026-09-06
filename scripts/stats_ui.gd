extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



func _physics_process(delta: float) -> void:
	
	
	$suspicion.text = "Suspicion = "+ str(Stats.suspicion)
	$friendship.text="Friendship = " + str(Stats.friendship)
	
	
