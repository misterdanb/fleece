
extends RigidBody2D

# member variables here, example:
# var a=2
# var b="textvar"

var contact_damage = 10
var touched = false

func _integrate_forces(state):
	if state.get_contact_count() > 0:
		for i in range (state.get_contact_count()):
			var contact_object = state.get_contact_collider_object(i)
			if "player_flying" in contact_object.get_groups() and !touched:
				get_node("../SamplePlayer2D").play("damage")
				touched = true
				get_node("/root/root_node/Camera/gui/hitpoints").set_value(get_node("/root/root_node/Camera/gui/hitpoints").get_value()-contact_damage)
			elif "player_bumping" in contact_object.get_groups():
				get_node("../SamplePlayer2D").play("enemy_dying")
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
