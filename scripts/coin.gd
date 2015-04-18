
extends RigidBody2D

# member variables here, example:
# var a=2
# var b="textvar"

var activated = false
var coin_value = 10

func _integrate_forces(state):
	if state.get_contact_count() > 0:
		for i in range (state.get_contact_count()):
			var contact_object = state.get_contact_collider_object(i)
			if ("player" in contact_object.get_groups() or "Player" in contact_object.get_groups()) and !activated:
				activated = true
				if get_node("/root/root_node/Camera/gui/transform_points_progress").get_value() <= 100-coin_value:
					get_node("/root/root_node/Camera/gui/transform_points_progress").set_value(get_node("/root/root_node/Camera/gui/transform_points_progress").get_value()+coin_value)
					self.queue_free()
				elif get_node("/root/root_node/Camera/gui/transform_points_progress").get_value() < 100:
					get_node("/root/root_node/Camera/gui/transform_points_progress").set_value(100)
					self.queue_free()

#func _fixed_process(delta):
#	if is_colliding():
#		print ("Collision with ", get_collider())

func _ready():
	# Initialization here
#	set_fixed_process(true)
	set_contact_monitor(true)
	set_max_contacts_reported(3)
	pass


