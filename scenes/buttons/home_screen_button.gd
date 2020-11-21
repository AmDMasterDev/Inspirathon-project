extends TextureButton

var button_name : String

func _ready() -> void:
	button_name = self.name


func _on_home_screen_button_pressed():
	match(button_name):
		"home":
			Global.set_header_text("COLT")
			match(Global.current_page):
				"details":
					Global.hide_details()
				"liked listing":
					Global.hide_liked_list()
				"liked listing info":
					Global.liked_listing_details()
					Global.hide_liked_list()
				"profile":
					Global.hide_profile()
					Global.current_page = "home_screen"
				"liked listing profile":
					Global.hide_profile()
					Global.hide_liked_list()
					Global.current_page = "liked listing"
				
		"active_listing":
			Global.set_header_text("Listing Around You")
		"liked_listing":
			if Global.current_page == "details":
				Global.hide_details()
				yield(get_tree().create_timer(0.2), "timeout")
				Global.show_liked_list()
				Global.current_page = "liked listing"
			elif Global.current_page == "liked listing info":
				Global.liked_listing_details()
				Global.current_page = "liked listing"
			elif Global.current_page == "profile":
				Global.hide_profile()
				Global.show_liked_list()
				Global.current_page = "liked listing"
			elif Global.current_page == "liked listing profile":
				Global.hide_profile()
				Global.current_page = "liked listing"
				Global.set_header_text("Liked Listings")
			if Global.current_page != "liked listing":
				Global.show_liked_list()
			Global.current_page = "liked listing"
		"profile":
			Global.set_header_text("Profile")
			if Global.current_page == "details":
				Global.hide_details()
				Global.show_profile()
				Global.set_header_text("Profile")
			elif Global.current_page == "liked listing":
				Global.show_profile()
				Global.current_page = "liked listing profile"
			elif Global.current_page == "liked listing info":
				Global.hide_details()
				Global.hide_liked_list()
				Global.showing_info = false
				Global.show_profile()
			elif Global.current_page != "profile":
				Global.show_profile()
