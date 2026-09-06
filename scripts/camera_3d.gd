extends Camera3D
@onready var raycast: RayCast3D = $"../RayCast3D"
@onready var obj_1: StaticBody3D = $"../OBJ1"
@onready var obj_2: StaticBody3D = $"../OBJ2"
@onready var observation_ui: CanvasLayer = $"../observation_ui"


@export_category("Observation")
@export var observation_duration:float = 0.8
var is_observing:bool = false
var current_object: ObservableObject = null

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				try_observe()
func try_observe():
	if is_observing:
		return
	if not raycast.is_colliding():
		return
	var object = raycast.get_collider()	
	if object is not ObservableObject:
		return
	observe_object(object)	
func observe_object(object):
	is_observing = true
	current_object = object
	var observation_point: Marker3D = object.get_node("ObservationPoint")
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(
		self, 
		"global_position",
		observation_point.global_position,
		observation_duration
	).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	tween.tween_method(
		look_at.bind(object),
		0.0,
		1.0,
		observation_duration
	)
	
	tween.finished.connect(
		func():
			finish_observation(object)
	)
func finish_observation(object: ObservableObject):
	observation_ui.show_observation(object)
