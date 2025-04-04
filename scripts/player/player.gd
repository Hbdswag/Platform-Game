extends CharacterBody2D
class_name Player

@onready var sprite = $AnimatedSprite2D
@onready var fsm = $FSM
 
const MAX_SPEED = 90.0
const ACCELERATION = 900.0
const AIR_MULTIPLIER = 0.7

const JUMP_GRAVITY = 900.0
const FALL_GRAVITY = 400.0
const TERMINAL_VELOCITY = 180.0

var sword = false :
	get: return sword
	set(value):
		if sword == value: return
		sword = value
		var current_anim = sprite.animation
		var target_anim = current_anim
		if value:
			target_anim += "_sword"
		else:
			target_anim = target_anim.replace("_sword", "")
		if sprite.sprite_frames.has_animation(target_anim):
			var progress = sprite.frame_progress
			var frame = sprite.frame
			sprite.play(target_anim)
			sprite.set_frame_and_progress(frame, progress)

var direction :
	get: return direction
	set(value):
		if value == 0 and value == direction: return
		direction = value
		sprite.flip_h = value == -1 #if the value is -1 the charecter turns his face left

func _ready():
	fsm.change_state("idle")

func _physics_process(delta):
	fsm.physics_update(delta)
	

func get_input_x():
	return Input.get_axis("btn_left", "btn_right")
	


func is_jump_just_pressed():
	return Input.is_action_just_pressed("btn_jump")
	
