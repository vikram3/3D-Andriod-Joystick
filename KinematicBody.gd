extends KinematicBody

onready var joystick = get_parent().get_node("HBoxContainer/Sprite/TouchScreenButton")
onready var rotation_helper = $Spatial
onready var anim = get_parent().get_node("KinematicBody/Player/AnimationPlayer")

var dir = Vector3()
var MOUSE_SENSITIVITY = 0.5

func _physics_process(delta):
	
	var move = Vector3()
	
	if joystick.get_value():
		move.x = joystick.get_value().x
		move.z = joystick.get_value().y
		anim.play("RunTest")
	else:
		anim.play("Idle")
	
	move_and_slide(move * 5, Vector3.UP)
	
func _input(event):
	if event is InputEventScreenDrag :
		if event.index == joystick.ongoing_drag:
			return
		rotation_helper.rotate_x(deg2rad(event.relative.y * MOUSE_SENSITIVITY * -1))
		self.rotate_y(deg2rad(event.relative.x * MOUSE_SENSITIVITY * -1))
