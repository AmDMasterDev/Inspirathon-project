extends Node2D

var animation : AnimationPlayer

export var current_page = "entry_point"
export var user = ""
var home_screen : Control
var header
var detail_name
var about_me
var phone


var current_card = {
	"name" : "",
	"phone_no" : ""
}

var listing = {}
var list_arr = []
var liked = {}
var liked_main = {}

func _ready():
	get_tree().set_quit_on_go_back(false)
func _notification(what):

	if what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST:
		_on_Back_pressed()
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		_on_Back_pressed()

func _on_Back_pressed():
	match(current_page):
		"entry_point":
			get_tree().quit()
		"provider_login":
			animation.play_backwards('provider_anim')
			current_page = "entry_point"
		"user_login":
			animation.play_backwards('user_anim')
			current_page = "entry_point"
		"home_screen":
			get_tree().quit()
		"details":
			hide_details()
		"liked listing":
			hide_liked_list()
		"liked listing info":
			liked_listing_details()
			current_page = "liked listing"


func provider_login():
	current_page = "provider_login"
	user = "provider"
	animation.play('provider_anim')

func user_login():
	current_page = "user_login"
	user = "user"
	animation.play('user_anim')

func set_header_text(page : String):
	header.text = page

func show_details():
	current_page = "details"
	update_card()
	home_screen.detail_tween(1, 1)
	set_header_text("Details")


func hide_details():
	current_page = "home_screen"
	home_screen.detail_tween(-1, 1)
#	home_screen.hide_detail_tween()
	set_header_text("COLT")


func update_card():
	detail_name.text = current_card["name"]
	phone.text = current_card["phone_no"]

func custom_bio(person_name):
	about_me.text = listing[person_name]["about_you"]
	print(listing[person_name]["about_you"])

var explore_slide = "whats new"
func explore(slide):
	explore_slide = slide
	if explore_slide == "trending":
		home_screen.show_trending(-1)
	else:
		home_screen.show_trending(1)
	pass


func show_liked_list():
	current_page = "liked listing"
	set_header_text("Liked Listings")
	home_screen.detail_tween(-1, 2)

func hide_liked_list():
	current_page = "home_screen"
	set_header_text("COLT")
	home_screen.detail_tween(1, 2)

var like_list_box : VBoxContainer
var card = preload("res://scenes/cards/HBoxContainer.tscn")
func add_liked_listing():
	var c = card.instance()
	var c_name = current_card["name"]
	c.name = c_name
	c.number = current_card["phone_no"]
	c.person_name = liked[c_name]["name"]
	c.location = liked[c_name]["location"]
	c.start_up = liked[c_name]["start_up"]
	c.pressed = true
	like_list_box.add_child(c)
	liked[c_name] = c.get_path()


func remove_liked_listing(name):
	var c_liked = get_node(liked[name])
	c_liked.queue_free()
	liked.erase(name)

var showing_info = false
func liked_listing_details():
	if !showing_info:
		update_card()
		home_screen.info_slide(1)
		set_header_text("Details")
		showing_info = true
	else:
		home_screen.info_slide(-1)
		set_header_text("Liked Listings")
		showing_info = false

func hide_info_slide():
	home_screen.info_slide(-1)

func show_profile():
	current_page = "profile"
	home_screen.profile(-1)

func hide_profile():
	home_screen.profile(1)


func generate_listing(node, i):
	var c = card.instance()
	var c_name = list_arr[i]
	var parent = node
	c.name = c_name
	c.number = listing[c_name]["phone_no"]
	c.person_name = listing[c_name]["name"]
	c.location = listing[c_name]["location"]
	c.start_up = listing[c_name]["start_up"]
	c.custom_bio = true
	parent.add_child(c)

func add_list_tween(dir):
	if user == "provider":
		home_screen.add_list(dir)



