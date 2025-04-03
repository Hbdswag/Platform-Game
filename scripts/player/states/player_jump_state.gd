extends PlayerBaseState

@onready var sfx = $JumpSFX


func enter():
	play("jump")
	object.velocity.y = -300
	sfx.play()




func physics_update(delta):

	move(delta, true)

	if object.velocity.y >= 0:
		change_state("fall")
