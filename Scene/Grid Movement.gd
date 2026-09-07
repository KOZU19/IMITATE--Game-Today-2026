extends CharacterBody2D
@export var grid_size := 128
@export var move_speed := 400.0
var target_position : Vector2
var moving := false
var can_move := true
@export var memory_points : Array[Node2D]
var current_memory := 0
@export var memory_panel:Control
@export var memory_text: Label
@export var walkable_layer: TileMapLayer

func _ready() -> void:
	target_position  =global_position
func _physics_process(delta: float) -> void:
	if not can_move:
		return
	if moving:
		global_position = global_position.move_toward(
			target_position, move_speed * delta
		)	
		if global_position.distance_to(target_position)<1.0:
			global_position = target_position
			moving = false
		return
	var direction := Vector2.ZERO
	if Input.is_action_just_pressed("ui_right"):
		direction = Vector2.RIGHT
	elif Input.is_action_just_pressed("ui_left"):
		direction = Vector2.LEFT
	elif Input.is_action_just_pressed("ui_up"):
		direction = Vector2.UP
	elif Input.is_action_just_pressed("ui_down"):
		direction = Vector2.DOWN
	if direction == Vector2.ZERO:
		return
	var next_position :=global_position + direction * grid_size
	if not is_walkable(next_position):
		return
	target_position = next_position
	moving = true	
func is_walkable(world_position: Vector2)->bool:
	var tile_position := walkable_layer.local_to_map(
		walkable_layer.to_local(world_position))
	var source_id :=walkable_layer.get_cell_source_id(tile_position)	
	return source_id != -1	
func check_memory_point():
	if current_memory >=memory_points.size():
		return
	var point = memory_points[current_memory]
	if global_position.distance_to(point.global_position) < 5.0:
		can_move = false
		memory_panel.visible= true
		if current_memory == 0:
			memory_text.text = "At my childhood, i developed selevtive mutism"
			
func _unhandled_input(event: InputEvent) -> void:
	if not memory_panel.visible:
		return
	if event.is_action_pressed("ui_accept"):
		memory_panel.visible= false
		can_move = true
		current_memory += 1
		print("Memory" + str(current_memory + 1))
			
	
