extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("anim")
	await get_tree().create_timer(23.2).timeout
	get_tree().change_scene_to_file("res://Scene/Opening + observation/1B.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
