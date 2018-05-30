extends KinematicBody2D

# TODO
# Animation haut du corps dernier robot
# Etat ouvert pour porte pour pouvoir passer quand on est tombé

# ABANDONNE
# Ecran intermédiaire avant niveau 1 (Get Ready!)
# Animation quand personnage meurt
# Animation à l'endroit où le joueur est téléporté (halo bleu ?)

# Niveau 2 logique avec lumières

# FAIT
# Fond de briques avec images

const UP = Vector2(0, -1)

var GRAVITY = 20
const SPEED = 50
const JUMP_HEIGHT = -280

var motion = Vector2()
var on_ladder = false
var contact = false

var ordinateur_allume = false

func _physics_process(delta):

	motion.y += GRAVITY	
	print("position: ", position.x, " ", position.y)
	if !ordinateur_allume:
		if position.x > 297 and position.y > 103 and position.y < 106:
			ordinateur_allume = true
			get_parent().get_node("TileMap2").set_cell(19,5,4)
			get_parent().get_node("TileMap2").set_cell(9,7,-1)
			get_parent().get_node("TileMap2").set_cell(9,6,9)
	
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		$Sprite.flip_h = false
		$Sprite.play("Run")	
		
	elif Input.is_action_pressed("ui_left"):
		motion.x = - SPEED
		$Sprite.flip_h = true
		$Sprite.play("Run")	
	elif on_ladder == false:
		motion.x = 0
		$Sprite.play("Idle")
	
	if is_on_floor() :
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
	motion = move_and_slide(motion, UP)
	
	# LADDER
	var tilemap = get_parent().get_node("TileMap2")
	
	if tilemap != null:
		var map_pos = tilemap.world_to_map(position)
		var id = tilemap.get_cellv(map_pos)
		if id != -1:
			if tilemap.get_tileset().tile_get_name(id) == "ladder":
				on_ladder = true
				#left_tile = (TileMap2.get_cellv(TileMap2.world_to_map(pos)))
			else:
				on_ladder = false
		else:
			on_ladder = false
			
	if on_ladder == true:
		if Input.is_action_pressed("ui_up"):
			motion.y = -80
			$Sprite.play("Climb")
			
		else:
			motion.x = 0
			$Sprite.play("Idle")
			
	# teleportation vers la droite
	if contact == true:
		position.y = 52
		position.x = 151
		contact = false