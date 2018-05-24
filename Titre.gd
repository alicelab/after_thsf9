extends Node

func _input(event):
	if event.is_pressed():
		get_tree().change_scene("res://Intro.tscn")