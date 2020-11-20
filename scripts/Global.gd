extends Node2D

var animation

var current_page = "entry_point"

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


func provider_login():
	current_page = "provider_login"
	animation.play('provider_anim')

func user_login():
	current_page = "user_login"
	animation.play('user_anim')
