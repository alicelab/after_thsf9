extends Area2D

func _physics_process(delta):
	position.x = position.x +1
	$Sprite.play("Run")
	
	var bodies = get_overlapping_bodies()
	
	for body in bodies:
		if body.name == "Player":
			get_tree().reload_current_scene()
	
	if position.x > 157 && position.x< 168:
		position.y = 172
	else:
		position.y = 182