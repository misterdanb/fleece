
extends Node

# member variables here, example:
# var a=2
# var b="textvar"
export var transform_time = 0.0
var camera_scroll_speed = 75
var coin_beginning = 2000
var coin_distance = 200
var coin_template = null

var enemy_beginning = 700
var enemy_distance = 400
var enemy_template = null

func _ready():
	# Initialization here
	coin_template = preload("res://coin.scn")
	enemy_template = preload("res://enemy.scn")
	set_fixed_process( true )
	pass

func _fixed_process(delta):
	get_node("/root/root_node/Camera").set_pos(vec2(get_node("/root/root_node/Camera").get_pos().x + (camera_scroll_speed * delta), get_node("/root/root_node/Camera").get_pos().y))
	get_node("/root/root_node/ground/repeat").set_region_rect(Rect2(0,0,get_node("/root/root_node/Camera").get_pos().x+1000,152))
	
	# Zufallsmünzen
	if get_node("/root/root_node/Camera").get_pos().x + 1000 >= coin_beginning and int(get_node("/root/root_node/Camera").get_pos().x) % coin_distance == 0:
		var newcoin = coin_template.instance()
		newcoin.set_pos(vec2(get_node("/root/root_node/Camera").get_pos().x + 1000, rand_range(60, 450)))
		add_child(newcoin)
		
	# Zufallsgegner
	if get_node("/root/root_node/Camera").get_pos().x + 1000 >= enemy_beginning and int(get_node("/root/root_node/Camera").get_pos().x) % enemy_distance == 0:
		var newenemy = enemy_template.instance()
		newenemy.set_pos(vec2(get_node("/root/root_node/Camera").get_pos().x + 1000, rand_range(60, 450)))
		add_child(newenemy)