extends Area2D

var passage = false
	
func _process(delta):
	var bodies = get_overlapping_bodies()
	
	for body in bodies:	
		if body.name == "Player":
			#ouvre la porte
			$porte.play("Open")
			if passage == true:
				body.position.y = 52
				body.position.x = 151

#connecteur sur le sprite et sur l animation
func _on_porte_animation_finished():
	print ("ok porte ouverte")
	passage = true