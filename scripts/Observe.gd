extends Node2D
@onready var sprite_2d: Sprite2D = $Sprite2D
var og_scale: Vector2
var og_pos: Vector2
var is_observing:= false
var obs_pos := Vector2(700, 500)
@onready var label: Label = $Label
var required_parts := ["head", "body"]
var observed_parts := []
#var observation_data := {
		#"required_parts": ["head", "body", "phone"],
		#"messages":{
			#"head" :"this is head",
			#"body" :"this is body",
			#"phone" :"this is phone"}
		#}
	#},
	#2: {
		#"required_parts": ["friend_1", "friend_2", "friend_3"],
		#"messages" : {
			#"friend_1" : "He is cool",
			#"friend_2" : "He is handsome",
			#"friend_3" : "He is alive"
		#}
	#}
#}
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
	if area.name not in observed_parts:
		observed_parts.append(area.name)
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
	check_observation_complete()

func _on_head_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	print("aaaa")
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				observe($head, "Ini kepala")
				


func _on_body_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				observe($body, "ini badan")
func check_observation_complete() -> void:
	for part in required_parts:
		if part not in observed_parts:
			return
	observation_finished()
func observation_finished():
	print("obs done")
	get_parent().observation_finished()
#func start_observation(number: int) -> void:
	#observed_parts.clear()
	#required_parts = observation_data[number]["required parts"]
		
