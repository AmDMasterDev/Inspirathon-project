extends TextureButton

var button_name : String

func _ready() -> void:
	button_name = self.name


func _on_home_screen_button_pressed():
	match(button_name):
		"home":
			Global.set_header_text("COLT")
			if (Global.current_page != "home_screen"):
				Global.hide_details()
		"active_listing":
			Global.set_header_text("Listing Around You")
		"liked_listing":
			Global.set_header_text("Liked Listings")
		"profile":
			Global.set_header_text("Profile")
