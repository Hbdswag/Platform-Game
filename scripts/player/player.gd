extends CharacterBody2D

@onready var sprite = $AnimatedSprite2D

var direction :
	get: return direction
	set(value):
		if value == 0 and value == direction: return
		direction = value
		sprite.flip_h = value == -1 #if the value is -1 the charecter turns his face left

func _physics_process(delta):
	var x_input = Input.get_axis("btn_left", "btn_right") #gives input to move left and right
	direction = x_input
	
	if Input.is_action_just_pressed("btn_jump") and is_on_floor():
		velocity.y = -400
		sprite.play("jump")
	elif not is_on_floor() and velocity.y >=0:
		sprite.play("fall")
	
	elif x_input == 0 and is_on_floor(): #o means no input in movement so it stands still
		sprite.play("idle")

	elif is_on_floor():#if there is any negative or positive movement it plays run animation
		sprite.play("run")

	velocity.x = x_input * 90
	velocity.y += 900 * delta

	move_and_slide()
