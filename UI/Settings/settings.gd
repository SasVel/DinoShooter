extends MenuComponent

func _ready():
	focusedComponent = %BackBtn

func activate():
	super()
	self.visible = true
	config_video_settings()
	config_vol_sliders()

func deactivate():
	GameInfo.save_data()
	self.visible = false
	closed.emit(self)

func config_video_settings():
	%SensitivitySlider.value = GameInfo.data.cameraSensitivity
	%ColorPickerButton.color = GameInfo.data.crossColor
	%OpacitySlider.value = GameInfo.data.crossOpacity
	%WidthSlider.value = GameInfo.data.crossWidth
	%LengthSlider.value = GameInfo.data.crossLength
	%InverseColorCheck.button_pressed = GameInfo.data.invertedColors
	%UsingControllerBtn.button_pressed = GameInfo.data.usingController
	%ControllerVibrationBtn.button_pressed = GameInfo.data.controllerVibration

func config_vol_sliders():
	%MainVolSlider.value = GameInfo.data.mainVol
	%MusicVolSlider.value = GameInfo.data.musicVol
	%SfxVolSlider.value = GameInfo.data.sfxVol

func _on_main_vol_slider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(value))
	GameInfo.data.mainVol = value

func _on_music_vol_slider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear_to_db(value))
	GameInfo.data.musicVol = value

func _on_sfx_vol_slider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), linear_to_db(value))
	GameInfo.data.sfxVol = value

func _on_back_btn_pressed():
	deactivate()

func _on_sensitivity_slider_value_changed(value):
	GameInfo.data.cameraSensitivity = value

func _on_color_picker_button_color_changed(color):
	GameInfo.data.crossColor = color

func _on_opacity_slider_value_changed(value):
	GameInfo.data.crossOpacity = value

func _on_width_slider_value_changed(value):
	GameInfo.data.crossWidth = value

func _on_length_slider_value_changed(value):
	GameInfo.data.crossLength = value

func _on_inverse_color_check_toggled(toggled_on):
	GameInfo.data.invertedColors = toggled_on

func _on_using_controller_btn_toggled(toggled_on):
	GameInfo.data.usingController = toggled_on

func _on_controller_vibration_btn_toggled(toggled_on):
	GameInfo.data.controllerVibration = toggled_on
