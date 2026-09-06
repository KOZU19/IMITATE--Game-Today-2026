extends Node2D
@onready var sprite_2d: Sprite2D = $Sprite2D
var og_scale: Vector2
var og_pos: Vector2
var is_observing:= false
var obs_pos := Vector2(700, 500)
@onready var label: Label = $Label

func _ready():
	label.hide()
	og_scale = sprite_2d.scale
	og_pos = sprite_2d.position
	print("obs starts")
#func _input(event):
		#if event is InputEventMouseButton:
			#if event.button_index == MOUSE_BUTTON_LEFT:
				#if event.pressed:
					#observe()
func observe(area: Area2D, message: String):		
	print(area.name)
	var screen_center = get_viewport_rect().size / 2
	var area_pos = area.global_position
	var offset = screen_center - area_pos
	var target_img_pos = sprite_2d.position+offset
	
	if is_observing:
		return
	is_observing = true
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(
		sprite_2d,
		"scale",
		og_scale *2.0,
		0.4
	)
	tween.tween_property(
		sprite_2d,
		"position",
		target_img_pos,
		0.4
	)
	
	await tween.finished
	label.show()
	label.text = message
	await get_tree().create_timer(2.0).timeout
	label.hide()
	var return_tween = create_tween()
	return_tween.set_parallel(true)
	return_tween.tween_property(
		sprite_2d,
		"scale",
		og_scale,
		0.4
	)
	return_tween.tween_property(
		sprite_2d,
		"position",
		og_pos,
		0.4
	)
	await return_tween.finished
	is_observing = false




				


func _on_head_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	print("maxi handsome")
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				observe($head, " ini mata")
				


func _on_body_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				observe($body, "ini badan")
