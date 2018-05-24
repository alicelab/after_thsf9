extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

var rotation_dir = 0.5

func _process(delta):
	$Sprite.rotation_degrees += rotation_dir
	
	if $Sprite.rotation_degrees < -30:
		$Sprite.rotation_degrees = -30
		rotation_dir = -rotation_dir
	elif $Sprite.rotation_degrees > 30:
		$Sprite.rotation_degrees = 30
		rotation_dir = -rotation_dir
	
