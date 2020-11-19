extends Panel

func setUser():
	$initials_container/email.text = ''
	$initials_container/password.text = ''
	match(Global.current_page):
		"provider_login":
			$title.text = 'Login as Provider'
		"user_login":
			$title.text = 'Login as User'
