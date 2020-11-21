extends HBoxContainer

export (String) var person_name
export (String) var location
export (String) var start_up
export (String) var number

export (NodePath) var card_name
export (NodePath) var card_location
export (NodePath) var card_start_up

var pressed = false
var custom_bio = false

func _ready():
	card_name = get_node(card_name)
	card_location = get_node(card_location)
	card_start_up = get_node(card_start_up)
	
	card_name.text = person_name
	card_location.text = location
	card_start_up.text = start_up
	
	if pressed:
		$VBoxContainer/Panel/card_info/contact_box/like.texture_normal = preload("res://art/icon pack/png/051-filled-like.png")
		toggle = false


export var toggle = true
func _on_like_pressed():
	var me = $VBoxContainer/Panel/card_info/contact_box/like
	if toggle:
		me.texture_normal = preload("res://art/icon pack/png/051-filled-like.png")
		Global.current_card["name"] = person_name
		Global.current_card["phone_no"] = number
		Global.liked_main[person_name] = get_path()
		
		Global.liked[person_name] = {
			"name" : person_name,
			"location" : location,
			"start_up" : start_up
		}
		
		Global.add_liked_listing()
		toggle = false
	else:
		me.texture_normal = preload("res://art/icon pack/png/002-like.png")
		Global.remove_liked_listing(person_name)
		toggle = true
		if Global.current_page == "liked listing":
			var c_main = get_node(Global.liked_main[person_name])
			c_main.toggle = true
			c_main = c_main.get_node("VBoxContainer/Panel/card_info/contact_box/like")
			c_main.texture_normal = preload("res://art/icon pack/png/002-like.png")


func _on_contact_pressed():
	Global.current_card["name"] = person_name
	Global.current_card["phone_no"] = number
	if custom_bio:
		Global.custom_bio(person_name)
	else:
		Global.about_me = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer a lacus risus. Praesent ut dignissim justo, quis posuere velit. Pellentesque iaculis sit amet urna et lacinia. Suspendisse nec commodo quam. Vivamus cursus urna vel leo consequat imperdiet. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Aliquam vel nibh quis sem convallis pulvinar."
	
	if Global.current_page == "liked listing":
		Global.liked_listing_details()
		Global.current_page = "liked listing info"
	else:
		Global.show_details()
