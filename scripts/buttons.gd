extends HBoxContainer


func _on_whats_new_button_toggled(button_pressed):
	if Global.explore_slide == "whats new":
		$whats_new_button.pressed = true
		return
	
	if button_pressed:
		Global.explore("whats new")
		$trending_button.pressed = false


func _on_trending_button_toggled(button_pressed):
	if Global.explore_slide == "trending": 
		$trending_button.pressed = true
		return
	
	if button_pressed:
		Global.explore("trending")
		$whats_new_button.pressed = false
	
