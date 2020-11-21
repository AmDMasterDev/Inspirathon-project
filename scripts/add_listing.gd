extends Panel

var list_count = 0
var my_listings

func _ready():
	my_listings = get_parent().get_node("your_listings/scroller")

func _on_submit_list_pressed():
	return
	if $VBoxContainer/name.text == "" or $VBoxContainer/location.text == "": return
	if $VBoxContainer/start_up.text == "" or $"VBoxContainer/about you".text == "" : return
	if $VBoxContainer/contact.text == "": return
	
	var person_name = $VBoxContainer/name.text
	Global.listing[person_name] = {
		"name" : person_name,
		"location" : $VBoxContainer/location.text,
		"start_up" : $VBoxContainer/start_up.text,
		"about_you": $"VBoxContainer/about you".text,
		"phone_no" : $VBoxContainer/contact.text
	}
	Global.list_arr.append(person_name)
	Global.generate_listing(my_listings, list_count)
	list_count += 1
	self.visible = false
	print(Global.listing, Global.list_arr)
