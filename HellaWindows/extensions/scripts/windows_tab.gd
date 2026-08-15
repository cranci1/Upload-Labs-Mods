extends "res://scripts/windows_tab.gd"

func update_node_count() -> void:
	$WindowsContainer/TopContainer/Nodes/Label.text = "%d/%d" % [Globals.max_window_count, 1000]
	$WindowsContainer/TopContainer/SettingsPanel/ListStyle/Blocks.button_pressed = Data.node_menu_style == 0
	$WindowsContainer/TopContainer/SettingsPanel/ListStyle/List.button_pressed = Data.node_menu_style == 1

func _on_add_pressed() -> void :
	if Globals.max_window_count >= 1000:
		Signals.notify.emit("exclamation", "build_limit_reached")
		Sound.play("error")
		return
	elif Utils.can_add_window(cur_window):
		var window: WindowContainer = load("res://scenes/windows/" + Data.windows[cur_window].scene + ".tscn").instantiate()
		window.name = cur_window
		window.global_position = Vector2(Globals.camera_center - window.size / 2).snappedf(50)
		Signals.create_window.emit(window)
		Signals.set_menu.emit(0, 0)

func _on_window_selected(window: String) -> void :
	if Data.is_mobile():
		set_window(window)
	elif !window.is_empty():
		if Globals.max_window_count >= 1000:
			Signals.notify.emit("exclamation", "build_limit_reached")
			Sound.play("error")
			return
		elif Utils.can_add_window(window):
			add_window(window)

			if !Input.is_key_pressed(KEY_SHIFT):
				Signals.set_menu.emit(0, 0)