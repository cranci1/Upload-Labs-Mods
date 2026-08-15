extends "res://scripts/schematics_tab.gd"

func update_node_count() -> void:
	if cur_schematic.is_empty(): return
	$SchematicPanel/RequirementContainer/Requirement.text = "%d/%d" % [required, 1000 - Globals.max_window_count]
	requirement_met = (Globals.max_window_count + required) <= 1000
	if (Globals.max_window_count + required) <= 1000:
		$SchematicPanel/RequirementContainer/Requirement.add_theme_color_override("font_color", Color("a0c6cf"))
	else:
		$SchematicPanel/RequirementContainer/Requirement.add_theme_color_override("font_color", Color.RED)
	$SchematicPanel/OptionsContainer/Add.disabled = !requirement_met
