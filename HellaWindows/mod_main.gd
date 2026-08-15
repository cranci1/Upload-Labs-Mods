extends Node

const MOD_DIR := "cranci-HellaWindows"
const LOG_NAME := "cranci-HellaWindows:Main"

var mod_dir_path := ""
var extensions_dir_path := ""

func _init() -> void:
	mod_dir_path = ModLoaderMod.get_unpacked_dir().path_join(MOD_DIR)
	extensions_dir_path = mod_dir_path.path_join("extensions")

	ModLoaderMod.install_script_extension(extensions_dir_path.path_join("scenes/window_dragger.gd"))
	ModLoaderMod.install_script_extension(extensions_dir_path.path_join("scripts/windows_tab.gd"))
	ModLoaderMod.install_script_extension(extensions_dir_path.path_join("scripts/schematics_tab.gd"))
	ModLoaderMod.install_script_extension(extensions_dir_path.path_join("scripts/desktop.gd"))
