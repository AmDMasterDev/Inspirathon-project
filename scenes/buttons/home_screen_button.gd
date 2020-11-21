extends TextureButton

var button_name : String

func _ready() -> void:
	button_name = self.name


func _on_home_screen_button_pressed():
	match(button_name):
		"home":
			Global.set_header_text("COLT")
			if (Global.current_page == "details"):
				Global.hide_details()
			elif (Global.current_page == "liked listing"):
				Global.hide_liked_list()
			elif (Global.current_page == "liked listing info"):
				Global.liked_listing_details()
				Global.hide_liked_list()
				pass
		"active_listing":
			Global.set_header_text("Listing Around You")
		"liked_listing":
			if Global.current_page == "details":
				Global.hide_details()
				Global.current_page = "liked listing"
				yield(get_tree().create_timer(0.2), "timeout")
				Global.show_liked_list()
			elif Global.current_page == "liked listing info":
				Global.liked_listing_details()
				Global.current_page = "liked listing"
			if Global.current_page != "liked listing":
				Global.show_liked_list()
			Global.current_page = "liked listing"
		"profile":
			Global.set_header_text("Profile")
