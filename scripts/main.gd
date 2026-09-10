class_name main extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("menu")
	#kasih screen effect


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_accept"):
		# wait bbrp sec n kasih tween fade out
		get_tree().change_scene_to_file("res://Scene/1B.tscn")
		
