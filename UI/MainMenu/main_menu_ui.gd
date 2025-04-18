extends MenuComponent

@onready var loadingScreen = preload("res://UI/LoadingScreen/loading_screen.tscn")

func _ready():
	%Settings.closed.connect(reset)
	%Credits.closed.connect(reset)
	
	focusedComponent = %NewGameBtn
	reset(self)
	
	if !GameInfo.data.askedUsingControllerMsg:
		GameInfo.data.usingController = await UI.show_yes_no_msg(self, "Are you using a controller? \n (Can always be changed in Settings)")
		GameInfo.data.askedUsingControllerMsg = true
		GameInfo.save_data()
		activate()

func _input(event):
	if GameInfo.data.usingController: Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	else: Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func close():
	%DarkenRect.visible = true
	%MainMenuComponents.visible = false

func reset(_component):
	%DarkenRect.visible = false
	%Settings.visible = false
	%Credits.visible = false
	%MainMenuComponents.visible = true
	activate()

func _on_new_game_btn_pressed() -> void:
	get_tree().change_scene_to_packed(loadingScreen)

func _on_settings_btn_pressed() -> void:
	close()
	%Settings.activate()
	%Settings.closed.connect(reset)

func _on_credits_btn_pressed() -> void:
	close()
	%Credits.activate()

func _on_quit_btn_pressed() -> void:
	if await UI.show_yes_no_msg(self):
		get_tree().quit()
