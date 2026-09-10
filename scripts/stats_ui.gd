extends Control
@onready var suspicion_progress_bar: TextureProgressBar = $SuspicionProgressBar
@onready var friendship_progress_bar: TextureProgressBar = $FriendshipProgressBar
@onready var satisfaction_progress_bar: TextureProgressBar = $SatisfactionProgressBar
@onready var anxiety_progress_bar: TextureProgressBar = $AnxietyProgressBar


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



func _process(delta: float) -> void:
	$suspicion.text = "Suspicion"
	$friendship.text="Friendship" 
	$satisfaction.text = "Satisfaction"
	$anxiety.text ="Anxiety=" + str(Stats.Anxiety)
	suspicion_progress_bar.value=Stats.suspicion
	friendship_progress_bar.value = Stats.friendship
	satisfaction_progress_bar.value= Stats.satisfaction
	anxiety_progress_bar.value= Stats.Anxiety
	if Stats.Anxiety >=70:
		$AnimatedSprite2D.show()
		$AnimatedSprite2D.play("default")
	else:
		$AnimatedSprite2D.hide()	
