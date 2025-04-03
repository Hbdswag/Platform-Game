extends Node

@onready var sprite = $AnimatedSprite2D

func _ready():
	sprite.play("idle")



func _on_body_entered(body: Node2D) -> void:
	sprite.play("collect")
	$CollextSFX.play()
	



func _on_animated_sprite_2d_animation_finished() -> void:
	queue_free()
