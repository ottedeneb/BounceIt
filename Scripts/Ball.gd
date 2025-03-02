extends RigidBody2D


var cam = preload("res://Scripts/Camera.gd").new()

func get_point():
	randomize()
	$OnTouch.play()
	$OnTouch.pitch_scale = rand_range(0.5, 1.5)
	Global.points += 1
	cam.shake()

func lose():
	$Particles2D.emitting = true
	$Area2D.queue_free()
	$Sprite.hide()
	$Trail.hide()
	$Lose.play()
	$Lose.pitch_scale = rand_range(0.5, 1.5)
	Global.gameOver = true





func _on_Area2D_area_entered(area: Area2D) -> void:
	if area.is_in_group("Points"):
		get_point()
		
	
	if area.is_in_group("LoseArea"):
		lose()
