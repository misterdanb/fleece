
extends RigidBody2D

# member variables here, example:
# var a=2
# var b="textvar"

var acc_x = 20
var speed_x_max = 100
var acc_y = 20
var speed_y_max = 80

func _ready():
	# Initialization here
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	var current_vel = get_linear_velocity()
	if Input.is_action_pressed("right") and current_vel.x < speed_x_max:
		set_linear_velocity(vec2(current_vel.x + acc_x, current_vel.y))
	elif Input.is_action_pressed("left") and current_vel.x > -speed_x_max:
		set_linear_velocity(vec2(current_vel.x - acc_x, current_vel.y))
	if Input.is_action_pressed("fly") and current_vel.y > -speed_y_max:
		set_linear_velocity(vec2(current_vel.x, current_vel.y - acc_y))
		set_rot(0)
		set_angular_velocity(0.0)