
extends RigidBody2D

# member variables here, example:
# var a=2
# var b="textvar"

var acc_x = 20
var speed_x_max = 100
var flying_mode = null
var deflate = false

func _ready():
	# Initialization here
	flying_mode = preload("res://character_flying.scn")
	get_node("AnimationPlayer").play("inflate")
	set_fixed_process(true)
	add_to_group("Player")
	add_to_group("player")
	pass

func _fixed_process(delta):
	if deflate and !get_node("AnimationPlayer").is_playing():
		get_node("/root/root_node").set("transform_time", 2.0)
		var fm = flying_mode.instance()
		fm.set_pos(get_pos())
		get_parent().add_child(fm)
		self.queue_free()
	get_node("/root/root_node").set("transform_time", get_node("/root/root_node").get("transform_time")-delta)
	var current_vel = get_linear_velocity()
	if Input.is_action_pressed("right") and current_vel.x < speed_x_max:
		set_linear_velocity(vec2(current_vel.x + acc_x, current_vel.y))
	elif Input.is_action_pressed("left") and current_vel.x > -speed_x_max:
		set_linear_velocity(vec2(current_vel.x - acc_x, current_vel.y))
	if Input.is_action_pressed("mode_toggle") and get_node("/root/root_node").get("transform_time") <= 0:
		deflate = true
		get_node("AnimationPlayer").play("deflate")
#	set_rot(0)
#	set_angular_velocity(0.0)