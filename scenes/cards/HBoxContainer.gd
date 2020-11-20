extends HBoxContainer

export (String) var person_name
export (String) var location
export (String) var start_up

export (NodePath) var card_name
export (NodePath) var card_location
export (NodePath) var card_start_up


func _ready():
	card_name = get_node(card_name)
	card_location = get_node(card_location)
	card_start_up = get_node(card_start_up)
	
	card_name.text = person_name
	card_location.text = location
	card_start_up.text = start_up


var toggle = true
func _on_like_pressed():
	var me = $VBoxContainer/Panel/card_info/contact_box/like
	if toggle:
		me.texture_normal = preload("res://art/icon pack/png/051-filled-like.png")
		print("Card Name: ", person_name)
		toggle = false
	else:
		me.texture_normal = preload("res://art/icon pack/png/002-like.png")
		toggle = true
