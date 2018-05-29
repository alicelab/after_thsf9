extends Area2D

# TODO
# faire rebondir le robot
var flip = false

func _physics_process(delta):
	
	$Sprite.play("Run")
	
	if (position.x < 262 && flip == false):
		position.x = position.x +1
		#flip = true
	else:
		flip = true
		$Sprite.flip_h = true
		position.x = position.x -1
	
	if (position.x < 16  && flip == true):
		flip = false
		$Sprite.flip_h = false
		position.x = position.x +1	
		
	var bodies = get_overlapping_bodies()
	
	for body in bodies:
		if body.name == "Player":
			get_tree().reload_current_scene()
	
	if position.x > 157 && position.x< 168:
		position.y = 172
	else:
		position.y = 182
		