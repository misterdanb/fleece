
extends RigidBody2D

# member variables here, example:
# var a=2
# var b="textvar"


func _integrate_forces(state):
	print(state.get_contact_count())
	if state.get_contact_count() > 0:
		for i in range (state.get_contact_count()):
			var contact_object = state.get_contact_collider_object(i)
			print("coin collide")
			if "player" in contact_object.get_groups():
				print("coin collide with player")

func _ready():
	# Initialization here
	set_contact_monitor(true)
	pass


