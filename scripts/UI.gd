extends CanvasLayer

func _ready():
	Global.animation = $login_anim
	$login_anim.play_backwards("start_anim")
