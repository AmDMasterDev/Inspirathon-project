extends TextureButton

export (String) var button_action = ''

func _on_login_button_pressed():
	match(button_action):
		"provider":
			Global.provider_login()
		"user":
			Global.user_login()
		"login":
			if Global.user == "user":
				Global.current_page = "home_screen"
				Global.animation.play_backwards("fade")
				yield(Global.animation, "animation_finished")
				get_tree().change_scene("res://scenes/home_screen.tscn")
			else:
				Global.current_page = "provider_screen"
				Global.animation.play_backwards("fade")
				yield(Global.animation, "animation_finished")
				get_tree().change_scene("res://scenes/provider_screen.tscn")
