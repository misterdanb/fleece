
extends Node

# member variables here, example:
# var a=2
# var b="textvar"
export var transform_time = 0.0
var camera_scroll_speed = 75

func _ready():
	# Initialization here
	set_fixed_process( true )
	pass

func _fixed_process(delta):
	get_node("/root/root_node/Camera").set_pos(vec2(get_node("/root/root_node/Camera").get_pos().x + (camera_scroll_speed * delta), get_node("/root/root_node/Camera").get_pos().y))
	#get_node("die_wand").set_rot(0)