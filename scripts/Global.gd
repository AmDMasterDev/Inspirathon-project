extends Node2D

var animation : AnimationPlayer

var current_page = "entry_point"
var home_screen : Control
var header
var detail_name
var phone


var current_card = {
	"name" : "",
	"phone_no" : ""
}

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


func provider_login():
	current_page = "provider_login"
	animation.play('provider_anim')

func user_login():
	current_page = "user_login"
	animation.play('user_anim')

func set_header_text(page : String):
	header.text = page

func show_details():
	current_page = "details"
	update_card()
	home_screen.detail_tween(1)
	set_header_text("Details")

func hide_details():
	current_page = "home_screen"
	home_screen.detail_tween(-1)
#	home_screen.hide_detail_tween()
	set_header_text("COLT")

func update_card():
	detail_name.text = current_card["name"]
	phone.text = current_card["phone_no"]

var explore_slide = "whats new"
func explore(slide):
	explore_slide = slide
	if explore_slide == "trending":
		home_screen.show_trending(-1)
	else:
		home_screen.show_trending(1)
	pass





