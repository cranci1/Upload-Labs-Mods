extends "res://scenes/window_dragger.gd"

func place() -> void:
	if Globals.max_window_count >= 1000:
		Signals.notify.emit("exclamation", "build_limit_reached")
		Sound.play("error")
	elif Utils.can_add_window(window):
		var instance: WindowContainer = load("res://scenes/windows/" + Data.windows[window].scene + ".tscn").instantiate()
		instance.name = window
		var instance_pos: Vector2 = Utils.screen_to_world_pos(global_position + size / 2)
		instance.global_position = (instance_pos - Vector2(175, instance.size.y / 2)).snappedf(50)
		Signals.create_window.emit(instance)
