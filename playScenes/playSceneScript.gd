extends Node3D

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	Spawn.isSpawningPickups = true

func _input(event):
	if event.is_action_pressed("Leftclick"):
		if Input.mouse_mode == Input.MOUSE_MODE_VISIBLE:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _exit_tree():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	Spawn.isSpawningPickups = false
	GameData.reset.emit()
