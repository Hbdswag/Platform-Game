extends Area2D


func _on_body_entered(player):
	player.sword = true
	$AnimatedSprite2D.visible = false
	$PickupSFX.play()
	$CollisionShape2D.set_deferred("disabled", true)


func _on_pickup_sfx_finished() -> void:
	queue_free()
