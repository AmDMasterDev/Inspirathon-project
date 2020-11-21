extends Panel

onready var splash_screen = preload("res://scenes/splash_screen.tscn")

func _on_logout_pressed():
	get_tree().change_scene("res://scenes/splash_screen.tscn")
