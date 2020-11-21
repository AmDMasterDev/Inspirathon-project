extends TextureButton

var button_name : String

func _ready() -> void:
	button_name = self.name


func _on_button_pressed():
	match(button_name):
		"home":
			if Global.current_page == "profile":
				Global.hide_profile()
				Global.current_page = "home_screen"
				Global.set_header_text("COLT For Providers")
			if Global.current_page == "details":
				Global.hide_info_slide()
				Global.current_page = "home_screen"
				Global.set_header_text("COLT For Providers")
			if Global.current_page == "add list":
				Global.add_list_tween(1)
				Global.current_page = "home_screen"
		"add":
			if Global.current_page == "home_screen":
				Global.add_list_tween(-1)
				Global.current_page = "add list"
			elif Global.current_page == "profile":
				Global.hide_profile()
				Global.add_list_tween(-1)
				Global.current_page = "add list"
		"profile":
			if Global.current_page == "add list":
				Global.add_list_tween(1)
				Global.show_profile()
				Global.current_page = "profile"
			if Global.current_page != "profile":
				Global.show_profile()
			
		
