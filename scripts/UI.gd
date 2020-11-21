extends CanvasLayer

func _ready():
	Global.animation = $login_anim
	yield(Global.animation, "animation_finished")
	$login_anim.play_backwards("start_anim")
