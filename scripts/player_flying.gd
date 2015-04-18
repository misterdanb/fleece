
extends RigidBody2D

# member variables here, example:
# var a=2
# var b="textvar"

var acc_x = 20
var speed_x_max = 100
var acc_y = 20
var speed_y_max = 80

var bumping_mode = null

func _ready():
	# Initialization here
	bumping_mode = preload("res://character_bumping.scn")
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	get_node("/root/root_node").set("transform_time", get_node("/root/root_node").get("transform_time")-delta)
	var current_vel = get_linear_velocity()
	if Input.is_action_pressed("right") and current_vel.x < speed_x_max:
		set_linear_velocity(vec2(current_vel.x + acc_x, current_vel.y))
	elif Input.is_action_pressed("left") and current_vel.x > -speed_x_max:
		set_linear_velocity(vec2(current_vel.x - acc_x, current_vel.y))
	if Input.is_action_pressed("fly") and current_vel.y > -speed_y_max:
		set_linear_velocity(vec2(current_vel.x, current_vel.y - acc_y))
		get_node("AnimationPlayer").play("flap")
		set_rot(0)
		set_angular_velocity(0.0)
	else:
		get_node("AnimationPlayer")
	if Input.is_action_pressed("mode_toggle") and get_node("/root/root_node").get("transform_time") <= 0:
		get_node("/root/root_node").set("transform_time", 2.0)
		var bm = bumping_mode.instance()
		bm.set_pos(get_pos())
		get_parent().add_child(bm)
		self.queue_free()