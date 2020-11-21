extends Panel

onready var splash_screen = preload("res://scenes/splash_screen.tscn")

func _on_logout_pressed():
	var anim = get_parent().get_node("home_anim")
	anim.play_backwards("details")
	yield(anim, "animation_finished")
	get_tree().change_scene("res://scenes/splash_screen.tscn")


