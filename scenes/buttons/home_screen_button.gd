extends TextureButton

var button_name : String

func _ready() -> void:
	button_name = self.name


func _on_home_screen_button_pressed():
	print(button_name)
