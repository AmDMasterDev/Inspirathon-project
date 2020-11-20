extends Panel

func _ready():
	rect_position = Vector2(1300, 700)

func setUser():
	$initials_container/email.text = ''
	$initials_container/password.text = ''
	match(Global.current_page):
		"provider_login":
			$title.text = 'Login as Provider'
		"user_login":
			$title.text = 'Login as User'
