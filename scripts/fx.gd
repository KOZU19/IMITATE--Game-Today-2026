extends ColorRect
var screen_size:Vector2
var  fx_range: float
func _ready():
	screen_size = get_viewport().get_visible_rect().size
func _input(event: InputEvent):	
	if event is InputEventMouseMotion:
		material.set_shader_parameter('mouse_pos', event.position /  screen_size)
	elif event is InputEventMouseButton and event.pressed:
		if event.button_index ==MOUSE_BUTTON_WHEEL_DOWN:
			fx_range = clampf(fx_range +0.05, 0.1, 0.5)
			material.set_shader_parameter('mouse_range', fx_range)
		elif event.button_index == MOUSE_BUTTON_WHEEL_UP:
			fx_range = clampf(fx_range -0.05, 0.1, 0.5)	
			material.set_shader_parameter('mouse_range', fx_range)
			
